<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="taskRelease">
    <div class="toolbar">
        <button id="addTaskRelease" type="button" class="tc-15-btn m">新增</button>
        <button id="updateTaskRelease" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteTaskRelease" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="taskReleaseList"> </table>
        <div id="taskReleaseListPager"></div>
    </div>
    <div id="taskReleaseDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#taskReleaseList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "taskCategory",index : "taskCategory", label:'任务类型', sortable : false, width:'150', align:'center', formatter:taskCategoryFormatter},
                {name : "intellectualProperty",index : "intellectualProperty", label:'知识产权类型', align:'center', sortable : false, width:'150', formatter:intellectualPropertyFormatter},
                {name : "industryBelongs", index:"industryBelongs", label:"行业所属", align:'center', sortable:false, width:'150', formatter:industryBelongsFormatter},
                {name : "purpose", index:"purpose", label:"用途",  sortable:false, width:'270'},
                {name : "detailedDesc", index:"detailedDesc", label:"详细说明", sortable:false, width:'270'},
                {name : "roofPlaceState", index:"roofPlaceState", label:"置顶状态", align:'center', sortable:false, width:'100', formatter:roofPlaceStateFormatter},
                {name : "topDuration", index:"topDuration", label:"置顶天数", align:'center', sortable:false, width:'100'},
                {name : "state", index:"state", label:"发布状态", align:'center', sortable:false, width:'100', formatter:stateFormatter},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

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

        function taskCategoryFormatter(el, options, rowData) {
            if(rowData.taskCategory == 1) {
                return "申请";
            } else if (rowData.taskCategory == 2) {
                return "购买";
            }
            return "";
        }

        function intellectualPropertyFormatter(el, options, rowData) {
            if(rowData.intellectualProperty == 1) {
                return "发明";
            } else if (rowData.intellectualProperty == 2) {
                return "实用新型";
            } else if (rowData.intellectualProperty == 3) {
                return "外观";
            } else if (rowData.intellectualProperty == 4) {
                return "商标";
            } else if (rowData.intellectualProperty == 5) {
                return "版权";
            }
            return "";
        }

        function industryBelongsFormatter(el, options, rowData) {
            if (rowData.industryBelongs == 1) {
                return "生活需要";
            } else if(rowData.industryBelongs == 2) {
                return "交通运输";
            } else if (rowData.industryBelongs == 3) {
                return "化学化工";
            } else if (rowData.industryBelongs == 4) {
                return "轻工纺织";
            } else if (rowData.industryBelongs == 5) {
                return "建筑建材";
            } else if (rowData.industryBelongs == 6) {
                return "机械照明";
            } else if (rowData.industryBelongs == 7) {
                return "新能源";
            } else if (rowData.industryBelongs == 8) {
                return "电力电气";
            } else if (rowData.industryBelongs == 9) {
                return "武器爆破";
            } else if (rowData.industryBelongs == 10) {
                return "农林牧业";
            } else if (rowData.industryBelongs == 11) {
                return "视频饮料";
            } else if (rowData.industryBelongs == 12) {
                return "家具用品";
            } else if (rowData.industryBelongs == 13) {
                return "教育休闲";
            } else if (rowData.industryBelongs == 14) {
                return "医药医疗";
            } else if (rowData.industryBelongs == 15) {
                return "电子信息源";
            } else if (rowData.industryBelongs == 16) {
                return "仪器仪表";
            } else if (rowData.industryBelongs == 17) {
                return "包装印刷";
            } else if (rowData.industryBelongs == 18) {
                return "新型材料";
            } else if (rowData.industryBelongs == 19) {
                return "海洋开发";
            } else if (rowData.industryBelongs == 20) {
                return "航空航天";
            } else if (rowData.industryBelongs == 21) {
                return "采矿冶金";
            } else if (rowData.industryBelongs == 22) {
                return "橡胶塑料";
            } else if (rowData.industryBelongs == 23) {
                return "安全防护";
            } else if (rowData.industryBelongs == 24) {
                return "节能环保";
            } else if (rowData.industryBelongs == 25) {
                return "其他";
            }
            return "";
        }

        onLoad();
        function onLoad(){
            var initParam = {
            }
            $("#taskReleaseList").setGridParam({
                url:"/taskRelease/findTaskReleaseForPage",
                datatype: "json",
                page:1
            });
            $("#taskReleaseList").setPostData(initParam);
            $("#taskReleaseList").trigger("reloadGrid");
        }

        $("#addTaskRelease").click(function(){
            $('#taskReleaseDialog').createDialog({
                width: 1000,
                height: 830,
                title:'新增需求发布信息',
                url:'${path}/taskRelease/gotoAddTaskReleasePage',
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

        $("#updateTaskRelease").click(function(){
            var selectedIds = $("#taskReleaseList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#taskReleaseDialog').createDialog({
                width: 1000,
                height: 830,
                title:'修改需求发布信息',
                url:'${path}/taskRelease/gotoUpdateTaskReleasePage?id='+selectedIds,
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

        $("#deleteTaskRelease").click(function(){
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
                        url:'${path}/taskRelease/deleteTaskRelease',
                        data:{
                            "ids":$("#taskReleaseList").jqGrid("getGridParam", "selarrrow")
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
            if(null != $("#taskReleaseList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>