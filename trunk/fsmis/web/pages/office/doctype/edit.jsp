<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title></title>
<%@include file="/common/extjs.jsp" %>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/validator.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/fckeditor/fckeditor.js"></script>
<link href="${ctx}/styles/treeSelect.css" type='text/css' rel='stylesheet'>
<script type="text/javascript">
 
</script>
</head>
<body>
<div class="x-panel">
<div class="x-panel-header"></div>
<div class="x-toolbar">
 <table width="100%">
     <tr>
        <td  align="right">
               <a href="${ctx}/office/doctype/index.do"><img
					src="${ctx}/images/icons/house.gif" />首页</a>
        </td>
     </tr>
 </table>
</div>
<div><%@ include file="/common/messages.jsp"%></div>
<div align="center">
<s:form action="save.do" method="post">
<fieldset style="width: 500px; padding-top: 10px">
  <legend>栏目信息</legend>
	<s:hidden name="model.id"/>
	<s:hidden name="parentId"/>
	<table width="500px" align="center" border="0" cellpadding="3" cellspacing="3">
		<tr>
			<td colspan="2"><%@ include file="/common/messages.jsp"%>
			</td>
		</tr>
		<tr>
			<td align="right" width="100">栏目名称：</td>
			<td align="left">
				<s:textfield id="name" name="model.name" cssStyle="width:350px" />
			</td>
		</tr>
		<tr>
			<td align="right" width="100">所属栏目：</td>
			<td align="left">
				<s:select name="model.parentDocumentType.id" listKey="id" listValue="name" list="documentTypeMap" headerKey=""  headerValue="选择栏目..." cssStyle="width:200px"></s:select>
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
</body>
</html>