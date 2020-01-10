<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    #state_style{
        margin-top: 70px;
    }
</style>

<form id="maintainForm" method="post" action="/leaveMessage/addLeaveMessage">
    <div class="container_24 cf">
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">留言内容：</label>
        </div>
        <div class="grid_16">
            <textarea name="message" id="message" class="form-txt" style="height:100px;"></textarea>
        </div>
        <div class="clearLine"></div>
        <div id="state_style">
            <div class="grid_6 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">留言状态：</label>
            </div>
            <div class="grid_16">
                <select name="messageState">
                    <option value="0">未处理</option>
                    <option value="1">已查看</option>
                </select>
            </div>
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
                "code":{
                    required:"请输入编码",
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
                                message:"新增失败",
                                level: "error"
                            });
                            return;
                        }
                        $("#leaveMessageList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
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
<%--

<!-- 加载编辑器的容器 -->
<script id="container" name="content" type="text/plain">
这里写你的初始化内容
</script>
<!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    $(function(){
        var ue = UE.getEditor('container');
        ue.ready(function() {
            debugger;
            //设置编辑器的内容
            ue.setContent('hello张三');
            //获取html内容，返回: <p>hello</p>
            var html = ue.getContent();
            //获取纯文本内容，返回: hello
            var txt = ue.getContentTxt();
        });
    })
</script>--%>
