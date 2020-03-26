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

<form id="maintainForm" method="post" action="/taskRelease/updateTaskRelease">
    <input type="hidden" name="id" value="${taskRelease.id}">
    <div class="container_24 cf">
        <div class="grid_4 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">任务类型：</label>
        </div>
        <div class="grid_7">
            <select name="taskCategory">
                <option value="1" <c:if test="${taskRelease.taskCategory == 1}">selected</c:if>>申请</option>
                <option value="2" <c:if test="${taskRelease.taskCategory == 2}">selected</c:if>>购买</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">知识产权类型：</label>
        </div>
        <div class="grid_7">
            <select name="intellectualProperty">
                <option value="1" <c:if test="${taskRelease.intellectualProperty == 1}">selected</c:if>>发明</option>
                <option value="2" <c:if test="${taskRelease.intellectualProperty == 2}">selected</c:if>>实用新型</option>
                <option value="3" <c:if test="${taskRelease.intellectualProperty == 3}">selected</c:if>>外观</option>
                <option value="4" <c:if test="${taskRelease.intellectualProperty == 4}">selected</c:if>>商标</option>
                <option value="5"  <c:if test="${taskRelease.intellectualProperty == 5}">selected</c:if>>版权</option>
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
                    <option value="1" <c:if test="${taskRelease.industryBelongs == 1}">selected</c:if>>生活需要</option>
                    <option value="2" <c:if test="${taskRelease.industryBelongs == 2}">selected</c:if>>交通运输</option>
                    <option value="3" <c:if test="${taskRelease.industryBelongs == 3}">selected</c:if>>化学化工</option>
                    <option value="4" <c:if test="${taskRelease.industryBelongs == 4}">selected</c:if>>轻工纺织</option>
                    <option value="5" <c:if test="${taskRelease.industryBelongs == 5}">selected</c:if>>建筑建材</option>
                    <option value="6" <c:if test="${taskRelease.industryBelongs == 6}">selected</c:if>>机械照明</option>
                    <option value="7" <c:if test="${taskRelease.industryBelongs == 7}">selected</c:if>>新能源</option>
                    <option value="8" <c:if test="${taskRelease.industryBelongs == 8}">selected</c:if>>电力电气</option>
                    <option value="9" <c:if test="${taskRelease.industryBelongs == 9}">selected</c:if>>武器爆破</option>
                    <option value="10" <c:if test="${taskRelease.industryBelongs == 10}">selected</c:if>>农林牧业</option>
                    <option value="11" <c:if test="${taskRelease.industryBelongs == 11}">selected</c:if>>视频饮料</option>
                    <option value="12" <c:if test="${taskRelease.industryBelongs == 12}">selected</c:if>>家具用品</option>
                    <option value="13" <c:if test="${taskRelease.industryBelongs == 13}">selected</c:if>>教育休闲</option>
                    <option value="14" <c:if test="${taskRelease.industryBelongs == 14}">selected</c:if>>医药医疗</option>
                    <option value="15" <c:if test="${taskRelease.industryBelongs == 15}">selected</c:if>>电子信息源</option>
                    <option value="16" <c:if test="${taskRelease.industryBelongs == 16}">selected</c:if>>仪器仪表</option>
                    <option value="17" <c:if test="${taskRelease.industryBelongs == 17}">selected</c:if>>包装印刷</option>
                    <option value="18" <c:if test="${taskRelease.industryBelongs == 18}">selected</c:if>>新型材料</option>
                    <option value="19" <c:if test="${taskRelease.industryBelongs == 19}">selected</c:if>>海洋开发</option>
                    <option value="20" <c:if test="${taskRelease.industryBelongs == 20}">selected</c:if>>航空航天</option>
                    <option value="21" <c:if test="${taskRelease.industryBelongs == 21}">selected</c:if>>采矿冶金</option>
                    <option value="22" <c:if test="${taskRelease.industryBelongs == 22}">selected</c:if>>橡胶塑料</option>
                    <option value="23" <c:if test="${taskRelease.industryBelongs == 23}">selected</c:if>>安全防护</option>
                    <option value="24" <c:if test="${taskRelease.industryBelongs == 24}">selected</c:if>>节能环保</option>
                    <option value="25" <c:if test="${taskRelease.industryBelongs == 15}">selected</c:if>>其他</option>
                </select>
            </div>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">用途：</label>
        </div>
        <div class="grid_7">
            <textarea name="purpose" style="width:541px;height:108px">${taskRelease.purpose}</textarea>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right" style="margin-top: 80px;">
            <em class="form-red">*</em>
            <label class="form-lb1">详细说明：</label>
        </div>
        <div class="grid_1" style="margin-top: 80px;">
            <script id="container" name="detailedDesc" type="text/plain">
                ${taskRelease.detailedDesc}
            </script>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right" style="margin-top: 345px;">
            <em class="form-red">*</em>
            <label class="form-lb1">置顶状态：</label>
        </div>
        <div class="grid_7">
            <select name="roofPlaceState" id="roofPlaceState" style="margin-top: 345px;">
                <option value="1" <c:if test="${taskRelease.roofPlaceState == 1}">selected</c:if>>待审核</option>
                <option value="2" <c:if test="${taskRelease.roofPlaceState == 2}">selected</c:if>>置顶</option>
            </select>
        </div>
        <div id="topDurationStr">
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">发布状态：</label>
        </div>
        <div class="grid_7">
            <select name="state">
                <option value="1" <c:if test="${taskRelease.state == 1}">selected</c:if>>待审核</option>
                <option value="2" <c:if test="${taskRelease.state == 2}">selected</c:if>>发布</option>
                <option value="0" <c:if test="${taskRelease.state == 0}">selected</c:if>>驳回</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right">
            <label class="form-lb1">真实姓名：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="realName" id="realName" value="${taskRelease.realName}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_4 label-right">
            <label class="form-lb1">联系电话：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="mobile" id="mobile" value="${taskRelease.mobile}"/>
        </div>
    </div>
</form>

<!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        var ue = UE.getEditor('container');
        ue.ready(function() {
            //设置编辑器的内容
            var html = ue.getContent();
            ue.setContent(html);
        });

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
                },
                "topDuration" : {
                    required:true,
                    positiveInteger:true,
                    minlength:1,
                    maxlength:10
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
                },
                "topDuration" : {
                    required:"请输入置顶天数",
                    positiveInteger:"只能输入数字",
                    minlength:$.format("置顶天数至少需要输入{0}个字符"),
                    minlength:$.format("置顶天数最多需要输入{0}个字符"),
                }
            },
            submitHandler: function(form) {
                $(form).ajaxSubmit({
                    success: function(data){
                        if(data != null && !data.id){
                            $.messageBox({
                                message:"修改失败",
                                level: "error"
                            });
                            return;
                        }
                        $("#taskReleaseList").trigger("reloadGrid");
                        $.messageBox({message:"修改成功!"});
                        $("#taskReleaseDialog").dialog("close");
                    },
                    error: function(data){
                        alert("提交数据发生错误！");
                    }
                });
            }
        });

    });

    var roofPlaceState = $('#roofPlaceState option:selected').val();
    if(roofPlaceState == 2){
        $("#topDurationStr").append('<div class="clearLine"></div>\n' +
            '            <div class="grid_4 label-right">\n' +
            '                <em class="form-red">*</em>\n' +
            '                <label class="form-lb1">置顶天数：</label>\n' +
            '            </div>\n' +
            '            <div class="grid_7">\n' +
            '                <input type="text" name="topDuration" id="topDuration" value="${taskRelease.topDuration}"/>\n' +
            '            </div>');
    }

    $("#roofPlaceState").change(function(){
        var roofPlaceState = $('#roofPlaceState option:selected').val();
        // 如果选择的是自定义上传
        if(roofPlaceState == 2){
            $("#topDurationStr").append('<div class="clearLine"></div>\n' +
                '            <div class="grid_4 label-right">\n' +
                '                <em class="form-red">*</em>\n' +
                '                <label class="form-lb1">置顶天数：</label>\n' +
                '            </div>\n' +
                '            <div class="grid_7">\n' +
                '                <input type="text" name="topDuration" id="topDuration" value="${taskRelease.topDuration}"/>\n' +
                '            </div>');
        }else{
            $("#topDurationStr").empty();
        }
    })

    jQuery.validator.addMethod("positiveInteger", function(value, element) {
        var positiveInteger = /^[0-9]*[1-9][0-9]*$/;
        return this.optional(element) || (positiveInteger.test(value));
    });
</script>