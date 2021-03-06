<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="leaveMessage">
    <div class="toolbar">
        <button id="addLeaveMessage" type="button" class="tc-15-btn m">新增</button>
        <button id="updateLeaveMessage" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteLeaveMessage" type="button" class="tc-15-btn m">删除</button>
        <button id="oneClickView" type="button" class="tc-15-btn m">一键查看</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="leaveMessageList"> </table>
        <div id="leaveMessageListPager"></div>
    </div>
    <div id="leaveMessageDialog"></div>
</div>


<script type="text/javascript">
    $(function(){
        $("#leaveMessageList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "message",index : "message", label:'留言内容', sortable : false, width:'400'},
                {name : "messageState",index : "messageState", label:'留言状态', align:'center', sortable : false, width:'200', formatter:messageStateFormatter},
                {name : "createUser", index:"createUser", label:"留言对象", align:'center', sortable:false, width:'200'},
                {name : "realName", index:"realName", label:"姓名", align:'center', sortable:false, width:'100'},
                {name : "mobile", index:"mobile", label:"联系电话", align:'center', sortable:false, width:'200'},
                {name : "mailAddress", index:"mailAddress", label:"邮箱地址", align:'center', sortable:false, width:'200'},
                {name : "messageDateStr", index:"messageDateStr", label:"留言时间", align:'center', sortable:false, width:'200'},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function messageStateFormatter(el, options, rowData) {
            if(rowData.messageState == 0) {
                return "未受理";
            } else if (rowData.messageState == 1) {
                return "已查看";
            }
            return "";
        }

        onLoad();
        function onLoad(){
            var initParam = {
            }
            $("#leaveMessageList").setGridParam({
                url:"/leaveMessage/findLeaveMessageForList",
                datatype: "json",
                page:1
            });
            $("#leaveMessageList").setPostData(initParam);
            $("#leaveMessageList").trigger("reloadGrid");
        }

        $("#addLeaveMessage").click(function(){
            $('#leaveMessageDialog').createDialog({
                width: 500,
                height: 400,
                title:'新增留言',
                url:'${path}/leaveMessage/gotoAddLeaveMessagePage',
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

        $("#updateLeaveMessage").click(function(){
            var selectedIds = $("#leaveMessageList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#leaveMessageDialog').createDialog({
                width: 500,
                height: 400,
                title:'修改留言',
                url:'${path}/leaveMessage/gotoUpdateLeaveMessagePage?id='+selectedIds,
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

        $("#deleteLeaveMessage").click(function(){
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
                        url:'${path}/leaveMessage/deleteLeaveMessage',
                        data:{
                            "ids":$("#leaveMessageList").jqGrid("getGridParam", "selarrrow")
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
            if(null != $("#leaveMessageList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>