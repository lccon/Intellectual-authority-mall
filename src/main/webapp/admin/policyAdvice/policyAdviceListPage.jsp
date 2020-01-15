<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="policyAdvice">
    <div class="toolbar">
        <button id="addPolicyAdvice" type="button" class="tc-15-btn m">新增</button>
        <button id="updatePolicyAdvice" type="button" class="tc-15-btn m">修改</button>
        <button id="deletePolicyAdvice" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="policyAdviceList"> </table>
        <div id="policyAdviceListPager"></div>
    </div>
    <div id="policyAdviceDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#policyAdviceList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "adviceCategory",index : "adviceCategory", label:'资讯分类', sortable : false, width:'150', formatter:adviceCategoryFormatter},
                {name : "adviceTitle",index : "adviceTitle", label:'标题', align:'center', sortable : false, width:'170'},
                {name : "adviceSubtitle", index:"adviceSubtitle", label:"副标题", align:'center', sortable:false, width:'170'},
                {name : "adviceContent", index:"adviceContent", label:"资讯内容", align:'center', sortable:false, width:'170'},
                {name : "advicePictureUrl", index:"advicePictureUrl", label:"图片", align:'center', sortable:false, width:'170', formatter:advicePictureUrlFormatter},
                {name : "createUser", index:"createUser", label:"创建人", align:'center', sortable:false, width:'170'},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function adviceCategoryFormatter(el, options, rowData) {
            if(rowData.adviceCategory == 1) {
                return "政策法规";
            } else if (rowData.adviceCategory == 2) {
                return "平台动态";
            } else if (rowData.adviceCategory == 3) {
                return "新闻实事";
            } else if (rowData.adviceCategory == 4) {
                return "行业知识";
            }
            return "";
        }

        function advicePictureUrlFormatter(el, options, rowData) {
            if(rowData.advicePictureUrl != null) {
                var imgs = rowData.advicePictureUrl.split(",");
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
            $("#policyAdviceList").setGridParam({
                url:"/policyAdvice/findPolicyAdviceForPage",
                datatype: "json",
                page:1
            });
            $("#policyAdviceList").setPostData(initParam);
            $("#policyAdviceList").trigger("reloadGrid");
        }

        $("#addPolicyAdvice").click(function(){
            $('#policyAdviceDialog').createDialog({
                width: 1000,
                height: 800,
                title:'新增消息',
                url:'${path}/policyAdvice/gotoAddPolicyAdvicePage',
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

        $("#updatePolicyAdvice").click(function(){
            var selectedIds = $("#policyAdviceList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#policyAdviceDialog').createDialog({
                width: 1000,
                height: 800,
                title:'修改消息',
                url:'${path}/policyAdvice/gotoUpdatePolicyAdvicePage?id='+selectedIds,
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

        $("#deletePolicyAdvice").click(function(){
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
                        url:'${path}/policyAdvice/deletePolicyAdvice',
                        data:{
                            "ids":$("#policyAdviceList").jqGrid("getGridParam", "selarrrow")
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

        $("#oneClickView").click(function() {
            $.confirm({
                title:"更改状态",
                message:"您确定想把所有'未处理'的信息改为'已查看'吗?",
                width:400,
                okFunc:function () {
                    $.ajax({
                        url:'${path}/leaveMessage/updateLeaveMessageState',
                        type: 'GET',
                        success:function(data){
                            if(data != null && data){
                                $.messageBox({message:"修改成功！"});
                                onLoad();
                            }else{
                                $.messageBox({message:"修改失败！",level: "error"});
                            }
                        }
                    })
                }
            })
        })

        $("#reload").click(function(){
            onLoad();
        })

        function hasRowSelected(){
            if(null != $("#policyAdviceList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>