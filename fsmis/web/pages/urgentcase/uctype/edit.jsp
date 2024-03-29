<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
<%@include file="/common/meta.jsp" %>
<%@include file="/common/validator.jsp"%>
</head>

<body>
<div class="x-panel">
<div class="x-panel-header">编辑派遣类别</div>
<div class="x-toolbar">
<table width="99%">
	<tr>
		<td align="right">
		<table>
			<tr>
				<td align="right"><a href="${ctx}/uctype/index.do"> 派遣类别列表</a></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<div><%@ include file="/common/messages.jsp"%></div> 
	<div align="center">
	<s:form  action="save.do" id="ucTypeForm" method="post" theme="simple" validate="true">
	<s:hidden name="model.id"/>
	<s:hidden name="model.caseType.id"/>
	<fieldset style="width:510px; padding:10px 10px 10px 10px;">
    	<legend>编辑派遣类别</legend>
        <table width="510px" align="center" >
     
          <tr>
             <td align="right" width="90">名称：</td>
             <td align="left" width="400">
             	<s:textfield id="name" name="model.name" cssStyle="width:300px" cssClass="required"/><font color="red">&nbsp;*</font>
             </td>
          </tr>
           <tr>
             <td align="right" width="90">备注：</td>
             <td align="left" width="300">
             	<s:textfield id="remark" name="model.remark" cssStyle="width:300px;height:150px"/>
             </td>
          </tr>
           <tr>
	             <td align="right">排列序号：</td>
	             <td align="left">
	             	<s:textfield id="sortId" name="model.sortId" cssStyle="width:30px;"></s:textfield>
	             </td>
	          </tr>
        </table> 
    </fieldset>
    <table width="510px" style="margin-bottom:10px;">
    	<tr><td height="8"></td></tr>
		<tr>
			<td style="text-align:center;">
				<s:submit value="保存" cssClass="button" />&nbsp;&nbsp;
				<s:reset value="重置" cssClass="button"/>
		   </td>
		</tr>
	</table>
	</s:form>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
	$("#ucTypeForm").validate();
});
</script>
</body>
</html>