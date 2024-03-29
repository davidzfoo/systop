<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<title></title>
<%@include file="/common/quake.jsp" %>
<link type="text/css" href="${ctx}/scripts/jquery/ui/css/jquery-ui-1.7.1.css"	rel="stylesheet" />
<script type="text/javascript"	src="${ctx}/scripts/jquery/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript"	src="${ctx}/scripts/jquery/ui/jquery-ui-1.7.1.js"></script>
<script type="text/javascript">
$(function() {
	$("#queryFrm").validate();
});
</script>
</head>
<body>
	<s:form id="queryFrm" action="listSeed" namespace="/quake/seismic/data/catalog" theme="simple">
				<fieldset>
		<legend>${model.clcName}事件波形数据查询</legend>
  			<s:hidden name="model.tableName"/>
  			<s:hidden name="model.magTname"/>
  			<s:hidden name="model.phaseTname"/>
  			<s:hidden name="model.clcName"/>
  			<s:hidden name="model.clDescn"/>
  			<s:hidden name="model.disType"/>
		<table width="100%" style="margin:0px;">
			<tr>
				<td align="right" title="(YYYY-MM-DD)">日期：</td>
		  	    <td>
		  	      <input type="text" id="startDate" name="model.startDate" 
			       value="<s:date name="model.startDate" format="yyyy-MM-dd"/>"
			       onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')||\'now\'}',skin:'whyGreen'})" style="width:70px;">
		  	    </td>
		  	    <td>至</td>
		  	    <td>
		  	      <input type="text" id="endDate" name="model.endDate" 
			       value="<s:date name="model.endDate" format="yyyy-MM-dd"/>"
			       onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'now',skin:'whyGreen'})" style="width:70px;">
		  	    </td>
		  	    <td align="right">震级：</td>
		  	     <td>
		  	      <s:textfield name="model.startM" cssStyle="width:70px;" cssClass="number" title="大于等于1的正数"/>
		  	    </td>
		  	    <td>至</td>
		  	     <td>
		  	      <s:textfield name="model.endM" cssStyle="width:70px;" cssClass="number" title="大于等于1的正数"/>
		  	    </td>
		  	    <td align="right">类型：</td>
				<td><s:select list="EqTypesMap" name="model.eqType" headerKey="" headerValue="--请选择类型--" cssStyle="width:100px;">
        			</s:select>
        		</td>
		  	    <td>
		  	      	序列：<s:textfield name="model.sequenName" cssStyle="width:100px;"/>
		  	    </td>
			</tr>
			<tr>
				<td align="right">纬度：</td> 
		  	    <td>
		  	      <s:textfield name="model.startLat" cssStyle="width:70px;" cssClass="number" title="度.度，-90至90"/>
		  	    </td>
		  	    <td>至</td>
		  	     <td>
		  	      <s:textfield name="model.endLat" cssStyle="width:70px;" cssClass="number" title="度.度，-90至90"/>
		  	    </td>
		  	    <td align="right">经度：</td>
		  	    <td>
		  	      <s:textfield name="model.startLon" cssStyle="width:70px;" cssClass="number" title="度.度，-180至180"/> 
		  	    </td>
		  	    <td>至</td>
		  	    <td>
		  	      <s:textfield name="model.endLon" cssStyle="width:70px;" cssClass="number" title="度.度，-180至180"/>
		  	    </td>
		  	    <td align="right">地名：</td>
				<td><s:textfield name="model.location" cssStyle="width:100px;"/></td>
		  	    <td>
		  	       <input type="button" value="查询" onclick="exportData('${ctx}/quake/seismic/data/catalog/listSeed.do', '')"  class="button"/>&nbsp;
		  	      
		  	    </td>
	  	  </tr>
		</table>
	   </fieldset>
	</s:form>
<div class="x-panel-body">
<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
	action="listSeed.do"
	useAjax="true" doPreload="false"
	maxRowsExported="10000000" 
	pageSizeList="30,60,80,100" 
	editable="false" 
	sortable="false"	
	rowsDisplayed="30"	
	generateScript="true"	
	resizeColWidth="true"	
	classic="false"	
	width="100%" 	
	height="285px"	
	minHeight="285"
	toolbarContent="navigation|pagejump|pagesize|extend|status"     
	>
	<ec:row>
		<ec:column width="40" property="_0" title="序号" value="${GLOBALROWCOUNT}" style="text-align:center"/>
		<ec:column width="75" property="_9" title="操作" style="text-align:center">
			<s:if test="#attr.item.SEED_EXISTS == 1">
			   <a href="${ctx}/quake/seismic/data/seed/eventexp/showSeed.do?seedname=${item.SEED_NAME}&tableName=${model.tableName}">波形</a>
			</s:if>
			<s:else>
			   <span style="color:#CCC">波形</span>
			</s:else>
			
		</ec:column>
		<ec:column width="160" property="O_TIME" title="发震时刻" sortable="true">${item.EQ_TIME}</ec:column>	
		<ec:column width="60" property="EPI_LAT" title="震中纬度" cell="quake.base.webapp.DoubleCell" style="text-align:right"/>	
		<ec:column width="60" property="EPI_LON" title="震中经度" cell="quake.base.webapp.DoubleCell" style="text-align:right"/>
		<c:if test="${model.magTname != ''}">
			<ec:column width="40" property="ML" title="ML" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>		
			<ec:column width="40" property="Ms" title="Ms" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>		
			<ec:column width="40" property="Mb" title="Mb" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>		
			<ec:column width="40" property="MB" title="MB" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>		
			<ec:column width="40" property="Ms7" title="Ms7" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>		
			<ec:column width="40" property="Mw" title="Mw" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>
			<ec:column width="40" property="M" title="M" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>	
		</c:if>
		<c:if test="${model.magTname == ''}">
			<ec:column width="40" property="M" title="${model.disType}" cell="quake.seismic.data.catalog.webapp.cell.EMCell" style="text-align:right"/>		
		</c:if>
		<ec:column width="40" property="EPI_DEPTH" title="深度" cell="quake.seismic.data.catalog.webapp.cell.DepthFomat" style="text-align:right"/>	
		<ec:column width="80" property="Eq_type" title="地震类型" />	
		<ec:column width="60" property="Loc_stn" title="定位台数" style="text-align:right"/>	
		<ec:column width="100" property="LOCATION_CNAME" title="震中地名" />
	</ec:row>   
</ec:table>
</div>
<script type="text/javascript">
function exportData(url, target) {
	$("#queryFrm").attr("action", url);
	$("#queryFrm").attr("target", target);
	$("#queryFrm").submit();
}
</script>
</body>
</html>