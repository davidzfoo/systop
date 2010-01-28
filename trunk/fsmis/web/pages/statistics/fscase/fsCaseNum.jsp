<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/ec.jsp"%>
<%@include file="/common/meta.jsp"%>
<script type="text/javascript" src="${ctx}/amcharts/swfobject.js"></script>
<link href="${ctx}/styles/treeSelect.css" type='text/css'
	rel='stylesheet'>

</head>
<body>
<div class="x-panel-header">事件数量统计图</div>
<div class="x-toolbar">
<table width="99%">
  <tr>
   <td>
   
   <form id="fscaseStaticForm" action="${ctx}/statistics/fscase/statisticByNum.do" method="post">
 <table> <tr><td>
   时间:</td><td><input type="text" name="beginDate" style="width: 90px"
				value='<s:date name="beginDate" format="yyyy-MM-dd"/>'
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
				class="Wdate" /></td>
		<td>统计单位:<s:select id="yearOrMonth" list="yearOrMonthMap" cssStyle="width:40px" name="yearOrMonth" onchange="yearOrMonthChange()"/></td>
	<td>
				  <div id="tb_1">
							比较类型:<s:select id="compareSort" list="compareMap" cssStyle="width:50px" name="compareSort"/>
						</div></td>		
    <td><input type="submit" value="查询" class="button" /></td> 
    </tr>
    </table>
    </form>    
    </td> 
      
  </tr>
</table>
</div>
<table width="100%">
	<tr>
		<td align="center">
			<div id="flashcontent"><strong>你需要更新你的flash了。</strong></div>
		</td>
	</tr>
</table>

<script type="text/javascript">
	// <![CDATA[		
	var so = new SWFObject("${ctx}/amcharts/amcolumn.swf", "amcolumn", "750", "550",
			"10", "#FFFFFF");
	so.addVariable("path", "${ctx}/amcharts/");
	so.addVariable("settings_file",
			encodeURIComponent("${ctx}/pages/statistics/fscase/setting/fsCaseNum.xml"));
	so.addVariable("chart_data", "${csvData}");
	so.write("flashcontent");
	// ]]>
	
</script>
<script type="text/javascript">

function yearOrMonthChange() { 
	if(document.getElementById("yearOrMonth").value=='2'){
		document.all("tb_1").style.display="block"; 
	}else{
		document.all("tb_1").style.display="none"; 
		}
} 
yearOrMonthChange();
</script>
</body>
</html>