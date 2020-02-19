<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/usercenter.css">
</head>

<body >
<div style="width:80px;">
    <ul>
        <li id="title">我的认证</li>
    </ul>
</div>
   <div style="background-color: #fff;">
       <div style="margin-left: 50px;">
    <div class="titleline">
        <div class="title">
            请进入个人认证或企业认证
            <hr>
        </div>
    </div>
    <div class="container1" style="margin-top: 20px;">
            <label><input name="f1" id="geren" type="radio" value="" checked/>个人认证 </label> 
            <label style="margin-left: 20px;"><input name="f1" id="qiye" type="radio" value="" />企业认证 </label>         
    </div>

    <div class="container1" id="grmodel">
        <div class="into" style="margin-top: 20px;">
            <p>
                请输入真实姓名和身份证号，并上传证明图片，我们不会泄露您的个人信息。
            </p>
        </div>
        <div class="lab">
            <label>
                <span>真实姓名</span>
                <input style="margin-left: 20px; margin-top: 20px;" type="text">        
            </label>
            
        </div>
        <div class="lab">
            <label>
                <span>身份证号</span>
                <input style="margin-left: 20px; margin-top: 20px;" type="text">        
            </label>
        </div>
            <button type="button" id="button2" style="margin-left: 50px; margin-bottom: 100px;">提交绑定</button>
</div>
<div class="container" id="qymodel" style="display: none;">
    <div class="into" style="margin-top: 20px;">
        <p>
            请您如实添写以下营业执照信息
        </p>
    </div>
    <div class="lab">
        <label>
            <span>工商注册号</span>
            <input style="margin-left: 20px; margin-top: 20px;" type="text">        
        </label>
        
    </div>
    <div class="lab">
        <label>
            <span>公司名称&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input style="margin-left: 20px; margin-top: 20px;" type="text">        
        </label>
    </div>

    <div style="margin-top: 20px;">
        <label>
            <span>上传营业执照：</span>
        </label>
        <div class="btn-group" role="group" aria-label="...">          
            <input type="file" name="file" multiple="multiple" accpt="image/jgeg,image/jpg,image/png">
        </div> 
    </div>

    <div class="tip">
        <br>
        <br>
        <br>
        以下证件可以通过营业执照的验证：
        <br>
        1.营业执照条件（正副本皆可）；
        <br>
        2.营业执照正本复印件加盖公司彩章；
        <br>
        3.营业执照副本复印件加盖公司彩章；
        <br>
        详见下方样图，图片需清晰无水印
    </div>
    <div class="licence" style="width: 256px; float: left;">
        <img src="img/yingyezhizhangzheng.png"/>
        <p style="margin-left: 40px;">营业执照正本原件图样</p>
        
    </div>
    <div class="licence" style="width: 256px; float: left;margin-top: 30px;">
        <img src="img/yingyezhizhangfu.png"/>
        <p style="margin-left: 15px;">加盖公司彩章的执照复印件图样</p>
    </div>
    <div style="margin-top: 400px; margin-bottom: 100px;">
        <button type="button" id="button2">提交绑定</button>
    </div>
</div>
       </div>
   </div>
<script>
    var geren = document.getElementById("geren");
    var qiye=document.getElementById("qiye");
    geren.onclick = function () {
        grmodel.style.display = "block";
        qymodel.style.display="none";
    }
    qiye.onclick = function () {
        grmodel.style.display = "none";
        qymodel.style.display="block";
    }
</script>

</body>

</html>