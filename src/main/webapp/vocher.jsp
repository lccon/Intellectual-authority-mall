<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usercenter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vocher.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
</head>

<body style="background: #fff;">

    <!--用户中心头部信息-->

    <!--侧边栏-->

    <!--中央显示区域-->
    <div><!--
        <ul>
            <li class="col-lg-3 col-sm-6 account-type" data-type="0">
                <div class="card card-blue active" data-type="sms">
                    <div class="card-header">
                        <h3 class="card-title">基本账户</h3>
                    </div>
                    <div class="card-body">
                        <p class="card-body-des mart large">账户余额（元）</p>
                        <p class="card-body-content"><span class="balance account-balance deep-orange fb super">${user.accountYue}.00</span>
                        </p>
                        <span class="icon">
                        </span>
                    </div>
                </div>
            </li>
        </ul>-->
        <ul>
            <li class="col-lg-3 col-sm-6 account-type" data-type="0">
                <div class="card card-blue active" data-type="sms">
                    <div class="card-header">
                        <h3 class="card-title">虚拟帐户</h3>
                    </div>
                    <div class="card-body">
                        <p class="card-body-des mart large">账户余额（虚拟币）</p>
                        <p class="card-body-content"><span class="balance account-balance deep-orange fb super">${user.virtualCoin*10}</span>
                        </p>
                        <span class="icon">
                        </span>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
    <div class="col-lg-12 col-sm-12" style="margin-top: 40px;margin-left: 37px;">
                    <!--主内容开始编辑-->
                    <div class="tr_recharge">
                        <div class="tr_rechtext">
                            <p class="te_retit"><img src="images/coin.png" alt="" />充值中心</p>
                            <p>1.提示信息。</p>
                            <p>2.提示信息。</p>
                        </div>
                        <form action="/goAlipay" class="am-form" id="doc-vld-msg">
                            <!--订单编号-->
                            <input id="WIDout_trade_no" name="orderid" type="hidden"/>
                            <!--订单名称-->
                            <input id="WIDsubject" name="ordername" type="hidden" value="测试"/>
                            <!--订单金额-->
                            <input id="orderprice" name="orderprice" type="hidden"/>
                            <!--用户id-->
                            <input id="id" name="id" type="" value="${user.id}"/>
                            <div class="tr_rechbox">
                                <div class="tr_rechhead">
                                    <img id="img1" src="images/ys_head2.jpg" />
                                    <script>
                                        var url11="${user.headPortrait}".split(",");
                                        var img1=document.getElementById("img1");
                                        img1.src="${pageContext.request.contextPath}"+url11[0];
                                    </script>
                                    <p>充值帐号：
                                        <a>${user.username}</a>
                                    </p>
                                </div>
                                <div class="tr_rechli am-form-group">
                                    <ul class="ui-choose am-form-group" id="uc_01">
                                        <li>
                                            <label class="am-radio-inline">
                                                <input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10￥
                                            </label>
                                        </li>
                                        <li>
                                            <label class="am-radio-inline">
                                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 20￥
                                            </label>
                                        </li>

                                        <li>
                                            <label class="am-radio-inline">
                                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 50￥
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
                                    <input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="充值金额范围：10-10000元" />
                                </div>
                                <div class="tr_rechcho am-form-group">
                                    <span>充值方式：</span>
                                    <label class="am-radio">
                                        <input type="radio" name="radio1" value="" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="images/wechatpay.png">
                                    </label>
                                    <label class="am-radio" style="margin-right:30px;">
                                        <input type="radio" name="radio1" value="" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="images/zfbpay.png">
                                    </label>
                                </div>
                                <div class="tr_rechnum">
                                    <span>应付金额：</span>
                                    <p class="rechnum" id="price">0.00元</p>
                                </div>
                            </div>
                            <div class="tr_paybox">
                                <input type="submit" value="确认支付" class="tr_pay am-btn"/>
                                <span>温馨提示：。</span>
                            </div>
                        </form>
                    </div>
                </div>

                <script type="text/javascript" src="js/jquery.min.js"></script>
                <script type="text/javascript" src="js/amazeui.min.js"></script>
                <script type="text/javascript" src="js/ui-choose.js"></script>
                <script type="text/javascript">

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
                            $('.rechnum').text('10.00元');
                            document.getElementById("orderprice").value="10.00";
                        })
                        $('#uc_01 li:eq(0)').click(function() {
                            $('.tr_rechoth').hide();
                            $('.rechnum').text('10.00元');
                            $('.othbox').val('');
                            document.getElementById("orderprice").value="10.00";
                        })
                        $('#uc_01 li:eq(1)').click(function() {
                            $('.tr_rechoth').hide();
                            $('.rechnum').text('20.00元');
                            $('.othbox').val('');
                            document.getElementById("orderprice").value="20.00";
                        })
                        $('#uc_01 li:eq(2)').click(function() {
                            $('.tr_rechoth').hide();
                            $('.rechnum').text('50.00元');
                            $('.othbox').val('');
                            document.getElementById("orderprice").value="50.00";
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
    </div>
</body>

</html>