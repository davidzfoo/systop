<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.systop.fsmis.model.Supervisor,java.util.List" %>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>监管员信息管理</title>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/ec.jsp"%>
</head>
<body>
<div class="x-panel">
<div class="x-toolbar" align="center">
<h2>导出手机号:</h2>
</div>
<div class="x-panel-body">
<div style="margin-left: -3px;" align="left">
	<table width="800" align="center" border="0" cellpadding="3" cellspacing="5">
		<tr>
			<td align="left">
				<%
					int iMobileCount = 0;
					int iNoMobileCount = 0;
					List<Supervisor> items = (List)request.getAttribute("items");
					for(Supervisor s : items){
						if (s.getMobile() != null && !"".equals(s.getMobile())){
							iMobileCount++;
							if (iMobileCount % 10 != 0){
								out.print(s.getMobile() + ";");
							}else{
								out.println(s.getMobile() + ";");
							}
						}else{
							iNoMobileCount++;
						}
					}
				%>
			</td>
		</tr>
		<tr>
			<td ><br>
				<h3 style="color: green;">有号码人数:<%= iMobileCount%></h3>
				<h3 style="color: red;">无号码人数:<%= iNoMobileCount%></h3>			
			</td>
		</tr>
	</table>
</div>
</div>
</div>
</body>
</html>