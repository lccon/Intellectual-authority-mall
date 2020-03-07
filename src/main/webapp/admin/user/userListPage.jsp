<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="user">
    <div class="toolbar">
        <button id="addUser" type="button" class="tc-15-btn m">新增</button>
        <button id="updateUser" type="button" class="tc-15-btn m">修改</button>
        <button id="deleteUser" type="button" class="tc-15-btn m">删除</button>
        <button id="reload" type="button" class="tc-15-btn m">刷新</button>
    </div>
    <div id="manage-area-inner">
        <table id="userList"> </table>
        <div id="userListPager"></div>
    </div>
    <div id="userDialog"></div>
</div>


<script type="text/javascript">

    $(function(){
        $("#userList").jqGridFunction({
            datatype : "local",
            colModel : [
                {name : "id",index : "id", sortable : false,hidden : true, frozen : true},
                {name : "username",index : "username", label:'用户名', sortable : false},
                {name : "mobile",index : "mobile", label:'手机号', align:'center', sortable : false, width:'170'},
                {name : "idCard", index:"idCard", label:"身份证号", align:'center', sortable:false, width:'170'},
                {name : "identity", index:"identity", label:"身份", align:'center', sortable:false, width:'170', formatter:identityFormatter},
                {name : "headPortrait", index:"headPortrait", label:"头像", align:'center', sortable:false, width:'170', formatter:headPortraitFormatter},
                {name : "authorizeType", index:"authorizeType", label:"认证类型", align:'center', sortable:false, width:'170', formatter:authorizeTypeFormatter},
                {name : "accountYue", index:"accountYue", label:"账户余额", align:'center', sortable:false, width:'170'},
                {name : "virtualCoin", index:"virtualCoin", label:"虚拟币数量", align:'center', sortable:false, width:'170'},
                {name : "freeMessageNum", index:"freeMessageNum", label:"可免费发布信息数量", align:'center', sortable:false, width:'170'},
            ],
            multiselect : true,
            height:"492px",
            width:"100%",
            onSelectRow : function() {
            }
        });

        function identityFormatter(el, options, rowData) {
            if(rowData.identity == 1) {
                return "普通用户";
            } else if (rowData.identity == 2) {
                return "管理员";
            }
            return "";
        }

        function authorizeTypeFormatter(el, options, rowData) {
            if(rowData.authorizeType == 1) {
                return "驳回(企业认证)";
            } else if(rowData.authorizeType == 2) {
                return "代办公司";
            } else if(rowData.authorizeType == 3) {
                return "普通公司";
            } else if (rowData.authorizeType == 4) {
                return "个人认证";
            }
            return "";
        }

        function headPortraitFormatter(el, options, rowData) {
            if(rowData.headPortrait != null) {
                var imgs = rowData.headPortrait.split(",");
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
            $("#userList").setGridParam({
                url:"/user/findUserForPage",
                datatype: "json",
                page:1
            });
            $("#userList").setPostData(initParam);
            $("#userList").trigger("reloadGrid");
        }

        $("#addUser").click(function(){
            $('#userDialog').createDialog({
                width: 710,
                height: 500,
                title:'新增用户信息',
                url:'${path}/user/gotoAddUserPage',
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

        $("#updateUser").click(function(){
            var selectedIds = $("#userList").jqGrid("getGridParam", "selarrrow");
            if (selectedIds.length !== 1) {
                $.messageBox({
                    level : 'warn',
                    message : '能且只能选择一条数据进行操作！'
                });
                return;
            }

            $('#userDialog').createDialog({
                width: 710,
                height: 500,
                title:'修改用户信息',
                url:'${path}/user/gotoUpdateUserPage?id='+selectedIds,
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

        $("#deleteUser").click(function(){
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
                        url:'${path}/user/deleteUser',
                        data:{
                            "ids":$("#userList").jqGrid("getGridParam", "selarrrow")
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
            if(null != $("#userList").getGridParam("selrow")){
                return true;
            }
            return false;
        }
    });
</script>