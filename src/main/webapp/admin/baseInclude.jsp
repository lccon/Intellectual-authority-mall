<%@ page import="com.mall.component.ThreadVariable" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path",path);
request.setAttribute("currentSession","");
    if (ThreadVariable.getSession()!= null && ThreadVariable.getSession().getUserName() != null) {
        request.setAttribute("userRealName", ThreadVariable.getSession().getUserName());
    }
%>

<script type="text/javascript">
var PATH='${path}';
var listUrl;
var userRealName='${userRealName}';
</script>
