<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>接收短信列表</title>
<%@include file="/common/ec.jsp"%>
<%@include file="/common/extjs.jsp"%>
<%@include file="/common/meta.jsp"%>
</head>
<body>
<div class="x-panel">
<div class="x-panel-header">短信接收</div>
<div class="x-toolbar">
<table width="99%">
	<tr>
		<td style="padding: 5px 0px 3px 10px;"> 
			<form action="index.do" method="post" target="">
				手机号：<s:textfield name="model.mobileNum"/>&nbsp;&nbsp;
				最新：<input type="checkbox" style="border: 0px;" name="model.isNew" value="1" <s:if test="model.isNew != null">checked="checked"</s:if> />&nbsp;&nbsp;
				上报：<input type="checkbox" style="border: 0px;" name="model.isReport" value="1" <s:if test="model.isReport != null">checked="checked"</s:if> />&nbsp;&nbsp;
				核实：<input type="checkbox" style="border: 0px;" name="model.isVerify" value="1" <s:if test="model.isVerify != null">checked="checked"</s:if> />&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="查询" class="button">
			</form>
		</td>
		<td align="right">
		<table>
			<tr>
				<td><a href="#" onclick="remove()"><img src="${ctx}/images/icons/delete.gif" /></a></td>
				<td><a href="#" onclick="remove()">删除</a></td>
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
		<ec:column width="40" property="_select" title="选择"
			style="text-align:center" viewsAllowed="html">
			<input type="checkbox" name="selectedItems" value="${item.id}" style="margin: -1px 0px -1px 0px; border: 0px;"/>
		</ec:column>
		<ec:column width="40" property="_no" value="${GLOBALROWCOUNT}" title="No." style="text-align:center"/>
		<ec:column width="100" property="mobileNum" title="电话号码" style="text-align:center"/>
		<ec:column width="250" property="content" title="短信内容" />
		<ec:column width="120" property="receiveTime" title="系统接收时间"
			cell="date" format="yyyy-MM-dd HH:mm" style="text-align:center"/>
		<ec:column width="80" property="isReport" title="类别" style="text-align:center">
			<s:if test="#attr.item.isReport eq 1">
				<font color="red" title="事件上报">报</font>
			</s:if>
			<s:elseif test="#attr.item.isReport eq 2">
				<font color="green" title="事件核实">核</font>
			</s:elseif>
			<s:else><font color="" title="普通短信">普</font></s:else>
		</ec:column>
		<ec:column width="100" property="_stuts" title="状态" style="text-align:center"  sortable="false" viewsAllowed="html">
			<s:if test="#attr.item.isNew eq 1"><font color="red">未读</font></s:if>
			<s:else><font color="green">已读</font></s:else>|
			<s:if test="#attr.item.isTreated eq 1"><font color="green">已处理</font></s:if>
			<s:else><font color="red">未处理</font></s:else>
		</ec:column>
		<ec:column width="100" property="_0" title="操作" style="text-align:center" sortable="false">
			<a href="${ctx}/fscase/editFsCaseBySmsReceive.do?smsReceiveId=${item.id}">查看</a> | 
			<a href="${ctx}/fscase/editFsCaseBySmsReceive.do?smsReceiveId=${item.id}">处理</a>
		</ec:column>
	</ec:row>
</ec:table></div>
</div>
</div>
<script type="text/javascript">
/**
 * 删除提交
 */
function remove(){
    var sels = document.getElementsByName("selectedItems");
    var checked = false;;
    for(i = 0; i < sels.length; i++) {
        if(sels[i].checked) {
           checked = true;
           break;
        }
    } 
    if(!checked) {
    	Ext.MessageBox.show({
            title:'提示',
            minWidth:260,
            msg:'<div style=\'width:180\';><br/>请选择要删除的短信！</div>',
            buttons:Ext.MessageBox.OK,
            icon:Ext.MessageBox.INFO
       });
       return;
    }
	Ext.MessageBox.confirm('提示','确定要删除所选择的短信吗？删除后不能恢复！', function(btn){
        if (btn == 'yes') {
        	var from = document.getElementById("ec");
    		from.target="_self";
    		from.action="remove.do";
    		from.submit();
        }
    });
}
</script>
</body>
</html>