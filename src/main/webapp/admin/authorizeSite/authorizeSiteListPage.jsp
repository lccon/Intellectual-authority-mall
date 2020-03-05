<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="authorizeSite">
    <div class="toolbar">
        <button id="addAuthorizeSite" type="button" class="tc-15-btn m">新增</button>
        <button id="updateAuthorizeSite" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteAuthorizeSite" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="authorizeSiteList"> </table>
        <div id="authorizeSiteListPager"></div>
    </div>
    <div id="authorizeSiteDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#authorizeSiteList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "siteType",index : "siteType", label:'广告所属分类', sortable : false, align:'center', width:'200', formatter:siteTypeFormatter},
                {name : "sitePictureUrl", index:"sitePictureUrl", label:"图片", align:'center', sortable:false, width:'200', formatter:sitePictureUrlFormatter},
                {name : "addressUrl",index : "addressUrl", label:'链接地址', sortable : false, width:'400'},
                {name : "endTime",index : "endTime", label:'结束时间', sortable : false, width:'200'},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function siteTypeFormatter(el, options, rowData) {
            if(rowData.siteType == 1) {
                return "轮播图广告位";
            } else if (rowData.siteType == 2) {
                return "中部图片广告位";
            } else if (rowData.siteType == 3) {
                return "左侧滚动广告位";
            } else if (rowData.siteType == 4) {
                return "右侧固定广告位";
            } else if (rowData.siteType == 5) {
                return "友情链接广告位";
            }
            return "";
        }

        function sitePictureUrlFormatter(el, options, rowData) {
            if(rowData.sitePictureUrl != null) {
                var imgs = rowData.sitePictureUrl.split(",");
                return '<c:forEach begin="0" end="0" step="1" var="img">'+
                    '<img src="'+imgs[${img}]+'" width="100" height="100">'+' '+
                    '</c:forEach>';
            }
            return "";
        }

        onLoad();
        function onLoad(){
            var initParam = {
            }
            $("#authorizeSiteList").setGridParam({
                url:"/authorizeSite/findAuthorizeSiteForPage",
                datatype: "json",
                page:1
            });
            $("#authorizeSiteList").setPostData(initParam);
            $("#authorizeSiteList").trigger("reloadGrid");
        }

        $("#addAuthorizeSite").click(function(){
            $('#authorizeSiteDialog').createDialog({
                width: 650,
                height: 460,
                title:'新增站点信息',
                url:'${path}/authorizeSite/gotoAddAuthorizeSitePage',
                buttons: {
                    "保存" : function(){
                        var model = $("#model").val();
                        $("#maintainForm" + model).submit();
                    },
                    "关闭" : function(){
                        $(this).dialog("close");
                    }
                }
            });
        });

        $("#updateAuthorizeSite").click(function(){
            var selectedIds = $("#authorizeSiteList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#authorizeSiteDialog').createDialog({
                width: 650,
                height: 460,
                title:'修改站点信息',
                url:'${path}/authorizeSite/gotoUpdateAuthorizeSitePage?id='+selectedIds,
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

        $("#deleteAuthorizeSite").click(function(){
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
                        url:'${path}/authorizeSite/deleteAuthorizeSite',
                        data:{
                            "ids":$("#authorizeSiteList").jqGrid("getGridParam", "selarrrow")
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
            if(null != $("#authorizeSiteList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>