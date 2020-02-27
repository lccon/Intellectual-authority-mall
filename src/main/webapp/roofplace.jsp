
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>置顶</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <jsp:include page="admin/baseInclude.jsp"/>
</head>
<body>
<div class="pay">
    <!--主内容开始编辑-->
    <div class="tr_recharge">
            <!--用户id-->
            <input id="userid" name="userid" type="hidden" value="${UserId}" />
            <input type="hidden" name="topDuration" id="topDuration"/>
            <input type="hidden" name="authorizeState" value="0"/>
            <div class="tr_rechbox">
                <div class="tr_rechhead">
                    <div class="tr_rechheadcion" style="float: left;">
                        <span>当前余额：<span id="AccountYue"></span></span>
                    </div>
                </div>
                <div class="tr_rechli am-form-group">
                    <ul class="ui-choose am-form-group" id="uc_01">
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10天
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 20天
                            </label>
                        </li>

                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 50天
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他天数
                            </label>
                        </li>
                    </ul>
                </div>
                <div class="tr_rechoth am-form-group">
                    <span>其他天数：</span>
                    <input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="置顶天数范围：10-10000天" />
                </div>
                <div class="tr_rechnum">
                    <span>应付虚拟币：</span>
                    <p class="rechnum" id="price">0.00</p>
                </div>
            </div>
            <div class="tr_paybox">
                <a class="tr_pay am-btn" onclick="zzz();">确认支付</a>
                <span>温馨提示：虚拟币比例为1：10，如您虚拟币不够请先进行<a id="test1" href="javascript:void(0)" style="color:#f46;">充值</a>。</span>
            </div>
    </div>
</div>

</body>
</html>
