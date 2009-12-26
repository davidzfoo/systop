<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>文章信息列表</title>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/ec.jsp"%>
<script type="text/javascript">
function removeArticle(aID){
	if(confirm("确实要删除该文章吗？")){
		location.href = "${ctx}/cm/article/remove.do?model.id=" + aID;
	}	
}

function showArticle(aID){
	//location.href = "${ctx}/cm/article/look.do?model.id=" + aID;
	url = "${ctx}/cm/article/view.do?model.id=" + aID;
	window.open(url);
}

</script>
</head>

<body>
<div class="x-panel">
<div class="x-panel-header">文章信息列表</div>
<div class="x-toolbar">
<table width="99%">
	<tr>
		<td align="right">
		<table>
			<tr>
				<td>
					<a href="${ctx}/cm/article/edit.do">
						<img src="${ctx}/images/icons/add.gif" />添加
					</a>
				</td>
				<td><span class="ytb-sep"></span></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<div class="x-panel-body">
<div style="margin-left: -3px;" align="center">
<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
	action="indexArticles.do" 
	useAjax="false"
	doPreload="false" 
	pageSizeList="20,50,100,200" 
	editable="false"
	sortable="true" 
	rowsDisplayed="20" 
	generateScript="true"
	resizeColWidth="false" 
	classic="false" 
	width="100%" 
	height="477px"
	minHeight="470"
	toolbarContent="navigation|pagejump|pagesize|refresh|extend|status">
	<ec:row>
		<ec:column width="35" property="_No" title="No." value="${GLOBALROWCOUNT}" style="text-align:center" sortable="false"/>
		<ec:column width="400" property="title" title="文章标题" onclick="showArticle(${item.id})" style="cursor:hand" sortable="false"/>
		<ec:column width="70" property="author" title="录入者" sortable="false"/>
		<ec:column width="100" property="catalog.name" title="所属栏目" sortable="false"/>
		<ec:column width="100" property="_0" title="操作" style="text-align:center" sortable="false">
			<a href="${ctx}/cm/article/edit.do?model.id=${item.id}">
				<img src="${ctx}/images/icons/modify.gif" border="0" title="编辑" />
			</a>
			<a href="${ctx}/cm/article/look.do?model.id=${item.id}" target="_blank">
				<img src="${ctx}/images/icons/resource.gif" border="0" title="查看" />
			</a>
			<a href="#">
				<img src="${ctx}/images/icons/delete.gif" title="删除" border="0" onclick="removeArticle(${item.id})"/>
			</a>
		</ec:column>
	</ec:row>
</ec:table>
</div>
</div>
</div>
</body>
</html>