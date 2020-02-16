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
    <div class="col-lg-12 col-sm-12" style="margin-top: 40px;margin-left: 37px;">
        <div class="panel1">
            <div class="panel-body">
                <dl class="dl-horizontal deep-blue large">
                    <dt class="cap">充值方式：</dt>
                    <dd>
                        <div class="zfb">
                            <input type="radio" name="pays" class="ds" checked>
                            <img src="img/zhifubao.png">
                        </div>
                        <div class="wx">
                            <input type="radio" name="pays" class="ds">
                            <img src="img/weixin.png">
                        </div>
                    </dd>
                    <div class="top_up_amount">
                        <dt class="cap">充值金额：</dt>
                        <dd class="top_up_amount">
                            <ul class="list-group">
                                <li class="col-lg-3 col-sm-3" data-value="2000" tabindex="1">
                                    ￥10 
                                    <i class="fa fa-check">
                                    </i>
                                </li>
                                <li class="col-lg-3 col-sm-3" data-value="2000" tabindex="1">
                                    ￥15 
                                    <i class="fa fa-check">
                                    </i>
                                </li>
                                <li class="col-lg-3 col-sm-3" data-value="2000" tabindex="1">
                                    ￥20 
                                    <i class="fa fa-check">
                                    </i>
                                </li>
                                <li class="col-lg-3 col-sm-3" data-value="2000" tabindex="1"> 
                                    ￥25 
                                    <i class="fa fa-check">
                                    </i>
                                </li>
                                <li class="col-lg-6 col-sm-6 other">
                                    <div class="input-group col-lg-12 col-sm-12">
                                        <span class="input-group-addon bg-white">￥</span>
                                        <input type="text" id="top-up-number" maxlength="15" class="form-control" oninput="clearNoNum(this)" placeholder="请输入充值金额">
                                    </div>
                                </li>
                            </ul>
                        </dd>
                        <dd>
                            <cite style="font-size: 14px;">
                                虚拟币充值比例为1元等于10虚拟币
                            </cite>
                        </dd>
                        <dd>
                            <button class="btn btn-default" id="btn">立即充值</button>
                        </dd>   
                    </div>
                </dl>
            </div>
        </div>
    </div>
</div>
</body>

</html>