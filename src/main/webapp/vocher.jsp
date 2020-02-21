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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/usercenter.css">
    <link rel="stylesheet" href="css/vocher.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="layui/layui.all.js"></script>

</head>

<body style="background-color: #fff;">

    <!--用户中心头部信息-->

    <!--侧边栏-->

    <!--中央显示区域-->
    <div style="margin-left: 50px;">
    <div style="margin-top: 80px;">
        <ul>
            <li class="col-lg-3 col-sm-6 account-type" data-type="0">
                <div class="card card-blue active" data-type="sms">
                    <div class="card-header">
                        <h3 class="card-title">基本账户</h3>
                    </div>
                    <div class="card-body">
                        <p class="card-body-des mart large">账户余额（元）</p>
                        <p class="card-body-content"><span class="balance account-balance deep-orange fb super">10.000</span>
                        </p> 
                        <span class="icon">
                        </span>
                    </div>
                </div>
            </li>
        </ul>
        <ul>
            <li class="col-lg-3 col-sm-6 account-type" data-type="0">
                <div class="card card-blue active" data-type="sms">
                    <div class="card-header">
                        <h3 class="card-title">虚拟帐户</h3>
                    </div>
                    <div class="card-body">
                        <p class="card-body-des mart large">账户余额（虚拟币）</p>
                        <p class="card-body-content"><span class="balance account-balance deep-orange fb super">10.000</span>
                        </p> 
                        <span class="icon">
                        </span>
                    </div>
                </div>
            </li>
        </ul>
    </div>
        <label>我要充值：</label>
        <button id="vocher" type="button">充值</button>
        <script type="text/javascript">
            $('#vocher').on('click', function () {
                layer.open({
                    type: 2,
                    title: false,
                    closeBtn: 0, //不显示关闭按钮
                    shade: [0],
                    area: ['340px', '215px'],
                    offset: 'rb', //右下角弹出
                    time: 2000, //2秒后自动关闭
                    anim: 2,
                    content: ['vouchercenter.jsp', 'no'], //iframe的url，no代表不显示滚动条
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
</div>
</body>

</html>