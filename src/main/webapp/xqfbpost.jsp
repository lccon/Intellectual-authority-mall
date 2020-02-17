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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/post-message.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/post-message.js"></script>
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

    <div class="container" style="margin-top: 100px;">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="top-title">
                    <ol class="breadcrumb" style="margin-left:300px; background-color: #e5e5e5e5;">
                        <li> <label class="num"  style="background-color: #666;">1</label>
                            选择身份类别（需求任务发布<a href="post-message.jsp" style="color:#f46">重选</a>）
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
                        <form id="maintainForm" method="post" action="/taskRelease/addTaskRelease">
                        <div class="p-zd">
                            <label class="p-lab" style="margin-left: 176px;">
                                <em class="form-req">*</em>
                                您想要：
                            </label>
                            <input type="radio" name="taskCategory" value="1" class="checkbox-radio">申请
                            <input type="radio" name="taskCategory" value="2" class="checkbox-radio">购买
                        </div>
                           <div class="fenlei">
                               <label style="margin-left: 128px;" class="p-lab">
                                   <em class="form-req">*</em>
                                   知识产权类型：
                               </label>
                               <select name="intellectualProperty">
                                   <option value></option>
                                   <option value="1">发明</option>
                                   <option value="2">实用新型</option>
                                   <option value="3">外观</option>
                                   <option value="4">商标</option>
                                   <option value="5">版权</option>
                               </select>
                           </div>
                           <div class="fenlei">
                            <label style="margin-left: 128px;" class="p-lab">
                                <em class="form-req">*</em>
                                选择行业分类：
                            </label>
                               <select name="industryBelongs">
                                   <option value></option>
                                   <option value="1">生活需要</option>
                                   <option value="2">交通运输</option>
                                   <option value="3">化学化工</option>
                                   <option value="4">轻工纺织</option>
                                   <option value="5">建筑建材</option>
                                   <option value="6">机械照明</option>
                                   <option value="7">新能源</option>
                                   <option value="8">电力电气</option>
                                   <option value="9">武器爆破</option>
                                   <option value="10">农林牧业</option>
                                   <option value="11">视频饮料</option>
                                   <option value="12">家具用品</option>
                                   <option value="13">教育休闲</option>
                                   <option value="14">医药医疗</option>
                                   <option value="15">电子信息源</option>
                                   <option value="16">仪器仪表</option>
                                   <option value="17">包装印刷</option>
                                   <option value="18">新型材料</option>
                                   <option value="19">海洋开发</option>
                                   <option value="20">航空航天</option>
                                   <option value="21">采矿冶金</option>
                                   <option value="22">橡胶塑料</option>
                                   <option value="23">安全防护</option>
                                   <option value="24">节能环保</option>
                                   <option value="25">其他</option>
                               </select>
                        </div>
                            <div class="p-wzxq">
                                <label class="p-lab"style="margin-left: 192px;">
                                    <em class="form-req">*</em>
                                    用途：
                                </label>
                            </div>
                            <div style="margin-left: 266px;">
                                <textarea class="input" name="purpose"  maxlength="5000" size="5" style="overflow:hidden;resize:horizontal; width:390px;height: 115px;"></textarea>
                            </div>
                            <div class="p-wzxq">
                                <label class="p-lab"style="margin-left: 160px;">
                                    <em class="form-req">*</em>
                                    详细说明：

                                </label>
                            </div>
                            <div>
                                <script id="container" name="detailedDesc" type="text/plain">

                                </script>
                            </div>
                        <div class="p-zd" style="margin-top: 80px;">
                            <label class="p-lab" style="margin-left: 160px;">是否置顶：</label>
                            <input type="checkbox" name="zhiding" value="yes" class="checkbox-radio">置顶
                            <input type="checkbox" name="buzhiding" value="no" class="checkbox-radio">不置顶
                        </div>
                        <div class="p-cap">
                            <label class="p-lab" style="margin-left: 144px;">发布人姓名：</label>
                            <input type="text" name="name" maxlength="25" class="input-60 input"/>
                        </div>
                        <div class="p-cap">
                            <label class="p-lab"style="margin-left: 176px;">手机号：</label>
                            <input type="text" name="phone" maxlength="25" class="input-60 input"/>
                        </div>
                        <div class="p-cap">
                            <label class="p-lab" style="margin-left: 144px;">短信验证码：</label>
                            <input type="text" maxlength="25" class="input-60 input"/>
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
<script type="text/javascript">
    $(document).ready(function(){
        UE.getEditor('container');

        $("#maintainForm").formValidate({
            rules:{
                "purpose":{
                    required:true,
                    minlength:1,
                    maxlength:500
                },
                "detailedDesc":{
                    required:true,
                    minlength:1,
                    maxlength:1000
                }
            },
            messages:{
                "productBrief":{
                    required:"请输入用途",
                    minlength:$.format("用途至少需要输入{0}个字符"),
                    minlength:$.format("用途最多需要输入{0}个字符"),
                },
                "detailedDesc":{
                    required:"请输入详细说明",
                    minlength:$.format("详细说明至少需要输入{0}个字符"),
                    minlength:$.format("详细说明最多需要输入{0}个字符"),
                }
            },
            submitHandler: function(form) {
                $(form).ajaxSubmit({
                    success: function(data){
                        if(data != null && !data.id){
                            $.messageBox({
                                message:"新增失败",
                                level: "error"
                            });
                            return;
                        }
                        $("#taskReleaseList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#taskReleaseDialog").dialog("close");
                    },
                    error: function(data){
                        alert("提交数据发生错误！");
                    }
                });
            }
        });

    });

</script>
</html>