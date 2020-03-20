
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>充值中心</title>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
<jsp:include page="admin/baseInclude.jsp"/>
</head>
<body>
<div class="pay">
    <!--主内容开始编辑-->
    <div class="tr_recharge">
        <div class="tr_rechtext">
            <p class="te_retit"><img src="images/coin.png" alt="" />充值中心</p>
            <p>1.本平台仅支持用“科豆”进行交易支付，兑换比例为1:10，例：“1元=10科豆”。</p>
            <p>2.“科豆”兑换仅限于本平台交易支付使用，一旦兑换成功，概不能提现退款，请您谨慎充值。</p>
        </div>
        <form action="/goAlipay" class="am-form" id="payform">
            <!--订单编号-->
                <input id="WIDout_trade_no" name="orderid" type="hidden"/>
            <!--订单名称-->
                <input id="WIDsubject" name="ordername" type="hidden" value="科豆充值"/>
            <!--订单金额-->
                <input id="orderprice" name="orderprice" type="hidden"/>
            <!--用户id-->
                <input id="userid" name="userid" type="hidden" value="${UserId}"/>
            <div class="tr_rechbox">
                <div class="tr_rechhead">
                    <img src="images/ys_head2.jpg" />
                    <p>充值帐号：
                        <a>${userRealName}</a>
                    </p>
                    <div class="tr_rechheadcion">
                        <img src="images/coin.png" alt="" />
                        <span>当前余额：<span id="AccountYue"></span></span>
                    </div>
                </div>
                <div class="tr_rechli am-form-group">
                    <ul class="ui-choose am-form-group" id="uc_01">
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> 20￥
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 50￥
                            </label>
                        </li>

                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 100￥
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他金额
                            </label>
                        </li>
                    </ul>
                </div>
                <div class="tr_rechoth am-form-group">
                    <span>其他金额：</span>
                    <input type="number" min="20" max="10000" value="20.00元" class="othbox" data-validation-message="充值金额范围：20-10000元" />
                </div>
                <div class="tr_rechcho am-form-group">
                    <span>充值方式：</span>
                    <label class="am-radio">
                        <input type="radio" name="radio1" value="" data-am-ucheck required data-validation-message="请选择一种充值方式" onclick="weixinvouc()"><img src="images/wechatpay.png">
                    </label>
                    <label class="am-radio" style="margin-right:30px;">
                        <input type="radio" name="radio1" value="" data-am-ucheck data-validation-message="请选择一种充值方式" onclick="zfbvouc()"><img src="images/zfbpay.png">
                    </label>
                </div>
                <div class="tr_rechnum">
                    <span>应付金额：</span>
                    <p class="rechnum" id="price">0.00元</p>
                </div>
            </div>
            <div class="tr_paybox">
                <input type="submit" value="确认支付" class="tr_pay am-btn"/>
                <span>温馨提示：一旦发生账户安全及各类充值问题，如：充值失败、兑换比例错误等，可联系本平台客服为您解决。</span>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
<script type="text/javascript">
    function weixinvouc() {
        document.getElementById("payform").action = "/goweixinpay";
    }
    function zfbvouc() {
        document.getElementById("payform").action = "/goAlipay";
    }
    window.onload=function () {
        $.ajax({
            type:"POST",
            url: "/roofPlace/getUseraccountYue",
            success: function(result) {
                document.getElementById("AccountYue").innerText=result+"科豆";
            },
        })
    }

    // 将所有.ui-choose实例化
    $('.ui-choose').ui_choose();
    // uc_01 ul 单选
    var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
    uc_01.click = function(index, item) {
        console.log('click', index, item.text())
    }
    uc_01.change = function(index, item) {
        console.log('change', index, item.text())
    }
    $(function() {
        $('#uc_01 li:eq(3)').click(function() {
            $('.tr_rechoth').show();
            $('.tr_rechoth').find("input").attr('required', 'true')
            $('.rechnum').text('20.00元');
            document.getElementById("orderprice").value="20.00";
        })
        $('#uc_01 li:eq(0)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('20.00元');
            $('.othbox').val('');
            document.getElementById("orderprice").value="0.01";
        })
        $('#uc_01 li:eq(1)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('50.00元');
            $('.othbox').val('');
            document.getElementById("orderprice").value="50.00";
        })
        $('#uc_01 li:eq(2)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('100.00元');
            $('.othbox').val('');
            document.getElementById("orderprice").value="100.00";
        })
        $(document).ready(function() {
            $('.othbox').on('input propertychange', function() {
                var num = $(this).val();
                $('.rechnum').html(num + ".00元");
                document.getElementById("orderprice").value=num+".00";
            });
        });
    })

    $(function() {
        $('#doc-vld-msg').validator({
            onValid: function(validity) {
                $(validity.field).closest('.am-form-group').find('.am-alert').hide();
            },
            onInValid: function(validity) {
                var $field = $(validity.field);
                var $group = $field.closest('.am-form-group');
                var $alert = $group.find('.am-alert');
                // 使用自定义的提示信息 或 插件内置的提示信息
                var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                if(!$alert.length) {
                    $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                    appendTo($group);
                }
                $alert.html(msg).show();
            }
        });
    });
</script>
<script>
    function GetDateNow() {
        var vNow = new Date();
        var sNow = "";
        sNow += String(vNow.getFullYear());
        sNow += String(vNow.getMonth() + 1);
        sNow += String(vNow.getDate());
        sNow += String(vNow.getHours());
        sNow += String(vNow.getMinutes());
        sNow += String(vNow.getSeconds());
        sNow += String(vNow.getMilliseconds());
        document.getElementById("WIDout_trade_no").value=sNow;

    }
    GetDateNow();


</script>
</body>
</html>
