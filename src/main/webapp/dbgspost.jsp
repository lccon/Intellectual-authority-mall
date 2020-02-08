<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body style="background-color: #e5e5e5e5;">

    <jsp:include page="head.jsp"/>

    <div class="container" style="margin-top: 80px;">
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
                       <div class="cap">
                           <span>基本信息</span>
                       </div>
                       <form id="zscqpost" action="#" method="post" style class="post-message">
                           <div class="p-cap">
                               <label class="p-lab" style="margin-left: 360px;">公司名称：</label>
                               <input type="text" name="title" maxlength="20" class="input-60 input"/>
                           </div>
                           <div class="fenlei">
                               <label style="margin-left: 328px;" class="p-lab">主办业务分类：</label>
                               <select class="input" name="主办业务分类">
                                   <option value></option>
                                   <option value="申请专利">申请专利</option>
                                   <option value="证书买卖">证书买卖</option>
                                   <option value="技术成果转让">技术成果转让</option>
                                   <option value="法律咨询">法律咨询</option>
                               </select>
                           </div>
                        <div class="p-wzxq">
                            <label class="p-lab"style="margin-left: 328px;">公司详情描述：</label>
                            <textarea class="input" name="content" maxlength="5000" size="5" style="overflow:hidden;resize:horizontal; height: 115px;"></textarea>
                        </div>
                        <div class="p-zl">
                            <label class="p-lab" style="margin-left: 360px;">友情链接：</label>
                            <input type="text" name="title" maxlength="25" class="input-60 input"/>
                        </div>
                        <div class="p-zd">
                            <label class="p-lab" style="margin-left: 360px;">是否置顶：</label>
                            <input type="checkbox" name="zhiding" value="yes" class="checkbox-radio">置顶
                            <input type="checkbox" name="buzhiding" value="no" class="checkbox-radio">不置顶
                        </div>
                        <div class="p-cap">
                            <label class="p-lab" style="margin-left: 344px;">发布人姓名：</label>
                            <input type="text" name="name" maxlength="25" class="input-60 input"/>
                        </div>
                        <div class="p-cap">
                            <label class="p-lab"style="margin-left: 376px;">手机号：</label>
                            <input type="text" name="phone" maxlength="25" class="input-60 input"/>
                        </div>
                        <div class="p-cap">
                            <label class="p-lab" style="margin-left: 344px;">短信验证码：</label>
                            <input type="text" maxlength="25" class="input-60 input"/>
                        </div>                     
                        <button class="btn btn-default" id="button2" style="margin-left: 450px;margin-top: 50px; margin-bottom: 20px;">提交</button>
                       </form>
                    </div>
                </div>
                </div>
            
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>

</html>