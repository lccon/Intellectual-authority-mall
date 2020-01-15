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

<form id="maintainForm" method="post" action="/taskRelease/addTaskRelease">
    <div class="container_24 cf">
        <div class="grid_4 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">任务类型：</label>
        </div>
        <div class="grid_7">
            <select name="taskCategory">
                <option value="1">申请</option>
                <option value="2">购买</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">知识产权类型：</label>
        </div>
        <div class="grid_7">
            <select name="intellectualProperty">
                <option value="1">发明</option>
                <option value="2">实用新型</option>
                <option value="3">外观</option>
                <option value="4">商标</option>
                <option value="5">版权</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div id="message_style">
            <div class="grid_4 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">行业所属：</label>
            </div>
            <div class="grid_7">
                <select name="industryBelongs">
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
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">用途：</label>
        </div>
        <div class="grid_7">
            <textarea name="purpose" style="width:541px;height:108px"></textarea>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right" style="margin-top: 80px;">
            <em class="form-red">*</em>
            <label class="form-lb1">详细说明：</label>
        </div>
        <div class="grid_1" style="margin-top: 80px;">
            <script id="container" name="detailedDesc" type="text/plain">

            </script>
        </div>
    </div>
</form>

<!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>

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