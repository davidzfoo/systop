<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>栏目信息管理</title>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/validator.jsp"%>
<link href="${ctx}/styles/treeSelect.css" type='text/css' rel='stylesheet'>
</head>
<body>
<div class="x-panel">
<div class="x-panel-header">编辑栏目信息</div>
<div class="x-toolbar">
 <table width="100%">
     <tr>
        <td  align="right">               
               <a href="${ctx}/office/doctype/index.do">栏目管理首页</a>
        </td>
     </tr>
 </table>
</div>
<div><%@ include file="/common/messages.jsp"%></div>
<div align="center">
<s:form action="save.do" id="save" method="post" theme="simple" validate="true">
<fieldset style="width: 600px; padding-top: 10px">
  <legend>编辑栏目信息</legend>
	<s:hidden name="model.id"/>
	<s:hidden name="parentId"/>
	<table width="550px" align="center" border="0" cellpadding="3" cellspacing="3">
		<tr>
			<td align="right" width="100">栏目名称：</td>
			<td align="left">
				<s:textfield id="name" name="model.name" cssStyle="width:350px" cssClass="required" />&nbsp;<font color="red">*</font>
			</td>
		</tr>
		<tr>
			<td align="right" width="100">所属栏目：</td>
			<td align="left">
				<s:select id="parentId" name="model.parentDocumentType.id" listKey="id" listValue="name" list="documentTypeMap" headerKey=""  headerValue="选择栏目..." cssStyle="width:200px"></s:select>
			</td>
		</tr>
		<tr>
			<td align="right" width="100">描&nbsp;&nbsp;&nbsp;&nbsp;述：</td>
			<td align="left">
				<s:textarea id="descn" name="model.descn" cssStyle="width:350px; height:70px"/>
			</td>
		</tr>
	</table>
</fieldset>
<table width="500" align="center">
	<tr>
		<td style="text-align: center;" colspan="2">
			<s:submit value="保存" cssClass="button"/> 
			<s:reset value="重置" cssClass="button"/>
		</td>
	</tr>
</table>
</s:form></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
	$("#save").validate();
});
</script>
</body>
</html>