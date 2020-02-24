<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body>
<div id="center11">
<!--网页头部-->
<jsp:include page="head.jsp" />
<!--商品行业分类-->
<div class="container" id="kind" style="margin-top:100px;">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
            <ul class="list-inline">
                <li>主办业务分类：</li>
                <li><a href="#">申请专利</a></li>
                <li><a href="#">证书买卖</a></li>
                <li><a href="#">技术成果转让</a></li>
                <li><a href="#">法律咨询</a></li>
            </ul>
        </div>
    </div>
</div>
<!--搜索框-->
<div class="span">
    <div class="container">
        <div class="input-group">
            <input type="text" class="form-control" id="input1" placeholder="默认搜索项">
            <div class="input-group-btn">
                <a class="btn btn-default" id="button1" onclick="findpage()">搜索</a>
                <script>
                    function findpage() {
                        var a1=document.getElementById("button1");
                        var input1=document.getElementById("input1").value;
                        a1.href="/intellectualTask/findByIntellectualTask?str1="+input1;
                    }
                </script>
                <a class="btn btn-default" id="button2">免费发布信息</a>
            </div>
        </div>

        <div class="container" id="newline">
            <a href="#">关键词</a>
            <a href="#">关键词</a>
            <a href="#">关键词</a>
            <a href="#">关键词</a>
            <a href="#">关键词</a>
        </div>
    </div>
</div>







<!--需求列表-->
<div style="margin-top: 50px;">
    <div class="container">
        <c:forEach items="${requestScope.pagemsg.lists}" var="u">
            <div class="product">
                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                        <div class="media" style="width: 1150px;">

                            <div class="media-left">
                                <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}">
                                    <img id="img${u.id}" style="max-width:450px;height: 170px;" src="" class="media-object" alt="">
                                    <script>
                                    var url1="${u.companyPictureUrl}".split(",");
                                    var img1=document.getElementById("img${u.id}");
                                    img1.src="${pageContext.request.contextPath}"+url1[0];
                                    </script>
                                </a>
                            </div>
                            <div class="media-body" id="caps">
                                <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}">${u.companyName }</a>
                                <p id="desc">${u.companyDescribe }</p>
                                <p id="desc">浏览量：100</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="warp">
                    <c:if test="${u.hasCollectedState==0}">
                        <a id="abc" href="javascript:void(0);" onclick="addcollect(${u.id});" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                    </c:if>
                    <c:if test="${u.hasCollectedState==1}">
                        <a id="abc" href="javascript:void(0);" onclick="deletecollect(${UserId},2,${u.id});" class="label label-primary bstreedit">已收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                    </c:if>
                    <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
                </div>
            </div>
        </c:forEach>

    </div>

</div>

<!--分页-->
<div class="container">
    <div class="row pad-15">
        <div class="col-md-12">
            <nav class="pagination-outer" aria-label="Page navigation">
                <ul class="pagination">
                    <div id="demo2-1"></div>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;
        laypage.render({
            elem: 'demo2-1',
            count: ${requestScope.pagemsg.totalCount },
            limit:${requestScope.pagemsg.pageSize},
            theme: '#FF5722',
            curr:${requestScope.pagemsg.currPage },
            jump: function(obj, first){
                //首次不执行
                if(!first){
                    bbb(obj.curr);
                    //do something
                }
            }
        });
    });
    function bbb(path) {
        var that=$(this);
        var $contentWrapper = $('#center11');
        var $ul1=$('pagination');
        $.ajax({
            url : "${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage="+path,
            success : function(rst) {
                $contentWrapper.html(rst);
            }
        })
    }



    //新增收藏
    function addcollect(id) {
        var a=document.getElementById("addcollect");
        var abc=document.getElementById("abc");
        $.ajax({
            type:"POST",
            url: "/businessCollected/addBusinessCollected?moduleType=2&moduleTypeId="+id,
            cache:false,
            contentType: false,
            processData: false,
            success: function(result) {
                if(result){
                    console.log(result);
                    bbb(${requestScope.pagemsg.currPage});
                }
                else {
                    console.log("新增失败");
                }

            },
        })
    }
    //删除收藏
    function deletecollect(userid,moduletype,moduletypeid) {
        $.ajax({
            type:"POST",
            url: "/businessCollected/deleteBusinessCollected?userId="+userid+"&moduleType="+moduletype+"&moduleTypeId="+moduletypeid,
            async : false,
            data:{type:1},
            timeout:1000,
            success: function(result) {
                if(result){
                    console.log("删除成功");
                    bbb(${requestScope.pagemsg.currPage});
                }
                else {
                    console.log("删除失败");
                }

            },
        })
    }

</script>
<!--网页底部-->
<jsp:include page="footer.jsp" />
</div>
</body>

</html>