<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="jsinclude.jsp"/>
    <jsp:include page="/admin/baseInclude.jsp" />
</head>

<body style="background-color: #e5e5e5e5;">

<nav class="navbar navbar-default navbar-fixed-top">
    <div id="login">
        <c:if test="${userRealName!=null}">
            <ul>
                <li>
                    <a href="/usercenter.jsp">个人中心</a>
                </li>
            </ul>
        </c:if>
        <ul>
            <li>
                <c:if test="${userRealName!=null}">
                    <a href="/usercenter.jsp"><span class="glyphicon glyphicon-user"></span>${userRealName}</a>
                    <a class="quit" href="/admin/userlogout">退出</a>
                </c:if>
                <c:if test="${userRealName==null}">
                    <a href="/login.jsp"><span class="glyphicon glyphicon-user"></span>登录</a>/
                    <a href="/register.jsp">注册</a>
                </c:if>
            </li>

        </ul>
    </div>
    <div class="container">
        <div class="navbar-header">
            <a href="index.jsp" class="navbar-brand logo"><img src="#" alt="公司logo"></a>
        </div>
    </div>
</nav>
<div style="margin-top:100px;background-color: #e5e5e5e5;" >
    <ol class="breadcrumb" style="background-color: #e5e5e5e5;" >
        <li><a href="/">返回首页</a></li>
        <li>信息发布</li>
    </ol>
</div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="top-title">
                    <ol class="breadcrumb" style="margin-left:300px; background-color: #e5e5e5e5;">
                        <li> <label class="num"  style="background-color: #666;">1</label>
                            选择身份类别（代办公司<a href="post-message.jsp" style="color:#f46">重选</a>）
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num">2</label>
                            填写信息
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num"  style="background-color: #666;">3</label>
                            完成发布
                        </li>
                    </ol>
                   
                    <div class="main1">
                       <div class="cap1">
                           <span>基本信息</span>
                       </div>
                        <form id="maintainForm" method="post" action="/authorizeCompany/addAuthorizeCompany">                           <div class="p-cap">
                               <label class="p-lab" style="margin-left: 160px;">
                                   <em class="form-req">*</em>
                                   公司名称：
                               </label>
                               <input type="text"  name="companyName" id="companyName" maxlength="20" class="input-60 input"/>
                           </div>
                           <div class="fenlei">
                               <label style="margin-left: 128px;" class="p-lab">
                                   <em class="form-req">*</em>
                                   主办业务分类：
                               </label>
                               <select name="businessCategory">
                                   <option value=></option>
                                   <option value="1">申请专利</option>
                                   <option value="2">证书买卖</option>
                                   <option value="3">技术成果转让</option>
                                   <option value="4">法律咨询</option>
                               </select>
                           </div>
                           <div class="p-wzxq">
                               <label class="p-lab"style="margin-left: 128px;">
                                   <em class="form-req">*</em>
                                   公司详情描述：

                               </label>
                           </div>
                           <div>
                               <script id="container" name="companyDescribe" type="text/plain">

                               </script>
                           </div>
                        <div class="p-zl" style="margin-top:80px;">
                            <label class="p-lab" style="margin-left: 160px;">
                                <em class="form-req">*</em>
                                友情链接：
                            </label>
                            <input type="text" name="title" maxlength="25" class="input-60 input"/>
                        </div>
                           <div class="p-pic">
                               <label class="p-lab" style="margin-left: 160px;">
                                   <em class="form-req">*</em>公司图片：
                               </label>
                               <div class="chuans">
                                   <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                                   <input class="uploadImg file1" type="file" onchange="uploadImage(this);" name="file1" >
                                   <span class="delx glyphicon glyphicon-remove"></span>
                               </div>
                               <input type="hidden" name="companyPictureUrl" id="companyPictureUrl" value=""/>
                           </div>
                            <div class="p-zd">
                                <label class="p-lab" style="margin-left: 160px;">是否置顶：</label>
                                <input type="radio" style="margin-left: 20px;" name="zhiding" value="yes" class="checkbox-radio">置顶
                                <input type="radio"  style="margin-left: 20px;" name="zhiding" value="no" class="checkbox-radio">不置顶
                            </div>
                            <div class="p-cap">
                                <label class="p-lab" style="margin-left: 144px;">发布人姓名：</label>
                                <input type="text" name="realName" maxlength="25" class="input-60 input"/>
                            </div>
                            <div class="p-cap">
                                <label class="p-lab"style="margin-left: 176px;">手机号：</label>
                                <input type="text" class="input-60 input" name="mobile" id="tel_num" value="" onblur="LXDHonblus()" onfocus="LXDHonfocu()"/>
                                <span  type="button" class="code-btn">获取验证码</span>
                                &nbsp;<span id="tip_phone" class="msg-box"><span id="tip_phone1"></span></span>
                            </div>
                            <div class="p-cap">
                                <label class="p-lab" style="margin-left: 144px;">短信验证码：</label>
                                <input style="margin-top:20px; width:100px;" type="tel" name="" id="code_num" class="input-60 input" lay-verify="required|phone" value="" onblur="YZMonblus()" onfocus="YZMonfou()"/>
                                &nbsp;<span style="margin-top:17px; width:200px;" id="tip_code_num" class="msg-box"><span id="tip_code_num1"></span></span>
                            </div>
                            <button class="btn btn-default" id="button2" style="margin-left: 250px;margin-top: 50px; margin-bottom: 20px;">提交</button>
                        </form>
                    </div>
                </div>
                </div>
            
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>
</html>