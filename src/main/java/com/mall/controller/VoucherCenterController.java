package com.mall.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.mall.component.ThreadVariable;
import com.mall.domain.RechargeRecord;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.RechargeRecordService;
import com.mall.service.UserService;
import com.mall.utils.AlipayConfig;
import com.mall.wx.entity.PayResult;
import com.mall.wx.entity.PreOrderResult;
import com.mall.wx.service.WxOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
public class VoucherCenterController {
    @Autowired
    private WxOrderService wxOrderService;
    @Autowired
    private RechargeRecordService rechargeRecordService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/goAlipay",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String goAlipay(String orderid, String orderprice,String ordername,Long userid,HttpServletRequest request, HttpServletResponse response)throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = orderid;
        //付款金额，必填
        String total_amount =orderprice;
        //订单名称，必填
        String subject =ordername;
        Long id=userid;
        //商品描述，可空
        String body ="虚拟币充值";
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        String result = alipayClient.pageExecute(alipayRequest).getBody();
        //输出
        return result;
    }

    //同步通知接口
    @RequestMapping(value = "/goAlipayReturnNotice")
    public String goAlipayReturnNotice(HttpServletRequest request, HttpServletResponse response,ModelMap map)throws Exception{
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
        }

            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
            System.out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
            if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
                throw new BusinessValidationException("请重新登录");
            }
            Long userId = ThreadVariable.getSession().getUserId();
            User user=userService.findUserById(userId);
            Long AccountYue=user.getAccountYue();
            String [] strs = total_amount.split("[.]");
            Long RechargeAmount=Long.parseLong(strs[0]);
            RechargeRecord rechargeRecord=new RechargeRecord();
            Long newAccountyue=AccountYue+RechargeAmount;
            user.setAccountYue(newAccountyue*10);
            userService.updateUser(user);
            rechargeRecord.setUserId(userId);
            rechargeRecord.setRechargeAmount(RechargeAmount);
            rechargeRecord.setAlipayOrderNum(out_trade_no);
            rechargeRecord.setAlipayTradeNum(trade_no);
            rechargeRecord.setAccountYue(newAccountyue*10);
            rechargeRecordService.addRechargeRecord(rechargeRecord);
            map.put("out_trade_no",out_trade_no);
            map.put("trade_no",trade_no);
            map.put("total_amount",total_amount);
        return"/return_url";
    }

    //异步通知接口
    @RequestMapping(value = "/goAlipayNotifyNotice")
    public String goAlipayNotifyNotice(){
        return "/notify_url";
    }

    @RequestMapping(value = "/index")
    public String products() throws Exception {

        return "index";
    }

    // TODO 实际情况需要自己业务订单的状态，此处仅仅用于测试
    public static boolean isOrderPaid = false;

    @RequestMapping(value = "/goweixinpay")
    public ModelAndView createPreOrder(String orderid, String orderprice,String ordername,Long userid, HttpServletRequest request, HttpServletResponse response) throws Exception {
        int num1 =Double.valueOf(orderprice).intValue();
        Integer num2=num1*100;
        String str1=String.valueOf(num2);
        // 商品描述
        String body = ordername;
        // 商户订单号
        String out_trade_no =orderid;
        // 订单总金额，单位为分
        String total_fee = str1;
        //用户id
        Long id=userid;
        // 统一下单
        PreOrderResult preOrderResult = wxOrderService.placeOrder(body, out_trade_no, total_fee);

        ModelAndView mv = new ModelAndView("payQrCode");
        mv.addObject("qrCodeUrl", preOrderResult.getCode_url());

        return mv;
    }


    @RequestMapping(value = "/wxPayIsSuccess")
    @ResponseBody
    public boolean wxPayIsSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // TODO 查看订单是否支付成功，成功返回true，失败返回false
        return isOrderPaid;
    }

    @RequestMapping(value = "/weixinnotify")
    public void notify(HttpServletRequest request, HttpServletResponse response) throws Exception {

        PayResult payResult = wxOrderService.getWxPayResult(request);

        boolean isPaid = payResult.getReturn_code().equals("SUCCESS") ? true : false;

        // 查询该笔订单在微信那边是否成功支付
        // 支付成功，商户处理后同步返回给微信参数
        PrintWriter writer = response.getWriter();
        if (isPaid) {
            System.out.println("================================= 支付成功 =================================");

            // ====================== 操作商户自己的业务，比如修改订单状态，生成支付流水等 start ==========================
            // TODO
            this.isOrderPaid = true;
            // ============================================ 业务结束， end ==================================

            // 通知微信已经收到消息，不要再给我发消息了，否则微信会8连击调用本接口
            String noticeStr = setXML("SUCCESS", "");
            writer.write(noticeStr);
            writer.flush();

        } else {
            System.out.println("================================= 支付失败 =================================");

            // 支付失败
            String noticeStr = setXML("FAIL", "");
            writer.write(noticeStr);
            writer.flush();
        }

    }

    /**
     *
     * @Description: 支付成功
     * @return
     * @throws Exception
     *
     * @author leechenxiang
     * @date 2017年9月1日 上午9:10:41
     */
    @RequestMapping(value = "/paySuccess")
    public String paySuccess() throws Exception {

        return "paySuccess";
    }

    public static String setXML(String return_code, String return_msg) {
        return "<xml><return_code><![CDATA[" + return_code + "]]></return_code><return_msg><![CDATA[" + return_msg + "]]></return_msg></xml>";
    }
}
