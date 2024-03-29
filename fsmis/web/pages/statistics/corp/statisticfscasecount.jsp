<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/ec.jsp"%>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/extjs.jsp" %>
<link href="${ctx}/styles/treeSelect.css" type='text/css' rel='stylesheet'>
<script type="text/javascript" src="${ctx}/amcharts/swfobject.js"></script>
<script type="text/javascript">
function validator(){
	var phone = document.getElementById("displayNum").value;
	if(isNaN(phone)){
		alert("图显输入必须是数字！");
		return false;
	}
}
</script>
</head>
<body>
<div class="x-panel-header" style="margin-top: -1;margin-left: -1;">企业处罚统计</div>
<div class="x-toolbar">
<table width="100%" border="0">
	<tr>
		<s:form id="corptatistic" action="statisticFsCaseCount.do"
			method="post" target="main" onsubmit="return validator()">
			<td width="60" align="right">所属部门：</td>
			<td class="simple" align="left" width="160">
				<div id="comboxWithTree" style="float: left;width: 100px"></div>
				<s:hidden name="deptId" id="deptId"/>
			</td>
			<td align="left">
				时间：
				<input type="text" name="beginDate" style="width: 120px" id="minDate"
					value='<s:date name="beginDate" format="yyyy-MM-dd"/>'
					onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'maxDate\')}',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
					class="Wdate" />
				至
				<input type="text" name="endDate" style="width: 120px" id="maxDate"
					value='<s:date name="endDate" format="yyyy-MM-dd"/>'
					onfocus="WdatePicker({minDate:'#F{$dp.$D(\'minDate\')}',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
					class="Wdate" />
				图显：
				<s:textfield id="displayNum" name="displayNum" cssStyle="width:30px"></s:textfield>个
				<s:submit value="查询" cssClass="button"/>
			</td>
		</s:form>
		<td align="right">
		<table>
			<tr>
				<td><span class="ytb-sep"></span></td>
				<td><a href="statisticFsCaseCount.do">处罚统计</a></td>
				<td><span class="ytb-sep"></span></td>
				<td><a href="statisticByDept.do">部门统计</a></td>
		</table>
		</td>
	</tr>
</table>
</div>
<table width="100%" style="margin: -5">
	<tr>
		<td colspan="4"><%@ include file="/common/messages.jsp"%></td>
	</tr>
	<tr>
		<td align="left" valign="top">
			<ec:table
				items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit"
				action="statisticFsCaseCount.do" 
				useAjax="false"
				doPreload="false" 
				pageSizeList="10" 
				editable="false"
				sortable="true" 
				rowsDisplayed="10" 
				generateScript="true"
				resizeColWidth="false" 
				classic="false" 
				width="100%" 
				height="330px"
				minHeight="330"
				toolbarContent="pagejump|pagesize|status">
				<ec:row>
					<ec:column width="35" property="_No" title="No." value="${GLOBALROWCOUNT}" style="text-align:center" sortable="false"/>
					<ec:column width="100" property="name" title="名称" sortable="false" />
					<ec:column width="100" property="dept.name" title="所属部门" sortable="false"/>
					<ec:column width="100" property="_fsc" title="处罚次数" sortable="false" >
						<c:forEach var="fs" items="${item.fsCases}" varStatus="status">
						    <c:if test="${status.last}">
						    	${status.count}
						    </c:if>
						</c:forEach>
					</ec:column>
				</ec:row>
			</ec:table>
		</td>
		<td align="left">
			<div id="flashcontent"><strong>你需要更新你的flash了。</strong></div>
		</td>
	</tr>
</table>

<script type="text/javascript">
	// <![CDATA[		
	var so = new SWFObject("${ctx}/amcharts/amcolumn.swf", "column", "400", "450",
			"8", "#FFFFFF");
	so.addVariable("path", "${ctx}/amcharts/");
	so.addVariable("settings_file",
			encodeURIComponent("${ctx}/pages/statistics/corp/column_fscasecount.xml"));
	so.addVariable("chart_data", "${result}");
	so.write("flashcontent");
	// ]]>
</script>
<script type="text/javascript" src="${ctx}/pages/admin/dept/edit.js"></script>
<script type="text/javascript">
Ext.onReady(function() {
	var dtree = new DeptTree({
		url : '/admin/dept/deptTree.do',
		parent : '<stc:loginUserDept showPath="false" propertyName="id" showTopDept="true"></stc:loginUserDept>',
		initValue : '${deptName}',
		el : 'comboxWithTree',
		innerTree :'inner-tree',
		onclick : function(nodeId) {
		  Ext.get('deptId').dom.value = nodeId;
		}
	});
	dtree.init();	
});
</script>
</body>
</html>