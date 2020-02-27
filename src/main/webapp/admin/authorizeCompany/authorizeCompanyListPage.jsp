<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="authorizeCompany">
    <div class="toolbar">
        <button id="addAuthorizeCompany" type="button" class="tc-15-btn m">新增</button>
        <button id="updateAuthorizeCompany" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteAuthorizeCompany" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="authorizeCompanyList"> </table>
        <div id="authorizeCompanyListPager"></div>
    </div>
    <div id="authorizeCompanyDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#authorizeCompanyList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "companyName",index : "companyName", label:'公司名称', sortable : false, width:'400'},
                {name : "businessCategory",index : "businessCategory", label:'业务分类', align:'center', sortable : false, width:'170', formatter:businessCategoryFormatter},
                {name : "companyDescribe", index:"companyDescribe", label:"公司介绍", align:'center', sortable:false, width:'170'},
                {name : "roofPlaceState", index:"roofPlaceState", label:"置顶状态", align:'center', sortable:false, width:'100', formatter:roofPlaceStateFormatter},
                {name : "topDuration", index:"topDuration", label:"置顶天数", align:'center', sortable:false, width:'100'},
                {name : "state", index:"state", label:"发布状态", align:'center', sortable:false, width:'100', formatter:stateFormatter},
                {name : "companyPictureUrl", index:"companyPictureUrl", label:"公司图片", align:'center', sortable:false, width:'170', formatter:companyPictureUrlFormatter},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function businessCategoryFormatter(el, options, rowData) {
            if(rowData.businessCategory == 1) {
                return "申请专利";
            } else if (rowData.businessCategory == 2) {
                return "证书买卖";
            } else if (rowData.businessCategory == 3) {
                return "技术成果转让";
            } else if (rowData.businessCategory == 4) {
                return "法律咨询";
            }
            return "";
        }

        function roofPlaceStateFormatter(el, options, rowData) {
            if(rowData.roofPlaceState == 1) {
                return "待审核";
            } else if (rowData.roofPlaceState == 2) {
                return "置顶";
            }
            return "";
        }

        function stateFormatter(el, options, rowData) {
            if(rowData.state == 0) {
                return "驳回";
            } else if(rowData.state == 1) {
                return "待审核";
            } else if (rowData.state == 2) {
                return "发布";
            }
            return "";
        }

        function companyPictureUrlFormatter(el, options, rowData) {
            if(rowData.companyPictureUrl != null) {
                var imgs = rowData.companyPictureUrl.split(",");
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
            $("#authorizeCompanyList").setGridParam({
                url:"/authorizeCompany/findAuthorizeCompanyForPage",
                datatype: "json",
                page:1
            });
            $("#authorizeCompanyList").setPostData(initParam);
            $("#authorizeCompanyList").trigger("reloadGrid");
        }

        $("#addAuthorizeCompany").click(function(){
            $('#authorizeCompanyDialog').createDialog({
                width: 1000,
                height: 800,
                title:'新增代办公司信息',
                url:'${path}/authorizeCompany/gotoAddAuthorizeCompanyPage',
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

        $("#updateAuthorizeCompany").click(function(){
            var selectedIds = $("#authorizeCompanyList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#authorizeCompanyDialog').createDialog({
                width: 1000,
                height: 800,
                title:'修改代办公司信息',
                url:'${path}/authorizeCompany/gotoUpdateAuthorizeCompanyPage?id='+selectedIds,
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

        $("#deleteAuthorizeCompany").click(function(){
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
                        url:'${path}/authorizeCompany/deleteAuthorizeCompany',
                        data:{
                            "ids":$("#authorizeCompanyList").jqGrid("getGridParam", "selarrrow")
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
            if(null != $("#authorizeCompanyList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>