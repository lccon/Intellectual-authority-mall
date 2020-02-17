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
                                   <img src="img/file.png" alt="" data-imgsrc="img/file.png">
                                   <input class="uploadImg file1" type="file" onchange="uploadImage(this);" name="file1" >
                                   <span class="delx glyphicon glyphicon-remove"></span>
                               </div>
                               <input type="hidden" name="companyPictureUrl" id="companyPictureUrl" value=""/>
                           </div>
                        <div class="p-zd">
                            <label class="p-lab" style="margin-left: 160px;">是否置顶：</label>
                            <input type="radio" name="1" value="yes" class="checkbox-radio">置顶
                            <input type="radio" name="1" value="no" class="checkbox-radio">不置顶
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
                "companyName":{
                    required:true,
                    minlength:1,
                    maxlength:50
                },
                "companyDescribe":{
                    required:true,
                    minlength:1,
                    maxlength:1000
                }
            },
            messages:{
                "companyName":{
                    required:"请输入公司名称",
                    minlength:$.format("公司名称至少需要输入{0}个字符"),
                    minlength:$.format("公司名称最多需要输入{0}个字符"),
                },
                "companyDescribe":{
                    required:"请输入公司介绍",
                    minlength:$.format("公司介绍至少需要输入{0}个字符"),
                    minlength:$.format("公司介绍最多需要输入{0}个字符"),
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
                        $("#authorizeCompanyList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#authorizeCompanyDialog").dialog("close");
                    },
                    error: function(data){
                        alert("提交数据发生错误！");
                    }
                });
            }
        });

    });

    function uploadImage(obj) {
        var f = $(obj).val();
        if(f == null || f == undefined || f == '') {
            return false;
        }
        if (!/\.(?:png|jpg|PNG|JPG)$/.test(f)) {
            $.messageBox({message:"类型必须是图片(.png|jpg|PNG|JPG)"});
            $(obj).val('');
            return false;
        }
        var data = new FormData();
        $.each($(obj)[0].files, function(i, file) {
            data.append('img', file);
        })
        $.ajax({
            type:"POST",
            url: "/upload/uploadImg",
            data: data,
            cache:false,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function(result) {
                if (result.flag == true) {
                    $("#companyPictureUrl").val(result.resultStr);
                    $.messageBox({message:"上传成功"});
                } else {
                    $.messageBox({message:result.resultStr});
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        })
    }

</script>
</html>