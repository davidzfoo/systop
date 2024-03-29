<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<title></title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family:"宋体";
	font-size:12px;
	color:#2d6fa9;
}
table {
	font-family:"宋体";
	font-size:13px;
	color:#2d6fa9;
}
a{
	text-decoration:none;color:#286e94;
}
a:hover{
	text-decoration:none;color:#fd0100;
} 
img{
	border: 0px;
}
</style>
</head>
<body bgcolor="#FAFAFA">
<table border="0" width="230" height="180" cellpadding="0" cellspacing="0">
	<tr>
		<td align="right" width="80" height="27">用户名：</td>
		<td width="150">${user.loginId}&nbsp;</td>
	</tr>
	<tr>
		<td align="right" height="27">姓　名：</td>
		<td>${user.name}&nbsp;</td>
	</tr>
	<tr>
		<td align="right" height="27">性　别：</td>
		<td>
			<c:if test="${user.sex == 'M'}">
				男&nbsp;
			</c:if>
			<c:if test="${user.sex == 'F'}">
				女&nbsp;
			</c:if>
		</td>
	</tr>
	<tr>
		<td align="right" height="27">类　别：</td>
		<td>
			<stc:role ifAnyGranted="ROLE_ADMIN">
				管理员
			</stc:role>
			<stc:role ifNotGranted ="ROLE_ADMIN">
				<stc:role ifAnyGranted="ROLE_NORMAL">
					普通用户
				</stc:role>
			</stc:role>
			&nbsp;
	   </td>
	</tr>
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td colspan="2" align="center" style="border-top:1px dotted #2D6FA9; padding-top:5px;">
			<a href="${ctx}/j_acegi_logout" target="_parent" title="退出系统">
			  <img src="${ctx}/images/icons/user_go.gif" style="margin-right: 2px;">注&nbsp;销
		    </a>
		    <a href="${ctx}/useredit/index.shtml?uid=${user.id }" target="_top" title="编辑个人信息">
			  <img src="${ctx}/images/icons/authority.gif" style="margin-right: 2px;">个人信息
		    </a>
		    <stc:role ifAnyGranted="ROLE_ADMIN">
		      <a href="${ctx}/adminIndex.jsp" target="_blank" title="网站后台管理">
				<img src="${ctx}/images/icons/user.gif" style="margin-right: 2px;">网站管理
			  </a>
			</stc:role>
		</td>
	</tr>
  </table>
</body>
</html>