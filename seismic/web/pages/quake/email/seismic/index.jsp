<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<title></title>
<%@include file="/common/quake.jsp" %>
</head>
<body>
<fieldset>
<legend>测震数据订阅</legend>
	<table width="99%" style="margin:0px;">
		<tr>
			<td></td>
			<td align="right">
				<a href="editNew.do"><img src="${ctx}/images/icons/add.gif" /> 添加订阅项</a>
			<td>
		</tr>
	</table>
  </fieldset>
<div class="x-panel-body">
	 <ec:table items="items" var="item" retrieveRowsCallback="process" sortRowsCallback="process" 
		action="index.do"
		useAjax="true" doPreload="false"
		maxRowsExported="10000000" 
		pageSizeList="15,20,30" 
		editable="false" 
		sortable="true"	
		rowsDisplayed="15"	
		generateScript="true"	
		resizeColWidth="true"	
		classic="false"	
		width="100%" 	
		height="315px"	
		minHeight="315"
		toolbarContent="navigation|pagejump|pagesize|refresh|extend|status">
	<ec:row>
		<ec:column width="40" property="_0" title="序号" value="${GLOBALROWCOUNT}" style="text-align:center" sortable="false"/>
		<ec:column width="115" property="catalogName" title="地震目录名称" />
		<ec:column width="150" property="emailAddr" title="电子邮件"/>
		<ec:column width="60" property="_2" title="审核状态" style="text-align:center">
		   <c:if test="${item.state == '0'}">
		      <span style="color:red">未审核</span>
		   </c:if>
		   <c:if test="${item.state == '1'}">
		      <span style="color:green">审核通过</span>
		   </c:if>
		</ec:column>
		<ec:column width="60" property="startEpiLon" title="起始经度"  sortable="false"/>
		<ec:column width="60" property="endEpiLon" title="结束经度"  sortable="false"/>
		<ec:column width="60" property="startEpiLat" title="起始纬度"  sortable="false"/>
		<ec:column width="60" property="endEpiLat" title="结束纬度"  sortable="false"/>
		<ec:column width="60" property="minM" title="最小震级"  sortable="false"/>
		<ec:column width="60" property="maxM" title="最大震级"  sortable="false"/>
		<ec:column width="160" property="lastSendDate" title="最后发送时间" cell="quake.base.webapp.DateTimeCell" />
		<ec:column width="80" property="_1" title="操作" sortable="false" style="text-align:center">
		   <a href="edit.do?model.id=${item.id}">编辑 </a> | 
		   <a href="remove.do?model.id=${item.id}" id="cancel" 
		   	onclick="return confirm('确定要撤销这个订阅项吗？');">撤销</a>
		</ec:column>
	</ec:row>
	</ec:table>
  </div>
</body>
</html>