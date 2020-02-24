package com.mall.domain;

import com.mall.base.BaseDomain;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
public class RechargeRecord extends BaseDomain {

    /** 主键id */
    private Long id;
    /** 充值金额 */
    private Long rechargeAmount;
    /** 消费金额 */
    private Long consumeAmount;
    /** 支付宝订单号 */
    private String alipayOrderNum;
    /** 支付宝交易号 */
    private String alipayTradeNum;
    /** 微信订单号 */
    private String wechatOrderNum;
    /** 微信交易号 */
    private String wechatTradeNum;
    /** 账户余额 */
    private Long accountYue;
    /** 用户id */
    private Long userId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRechargeAmount() {
        return rechargeAmount;
    }

    public void setRechargeAmount(Long rechargeAmount) {
        this.rechargeAmount = rechargeAmount;
    }

    public Long getConsumeAmount() {
        return consumeAmount;
    }

    public void setConsumeAmount(Long consumeAmount) {
        this.consumeAmount = consumeAmount;
    }

    public String getAlipayOrderNum() {
        return alipayOrderNum;
    }

    public void setAlipayOrderNum(String alipayOrderNum) {
        this.alipayOrderNum = alipayOrderNum;
    }

    public String getAlipayTradeNum() {
        return alipayTradeNum;
    }

    public void setAlipayTradeNum(String alipayTradeNum) {
        this.alipayTradeNum = alipayTradeNum;
    }

    public String getWechatOrderNum() {
        return wechatOrderNum;
    }

    public void setWechatOrderNum(String wechatOrderNum) {
        this.wechatOrderNum = wechatOrderNum;
    }

    public String getWechatTradeNum() {
        return wechatTradeNum;
    }

    public void setWechatTradeNum(String wechatTradeNum) {
        this.wechatTradeNum = wechatTradeNum;
    }

    public Long getAccountYue() {
        return accountYue;
    }

    public void setAccountYue(Long accountYue) {
        this.accountYue = accountYue;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
