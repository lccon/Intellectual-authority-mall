<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui-timepicker-zh-CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui-timepicker-addon.js"></script>

<style>
    .nav {
        overflow: hidden;
        text-align: center;
        background-color: #f4f4f4;
    }
    .nav li {
        float: left;
        padding: 5px;
        width: 113px;
        color: #666;
        list-style: none;
        border-left: 1px solid #f4f4f4;
        cursor: pointer;
    }
    .nav li:hover,.selected {
        background-color:#ecebeb;
        border-left: 1px solid #ecebeb;
    }
    .content{
        border: 1px solid #f4f4f4;
        height: 277px;
        padding: 10px;
        overflow: hidden;
    }
</style>

<form id="maintainForm" method="post" action="/authorizeSite/addAuthorizeSite">
    <input type="hidden" name="sitePictureUrl" id="sitePictureUrl" value=""/>
    <input type="hidden" name="addressUrl" id="addressUrl" value=""/>
    <input type="hidden" name="endTime" id="datepicker" value=""/>
    <input type="hidden" name="siteType" id="siteType" value="1"/>
    <ul class="nav">
        <li class="selected">轮播图广告位</li>
        <li>中部图片广告位</li>
        <li>左侧滚动广告位</li>
        <li>右侧固定广告位</li>
        <li>友情链接广告位</li>
    </ul>
    <div class="content">
        <div class="list ">
            <input type="hidden" name="siteType0" id="siteType0" value="1"/>
            <div class="container_24 cf">
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">轮播图图片：</label>
                </div>
                <div class="grid_1">
                    <input type="file" onchange="uploadImage(this);" class="text-input">
                    <input type="hidden" name="sitePictureUrl0" id="sitePictureUrl0" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">链接地址aaa：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="addressUrl0" id="addressUrl0" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">结束时间：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="endTime0" id="datepicker0" value=""/>
                </div>
            </div>
        </div>
        <div class="list">
            <input type="hidden" name="siteType1" id="siteType1" value="2"/>
            <div class="container_24 cf">
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">轮播图图片：</label>
                </div>
                <div class="grid_1">
                    <input type="file" onchange="uploadImage(this);" class="text-input">
                    <input type="hidden" name="sitePictureUrl1" id="sitePictureUrl1" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">链接地址bbb：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="addressUrl1" id="addressUrl1" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">结束时间：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="endTime1" id="datepicker1" value=""/>
                </div>
            </div>
        </div>
        <div  class="list">
            <input type="hidden" name="siteType2" id="siteType2" value="3"/>
            <div class="container_24 cf">
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">轮播图图片：</label>
                </div>
                <div class="grid_1">
                    <input type="file" onchange="uploadImage(this);" class="text-input">
                    <input type="hidden" name="sitePictureUrl2" id="sitePictureUrl2" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">链接地址ccc：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="addressUrl2" id="addressUrl2" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">结束时间：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="endTime2" id="datepicker2" value=""/>
                </div>
            </div>
        </div>
        <div class="list">
            <input type="hidden" name="siteType3" id="siteType3" value="4"/>
            <div class="container_24 cf">
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">轮播图图片：</label>
                </div>
                <div class="grid_1">
                    <input type="file" onchange="uploadImage(this);" class="text-input">
                    <input type="hidden" name="sitePictureUrl3" id="sitePictureUrl3" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">链接地址ddd：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="addressUrl3" id="addressUrl3" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">结束时间：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="endTime3" id="datepicker3" value=""/>
                </div>
            </div>
        </div>
        <div class="list">
            <input type="hidden" name="siteType4" id="siteType4" value="5"/>
            <div class="container_24 cf">
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">轮播图图片：</label>
                </div>
                <div class="grid_1">
                    <input type="file" onchange="uploadImage(this);" class="text-input">
                    <input type="hidden" name="sitePictureUrl4" id="sitePictureUrl4" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">链接地址eee：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="addressUrl4" id="addressUrl4" value=""/>
                </div>
                <div class="clearLine"></div>
                <div class="grid_5 label-right">
                    <em class="form-red">*</em>
                    <label class="form-lb1">结束时间：</label>
                </div>
                <div class="grid_14">
                    <input type="text" name="endTime4" id="datepicker4" value=""/>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function(){
        $("#datepicker0").prop("readonly", true).datetimepicker({
            timeFormat:"HH:mm:ss",
        });

        function datePicker(index) {
            $("#datepicker"+index).prop("readonly", true).datetimepicker({
                timeFormat:"HH:mm:ss",
            });
        }

        var divShow = $(".content").children('.list');
        //索引对应的div块显示
        $(divShow[0]).show();
        //索引对应的div块的同胞隐藏
        $(divShow[0]).siblings('.list').hide();

        //获取点击事件的对象
        $(".nav li").click(function(){
            //获取要显示或隐藏的对象
            var divShow = $(".content").children('.list');
            //判断当前对象是否被选中，如果没选中的话进入if循环
            if (!$(this).hasClass('selected')) {
                //获取当前对象的索引
                var index = $(this).index();
                //当前对象添加选中样式并且其同胞移除选中样式；
                $(this).addClass('selected').siblings('li').removeClass('selected');
                //索引对应的div块显示
                $(divShow[index]).show();
                //索引对应的div块的同胞隐藏
                $(divShow[index]).siblings('.list').hide();
                datePicker(index);
            }
        });

        $("#maintainForm").formValidate({
            rules:{
                "addressUrl0":{
                    required:true,
                    minlength:1,
                    maxlength:200
                },
                "endTime0": {
                    required:true,
                }
            },
            messages:{
                "addressUrl0":{
                    required:"请输入链接地址",
                    minlength:$.format("连接地址至少需要输入{0}个字符"),
                    minlength:$.format("连接地址最多需要输入{0}个字符"),
                },
                "endTime0":{
                    required:"请输入结束时间",
                }
            },
            submitHandler: function(form) {
                var index=$(".nav li[class='selected']").index();
                $("#sitePictureUrl").val($("#sitePictureUrl" + index).val());
                $("#addressUrl").val($("#addressUrl" + index).val());
                $("#datepicker").val($("#datepicker" + index).val());
                $("#siteType").val($("#siteType" + index).val());

                $(form).ajaxSubmit({
                    success: function(data){
                        if(data != null && !data.id){
                            $.messageBox({
                                message:"新增失败",
                                level: "error"
                            });
                            return;
                        }
                        $("#authorizeSiteList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#authorizeSiteDialog").dialog("close");
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
                    var index=$(".nav li[class='selected']").index();
                    $("#sitePictureUrl" + index).val(result.resultStr);
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