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

<body>
    <div class="name">
        <label class="username">
            <span style="color:#ec5524;">*</span>
            <span>用户名：</span>
        </label>
        <div class="inp">
            <input type="text" class="form-control">
        </div>
    </div>
    <br>
    <br>
    <div class="id_img">
        <label class="img_cap">
            <span style="font-size: 16px;">上传头像：</span>
        </label>
        <div class="image">
            <img src="img/user.png"/>
        </div>
        <div class="btn-group" role="group" aria-label="..." id="btn" >          
            <input type="file" name="file" multiple="multiple" accpt="image/jgeg,image/jpg,image/png">
        </div> 
    </div>
    <div class="renzheng">
        <label>
            <span>认证类型：</span>
        </label>
            <img style="margin-left: 20px;"  src="img/geren.JPG"/>
    </div>
    <div class="btn-group" role="group" aria-label="..." id="btn" style="margin-top: 100px; margin-left: 100px;">          
        <button type="button" class="btn btn-default" id="button2" style="margin-bottom: 100px;">确认保存</button>
    </div> 
</body>

</html>