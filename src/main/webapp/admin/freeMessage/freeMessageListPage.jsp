<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="freeMessage">
    <div class="toolbar">
        <button id="addFreeMessage" type="button" class="tc-15-btn m">新增</button>
        <button id="updateFreeMessage" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteFreeMessage" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="freeMessageList"> </table>
        <div id="freeMessageListPager"></div>
    </div>
    <div id="freeMessageDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#freeMessageList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "messageContent",index : "messageContent", label:'消息内容', sortable : false, width:'400'},
                {name : "identity",index : "identity", label:'发布人身份', align:'center', sortable : false, width:'170', formatter:identityFormatter},
                {name : "messageState", index:"messageState", label:"信息状态", align:'center', sortable:false, width:'170', formatter:messageStateFormatter},
                {name : "browseVolume", index:"browseVolume", label:"浏览量", align:'center', sortable:false, width:'170', formatter:browseVolumeFormatter},
                {name : "createUser", index:"createUser", label:"发布人", align:'center', sortable:false, width:'170'},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function identityFormatter(el, options, rowData) {
            if(rowData.identity == 1) {
                return "买方";
            } else if (rowData.identity == 2) {
                return "卖方";
            }
            return "";
        }

        function messageStateFormatter(el, options, rowData) {
            if (rowData.messageState == 0) {
                return "待审核";
            } else if(rowData.messageState == 1) {
                return "通过";
            } else if (rowData.messageState == 2) {
                return "驳回";
            }
            return "";
        }

        function browseVolumeFormatter(el, options, rowData) {
            if (rowData.browseVolume == null) {
                return 0;
            }
            return rowData.browseVolume;
        }

        onLoad();
        function onLoad(){
            var initParam = {
            }
            $("#freeMessageList").setGridParam({
                url:"/freeMessage/findFreeMessageForPage",
                datatype: "json",
                page:1
            });
            $("#freeMessageList").setPostData(initParam);
            $("#freeMessageList").trigger("reloadGrid");
        }

        $("#addFreeMessage").click(function(){
            $('#freeMessageDialog').createDialog({
                width: 1000,
                height: 800,
                title:'新增消息',
                url:'${path}/freeMessage/gotoAddFreeMessagePage',
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

        $("#updateFreeMessage").click(function(){
            var selectedIds = $("#freeMessageList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#freeMessageDialog').createDialog({
                width: 1000,
                height: 800,
                title:'修改消息',
                url:'${path}/freeMessage/gotoUpdateFreeMessagePage?id='+selectedIds,
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

        $("#deleteFreeMessage").click(function(){
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
                        url:'${path}/freeMessage/deleteFreeMessage',
                        data:{
                            "ids":$("#freeMessageList").jqGrid("getGridParam", "selarrrow")
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
            if(null != $("#freeMessageList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>