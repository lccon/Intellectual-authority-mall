<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    #state_style{
        margin-top: 70px;
    }
</style>

<form id="maintainForm" method="post" action="/leaveMessage/updateLeaveMessage">
    <input type="hidden" name="id" value="${leaveMessage.id}"/>
    <div class="container_24 cf">
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">留言内容：</label>
        </div>
        <div class="grid_16">
            <textarea name="message" id="message" class="form-txt" style="height:100px;">${leaveMessage.message}</textarea>
        </div>
        <div class="clearLine"></div>
        <div id="state_style">
            <div class="grid_6 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">留言状态：</label>
            </div>
            <div class="grid_16">
                <select name="messageState">
                    <option value="0" <c:if test="${leaveMessage.messageState == 0}">selected</c:if>>未处理</option>
                    <option value="1" <c:if test="${leaveMessage.messageState == 1}">selected</c:if>>已查看</option>
                </select>
            </div>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">姓名：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="realName" id="realName" value="${leaveMessage.realName}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">联系电话：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="mobile" id="mobile" value="${leaveMessage.mobile}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">邮箱地址：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="mailAddress" id="mailAddress" value="${leaveMessage.mailAddress}"/>
        </div>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function(){

        $("#maintainForm").formValidate({
            rules:{
                "message":{
                    required:true,
                    minlength:1,
                    maxlength:1000
                }
            },
            messages:{
                "message":{
                    required:"请输入留言内容",
                    minlength:$.format("留言至少需要输入{0}个字符"),
                    minlength:$.format("留言最多需要输入{0}个字符"),
                }
            },
            submitHandler: function(form) {
                var message = $("#message").val().trim();
                $("#message").val(message)
                $(form).ajaxSubmit({
                    success: function(data){
                        if(data != null && !data.id){
                            $.messageBox({
                                message:"修改失败",
                                level: "error"
                            });
                            return;
                        }
                        $("#leaveMessageList").trigger("reloadGrid");
                        $.messageBox({message:"修改成功!"});
                        $("#leaveMessageDialog").dialog("close");
                    },
                    error: function(data){
                        alert("提交数据发生错误！");
                    }
                });
            }
        });
    });

</script>