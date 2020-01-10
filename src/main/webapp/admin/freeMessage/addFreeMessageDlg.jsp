<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    #identity_style{
        margin-top: 345px;
    }
    #container{
        width: 800px;
        height: 320px;
    }
</style>

<form id="maintainForm" method="post" action="/freeMessage/addFreeMessage">
    <div class="container_24 cf">
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">消息内容：</label>
        </div>
        <div class="grid_1">
            <script id="container" name="messageContent" type="text/plain">

            </script>
        </div>
        <div class="clearLine"></div>
        <div id="identity_style">
            <div class="grid_3 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">发布人身份：</label>
            </div>
            <div class="grid_7">
                <select name="identity">
                    <option value="1">买方</option>
                    <option value="2">卖方</option>
                </select>
            </div>
        </div>
        <div class="clearLine"></div>
        <div id="message_style">
            <div class="grid_3 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">消息状态：</label>
            </div>
            <div class="grid_7">
                <select name="messageState">
                    <option value="0">待审核</option>
                    <option value="1">通过</option>
                    <option value="2">驳回</option>
                </select>
            </div>
        </div>
    </div>
</form>

<!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>

<script type="text/javascript">
    $(document).ready(function(){

        $(function(){
            var ue = UE.getEditor('container');
            /*ue.ready(function() {
                //设置编辑器的内容
                ue.setContent('hello张三');
                //获取html内容，返回: <p>hello</p>
                var html = ue.getContent();
                //获取纯文本内容，返回: hello
                var txt = ue.getContentTxt();
            });*/
        })

        $("#maintainForm").formValidate({
            rules:{
                "messageContent":{
                    required:true,
                    minlength:1,
                    maxlength:5000
                }
            },
            messages:{
                "messageContent":{
                    required:"请输入留言内容",
                    minlength:$.format("留言至少需要输入{0}个字符"),
                    minlength:$.format("留言最多需要输入{0}个字符"),
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
                        $("#freeMessageList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#freeMessageDialog").dialog("close");
                    },
                    error: function(data){
                        alert("提交数据发生错误！");
                    }
                });
            }
        });
    });

</script>