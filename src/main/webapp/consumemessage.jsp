
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购买发布信息数量</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <jsp:include page="admin/baseInclude.jsp"/>
</head>
<style>
    .othbox {
        width: 100px;
        background: #fff;
        border: 2px solid #CCCCCC;
        font-size: 16px;
        height: 48px;
        border-radius: 4px;
        float: left;
        margin-right: 30px;
    }
</style>
<body>
<div class="pay">
    <!--主内容开始编辑-->
    <div class="tr_recharge">
        <!--用户id-->
        <input id="userid" name="userid" type="hidden" value="${UserId}" />
        <input type="hidden" name="topDuration" id="topDuration"/>
        <input type="hidden" name="authorizeState" value="1"/>
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
                            <input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10条
                        </label>
                    </li>
                    <li>
                        <label class="am-radio-inline">
                            <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 20条
                        </label>
                    </li>

                    <li>
                        <label class="am-radio-inline">
                            <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 50条
                        </label>
                    </li>
                    <li>
                        <label class="am-radio-inline">
                            <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他条数
                        </label>
                    </li>
                </ul>
            </div>
            <div class="tr_rechoth am-form-group">
                <span>其他条数：</span>
                <input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="购买条数范围：10-10000条" />
            </div>
            <div class="tr_rechnum">
                <span>应付虚拟币：</span>
                <p class="rechnum" id="price">0.00</p>
            </div>
        </div>
        <div class="tr_paybox">
            <a id="pay" class="tr_pay am-btn" onclick="zzz();">确认支付</a>
            <span>温馨提示：虚拟币比例为1：10，如您虚拟币不够请先进行<a id="test1" href="javascript:void(0)" style="color:#f46;">充值</a>。</span>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
<script type="text/javascript">
    //页面层-自定义
    function zzz() {
        console.log("zzz");
        var price=document.getElementById("price");
        var accountyue=parseFloat(price.innerText);
        var accountyue1=parseFloat(document.getElementById("AccountYue").innerText);
        console.log(accountyue<accountyue1);
        if(accountyue>accountyue1){
            console.log(accountyue,accountyue1);
            layer.msg('您的余额不足请先进行充值', {
                time: 5000, //5s后自动关闭
            });
        }
        else{
            $.ajax({
                type:"POST",
                url: "/rechargeRecord/consumemessage?consume="+accountyue+"&FreeMessageNum="+accountyue/10,
                success: function(result) {
                    window.close();
                    parent.window.location.href="/userCenter";
                },
            })


        }
    }




    window.onload=function () {
        $.ajax({
            type:"POST",
            url: "/roofPlace/getUseraccountYue",
            success: function(result) {
                document.getElementById("AccountYue").innerText=result+"虚拟币";
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
            $('.rechnum').text('100.00');
            document.getElementById("topDuration").value="100";
        })
        $('#uc_01 li:eq(0)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('100.00');
            $('.othbox').val('');
            document.getElementById("topDuration").value="100";
        })
        $('#uc_01 li:eq(1)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('200.00');
            $('.othbox').val('');
            document.getElementById("topDuration").value="200";
        })
        $('#uc_01 li:eq(2)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('500.00');
            $('.othbox').val('');
            document.getElementById("topDuration").value="500";
        })
        $(document).ready(function() {
            $('.othbox').on('input propertychange', function() {
                var num = $(this).val();
                $('.rechnum').html(num + "0.00");
                document.getElementById("topDuration").value=num;
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
    $('#test1').on('click', function () {
        layer.open({
            type: 2,
            title: false,
            closeBtn: 0, //不显示关闭按钮
            shade: [0],
            area: ['340px', '215px'],
            offset: 'rb', //右下角弹出
            time: 2000, //2秒后自动关闭
            anim: 2,
            content: ['/vouchercenter.jsp', 'no'], //iframe的url，no代表不显示滚动条
            end: function () { //此处用于演示
                layer.open({
                    type: 2,
                    title: '充值中心',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: '/vouchercenter.jsp'
                });
            }
        });

    });
</script>
</body>
</html>
