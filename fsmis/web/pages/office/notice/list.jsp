<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>通知管理</title>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/ec.jsp"%>
<%@include file="/common/extjs.jsp"%>
<script type="text/javascript">
/**
 * 删除提交
 */
function remove(id){
	Ext.MessageBox.confirm('提示','确认要删除所选择的通知吗？删除后不能恢复！', function(btn){
        if (btn == 'yes') {
        	location.href = "remove.do?model.id=" + id;
        }
    });
}
</script>
</head>
<body>
<div class="x-panel">
<div class="x-panel-header">通知纪录</div>
<div class="x-toolbar">
<table width="99%">
	<tr>
		<td align="left">
			<s:form action="index" method="post">
			&nbsp;&nbsp;&nbsp;&nbsp;
			标题：
			<s:textfield name="model.title"></s:textfield>	
			<s:submit value="查询" cssClass="button"></s:submit>
		</s:form>
		</td>
		<td align="right">
		<table>
			<tr>
				<td>
					<a href="${ctx}/office/notice/edit.do">添加</a>
				</td>
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
	action="index.do" useAjax="false"
	doPreload="false" 
	pageSizeList="20" 
	editable="false"
	sortable="false" 
	rowsDisplayed="20" 
	generateScript="true"
	resizeColWidth="false" 
	classic="false" 
	width="100%" height="360px"
	minHeight="360"
	toolbarContent="navigation|pagejump|pagesize|refresh|extend|status">
	<ec:row>
		<ec:column width="40" property="_s" title="No." value="${GLOBALROWCOUNT}" sortable="false" style="text-align: center" />
		<ec:column width="150" property="title" title="标题" />
		<ec:column width="120" property="createTime" title="发布时间" style="text-align:center" cell="date" format="yyyy-MM-dd HH:mm:ss" />
		<ec:column width="70" property="publisher.name" title="发布人" style="text-align:center"  />
		<ec:column width="250" property="_8" title="接收部门" >
			<c:forEach var="rr" items="${item.recRecordses}">
				【${rr.dept.name}】
			</c:forEach>
		</ec:column>
		<ec:column width="120" property="_0" title="操作" style="text-align:center" sortable="false">
			<a href="edit.do?model.id=${item.id}">编辑</a>|
			<a href="view.do?model.id=${item.id}">查看</a>|
			<a href="#" onclick="remove(${item.id})">删除 </a>
		</ec:column>
	</ec:row>
</ec:table></div>
</div>
</div>
</body>
</html>