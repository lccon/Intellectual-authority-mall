<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="intellectualTask">
    <div class="toolbar">
        <button id="addIntellectualTask" type="button" class="tc-15-btn m">新增</button>
        <button id="updateIntellectualTask" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteIntellectualTask" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="intellectualTaskList"> </table>
        <div id="intellectualTaskListPager"></div>
    </div>
    <div id="intellectualTaskDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#intellectualTaskList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "productName",index : "productName", label:'商品名称', align:'center', sortable : false, width:'170'},
                {name : "productBrief", index:"productBrief", label:"商品简介", align:'center', sortable:false, width:'170'},
                {name : "productDetails", index:"productDetails", label:"商品详情", align:'center', sortable:false, width:'170'},
                {name : "patentNumber", index:"patentNumber", label:"专利号", align:'center', sortable:false, width:'170'},
                {name : "productCategory", index:"productCategory", label:"商品分类", align:'center', sortable:false, width:'90', formatter:productCategoryFormatter},
                {name : "industryCategory", index:"industryCategory", label:"行业分类", align:'center', sortable:false, width:'100', formatter:industryCategoryFormatter},
                {name : "roofPlaceState", index:"roofPlaceState", label:"置顶状态", align:'center', sortable:false, width:'100', formatter:roofPlaceStateFormatter},
                {name : "topDuration", index:"topDuration", label:"置顶天数", align:'center', sortable:false, width:'100'},
                {name : "state", index:"state", label:"发布状态", align:'center', sortable:false, width:'100', formatter:stateFormatter},
                {name : "productPictureUrl", index:"productPictureUrl", label:"图片", align:'center', sortable:false, width:'320', formatter:productPictureFormatter},
                {name : "productVideoUrl", index:"productVideoUrl", label:"视频", align:'center', sortable:false, width:'170', formatter:productVideoFormatter},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function productCategoryFormatter(el, options, rowData) {
            if(rowData.productCategory == 1) {
                return "发明";
            } else if (rowData.productCategory == 2) {
                return "实用新型";
            } else if (rowData.productCategory == 3) {
                return "外观"
            } else if (rowData.productCategory == 4) {
                return "商标"
            } else if (rowData.productCategory == 5) {
                return "版权"
            }
            return "";
        }

        function roofPlaceStateFormatter(el, options, rowData) {
            if(rowData.roofPlaceState == 1) {
                return "<div style='color:#FF7F24'>待审核</div>";
            } else if (rowData.roofPlaceState == 2) {
                return "<div style='color:#FF4040'>置顶</div>";
            }
            return "不置顶";
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

        function industryCategoryFormatter(el, options, rowData) {
            if (rowData.industryCategory == 1) {
                return "生活需要";
            } else if(rowData.industryCategory == 2) {
                return "交通运输";
            } else if (rowData.industryCategory == 3) {
                return "化学化工";
            } else if (rowData.industryCategory == 4) {
                return "轻工纺织";
            } else if (rowData.industryCategory == 5) {
                return "建筑建材";
            } else if (rowData.industryCategory == 6) {
                return "机械照明";
            } else if (rowData.industryCategory == 7) {
                return "新能源";
            } else if (rowData.industryCategory == 8) {
                return "电力电气";
            } else if (rowData.industryCategory == 9) {
                return "武器爆破";
            } else if (rowData.industryCategory == 10) {
                return "农林牧业";
            } else if (rowData.industryCategory == 11) {
                return "视频饮料";
            } else if (rowData.industryCategory == 12) {
                return "家具用品";
            } else if (rowData.industryCategory == 13) {
                return "教育休闲";
            } else if (rowData.industryCategory == 14) {
                return "医药医疗";
            } else if (rowData.industryCategory == 15) {
                return "电子信息源";
            } else if (rowData.industryCategory == 16) {
                return "仪器仪表";
            } else if (rowData.industryCategory == 17) {
                return "包装印刷";
            } else if (rowData.industryCategory == 18) {
                return "新型材料";
            } else if (rowData.industryCategory == 19) {
                return "海洋开发";
            } else if (rowData.industryCategory == 20) {
                return "航空航天";
            } else if (rowData.industryCategory == 21) {
                return "采矿冶金";
            } else if (rowData.industryCategory == 22) {
                return "橡胶塑料";
            } else if (rowData.industryCategory == 23) {
                return "安全防护";
            } else if (rowData.industryCategory == 24) {
                return "节能环保";
            } else if (rowData.industryCategory == 25) {
                return "其他";
            }
            return "";
        }

        function productPictureFormatter(el, options, rowData) {
            if(rowData.productPictureUrl != null) {
                var imgs = rowData.productPictureUrl.split(",");
                return '<c:forEach begin="0" end="2" step="1" var="img">'+
                            '<img src="'+imgs[${img}]+'" width="100" height="100">'+' '+
                        '</c:forEach>';
            }
            return "";
        }

        function productVideoFormatter(el, options, rowData) {
            if(rowData.productVideoUrl != null) {
                return '<a href="'+rowData.productVideoUrl+'" target="_blank">观看视频</a>';
            }
            return "";
        }

        onLoad();
        function onLoad(){
            var initParam = {
            }
            $("#intellectualTaskList").setGridParam({
                url:"/intellectualTask/findIntellectualTaskForPage",
                datatype: "json",
                page:1
            });
            $("#intellectualTaskList").setPostData(initParam);
            $("#intellectualTaskList").trigger("reloadGrid");
        }

        $("#addIntellectualTask").click(function(){
            $('#intellectualTaskDialog').createDialog({
                width: 1000,
                height: 800,
                title:'新增知识产权信息',
                url:'${path}/intellectualTask/gotoAddIntellectualTaskPage',
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

        $("#updateIntellectualTask").click(function(){
            var selectedIds = $("#intellectualTaskList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#intellectualTaskDialog').createDialog({
                width: 1000,
                height: 800,
                title:'修改知识产权信息',
                url:'${path}/intellectualTask/gotoUpdateIntellectualTaskPage?id='+selectedIds,
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

        $("#deleteIntellectualTask").click(function(){
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
                        url:'${path}/intellectualTask/deleteIntellectualTask',
                        data:{
                            "ids":$("#intellectualTaskList").jqGrid("getGridParam", "selarrrow")
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
            if(null != $("#intellectualTaskList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>