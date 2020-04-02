<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="tradeAuthorize">
    <div class="toolbar">
        <button id="updateTradeAuthorize" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteTradeAuthorize" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="tradeAuthorizeList"> </table>
        <div id="tradeAuthorizeListPager"></div>
    </div>
    <div id="tradeAuthorizeDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#tradeAuthorizeList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "companyName",index : "companyName", label:'公司名称', align:'center', sortable : false, width:'200'},
                {name : "licensePicture", index:"licensePicture", label:"营业执照", align:'center', sortable:false, width:'200', formatter:licensePictureFormatter},
                {name : "businessLicense", index:"businessLicense", label:"营业执照编码", align:'center', sortable:false, width:'200'},
                {name : "companyPerson",index : "companyPerson", label:'联系人', align:'center', sortable : false, width:'200'},
                {name : "authorizeResult", index:"authorizeResult", label:"认证状态/类型", align:'center', sortable:false, width:'200', formatter:authorizeResultFormatter},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function authorizeResultFormatter(el, options, rowData) {
            if(rowData.authorizeResult == 1) {
                return "<div style='color:#FF4040'>驳回</div>";
            } else if (rowData.authorizeResult == 2) {
                return "<div style='color:#76EE00'>代办公司</div>";
            } else if (rowData.authorizeResult == 3) {
                return "<div style='color:#76EEC6'>普通公司</div>";
            }
            return "待认证";
        }

        function licensePictureFormatter(el, options, rowData) {
            if(rowData.licensePicture != null) {
                var imgs = rowData.licensePicture.split(",");
                var imgInfo = '';
                $.each(imgs,function(i,j){
                    if (j != '') {
                        imgInfo = imgInfo + '<img src="' + j + '" width="100" height="100"/>' + ' '
                    }
                });
                if (imgInfo != '') {
                    return imgInfo;
                } else {
                    return "";
                }
            }
            return "";
        }

        onLoad();
        function onLoad(){
            var initParam = {
            }
            $("#tradeAuthorizeList").setGridParam({
                url:"/tradeAuthorize/findTradeAuthorizeForPage",
                datatype: "json",
                page:1
            });
            $("#tradeAuthorizeList").setPostData(initParam);
            $("#tradeAuthorizeList").trigger("reloadGrid");
        }

        $("#updateTradeAuthorize").click(function(){
            var selectedIds = $("#tradeAuthorizeList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#tradeAuthorizeDialog').createDialog({
                width: 600,
                height: 400,
                title:'修改消息',
                url:'${path}/tradeAuthorize/gotoUpdateTradeAuthorizePage?id='+selectedIds,
                buttons: {
                    "保存" : function(){
                        $("#maintainForm").submit();
                    },
                    "关闭" : function(){
                        $(this).dialog("close");
                    }
                }
            });
        });

        $("#deleteTradeAuthorize").click(function(){
            if(!hasRowSelected()){
                $.messageBox({level:'warn',message:"请选择一条或多条记录再进行操作！"});
                return;
            }
            $.confirm({
                title:"确认删除",
                message:"该条信息删除后,将无法恢复,您确认删除该条信息吗?",
                width:400,
                okFunc:function(){
                    $.ajax({
                        url:'${path}/tradeAuthorize/deleteTradeAuthorize',
                        data:{
                            "ids":$("#tradeAuthorizeList").jqGrid("getGridParam", "selarrrow")
                        },
                        type: 'POST',
                        success:function(data){
                            if(data != null && data){
                                $.messageBox({message:"删除成功！"});
                                onLoad();
                            }else{
                                $.messageBox({message:"删除失败！",level: "error"});
                            }
                        }
                    });
                }
            });
        });

        $("#reload").click(function(){
            onLoad();
        })

        function hasRowSelected(){
            if(null != $("#tradeAuthorizeList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>