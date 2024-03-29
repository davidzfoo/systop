<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>应急指挥组管理</title>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/ec.jsp"%>
<script type="text/javascript">
function removeUcGroupTypeId(id,ucTypeId){
	if (confirm("确认要删除该小组吗?")){	
		 window.location.href="remove.do?model.id=" + id+"&ucTypeId="+ucTypeId;		   
	}
}
function removeUcGroup(id){
	if (confirm("确认要删除该小组吗?")){	
		 window.location.href="remove.do?model.id=" + id;		   
	}
}
</script>
</head>
<body>
<div class="x-panel">
<div class="x-panel-header">应急指挥组管理</div>
<div class="x-toolbar">
<table width="99%">
	<tr>
		<td align="left" style="font-size: 12px">
			<s:if test="#attr.ucTypeId != null">
				<b>所属类别：${ucType.name}</b>&nbsp;&nbsp;&nbsp;<font color="red">${msg} </font>
			</s:if>
		</td>
		<td align="right">
		<table>
			<tr>
				<td>
					<s:if test="#attr.msg!= ''">
						<a href="${ctx}/ucgroup/edit.do?ucTypeId=${ucTypeId}">添加</a>
					</s:if>
				</td>
				<s:if test="#attr.ucTypeId != null">
					<td><span class="ytb-sep"></span></td>
					<td><a href="${ctx}/uctype/index.do"> 派遣类别列表</a></td>
				</s:if>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<div class="x-panel-body">
<div style="margin-left: -3px;" align="center">
<ec:table
	items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit"
	action="index.do" 
	useAjax="false"
	doPreload="false" 
	pageSizeList="30,50,100,200" 
	editable="false"
	sortable="true" 
	rowsDisplayed="30" 
	generateScript="true"
	resizeColWidth="false" 
	classic="false" 
	width="100%" 
	height="460px"
	minHeight="460"
	toolbarContent="navigation|pagejump|pagesize|refresh|extend|status">
	<ec:row>
		<ec:column width="40" property="_no" value="${GLOBALROWCOUNT}" title="No." style="text-align:center"/>
		<ec:column width="120" property="name" title="名称"/>
		<s:if test="#attr.ucTypeId != null">	
			<ec:column width="30" property="-0" title="公用" style="text-align:center;">
				<c:if test="${item.isPublic eq '1'}">是</c:if>
				<c:if test="${item.isPublic eq '0'}">否</c:if>
			</ec:column>
		</s:if>
		<ec:column width="80" property="principal" title="负责人" style="text-align:center"/>
		<ec:column width="180" property="_per" title="操作人" sortable="false">
			<c:forEach var="per" items="${item.users}">
				${per.name}&nbsp;
			</c:forEach>
		</ec:column>
		<ec:column width="100" property="phone" title="固话" style="text-align:center"/>
		<ec:column width="100" property="mobel" title="手机号" style="text-align:center"/>
		<ec:column width="100" property="_0" title="操作" style="text-align:center" sortable="false">
			<s:if test="#attr.ucTypeId == null">
				<a href="edit.do?model.id=${item.id}">编辑</a> |
				<a href="#" onClick="removeUcGroup(${item.id})">删除</a>
			</s:if>
			<s:if test="#attr.ucTypeId != null">
				<c:if test="${item.isPublic eq '0'}">	
					<a href="edit.do?model.id=${item.id}&ucTypeId=${ucTypeId}">编辑</a> |
					<a href="#" onClick="removeUcGroupTypeId(${item.id},${ucTypeId})">删除</a>
				</c:if>
			</s:if>
		</ec:column>
		
	</ec:row>
</ec:table></div>
</div>
</div>
</body>
</html>