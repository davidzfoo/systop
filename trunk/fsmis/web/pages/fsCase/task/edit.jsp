<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title></title>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/validator.jsp"%>
<script type="text/javascript" language="javascript" src="${ctx}/scripts/fsmis/attachments.js"></script>
<script type="text/javascript">
	function deleteAttachment(attachmentId) {
		if (confirm("确定要删除吗？")) {
			deleteDiv(attachmentId);
			ArticleAction.removeAttachments(attachmentId, function(msg) {
				if (msg == 'success') {
					alert('删除成功！');
				} else if (msg == 'error') {
					alert('文章下存在附件不能删除。');
				}
			});
		}
	}
	function deleteDiv(attachmentId) {
		document.getElementById('attachments' + attachmentId).style.display = 'none';
		document.getElementById('attachments' + attachmentId).innerHTML = "";
		document.getElementById('attachments' + attachmentId).removeNode();
	}

	//附件操作初始化
	util = new fileUtil();
	util.style = "width:300px;";
	util.deleteIcon = "${ctx}/images/exticons/cross.gif";
</script>

</head>
<body>
<div class="x-panel">
<div class="x-panel-header">协调指挥&nbsp;&gt;&nbsp;单体事件管理&nbsp;&gt;&nbsp;事件列表&nbsp;&gt;&nbsp;事件查看&nbsp;&gt;&nbsp;派遣任务</div>
<div class="x-toolbar">&nbsp;</div>
<div><%@ include file="/common/messages.jsp"%></div>
<div align="center"><s:form action="/task/save.do" method="post"
	theme="simple" enctype="multipart/form-data" validate="true" id="taskForm">
	<input type="hidden" name="model.fsCase.id" value="${model.fsCase.id}"></input>
	<fieldset style="width: 800px; padding: 10px 10px 10px 10px;" class="">
	<legend> 派遣信息</legend>
	<table width="550px" align="center">
		<tr>
			<td align="right">执行部门：</td>
			<td align="left">
			<div id="selectDepts"
				style="width: 400px; word-break: break-all; color: red;"></div>
			<s:hidden id="selectDeptNames" name="selectDeptNames"></s:hidden></td>
		</tr>
		<tr>
			<td align="right">请点选执行部门：</td>
			<td align="left">
			<div
				style="border: 1px solid #099EBD; OVERFLOW-Y: scroll; width: 400px; SCROLLBAR-ARROW-COLOR: #e8e8e8; SCROLLBAR-BASE-COLOR: #e8e8e8; HEIGHT: 90px">
			<fs:selectDepts name="deptIds" sendTypeId="${sendTypeId}"
				splitLineStyle="1px dotted blue;" itemClass="checkbox" />
				</div>
			</td>
		</tr>
		<tr>
			<td align="right">任务标题：</td>
			<td align="left"><input type="text" name="model.title"
				value="${model.fsCase.title }" style="width: 400px;" class="required"></input> <font
				color="red">&nbsp;*</font></td>
		</tr>
		<tr>
			<td align="right">任务完成时间：</td>
			<td align="left"><input id="date" type="text" class="required"
				name="model.presetTime"
				value='<s:date name="model.presetTime" format="yyyy-MM-dd HH:mm:ss"/>'
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
				class="Wdate" /><font color="red">&nbsp;*</font></td>
		</tr>
		<tr>
			<td align="right">任务描述：</td>
			<td align="left"><s:textarea id="desc" name="model.desc"
				cssStyle="width:400px; height:100px;" cssClass="required"/><font color="red">&nbsp;*</font></td>
		</tr>
		<tr>
			<td align="right">附件：</td>
			<td style="padding: 10 5 2 5;">
				<a href="#"	onclick='util.add("fileUpload")'> <img src="${ctx}/images/icons/file_add.gif">增加附件</a>
					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<table>
						<tbody id="fileUpload"></tbody>
					</table>
				</td>
			</tr>
	</table>
	</fieldset>
	<table width="600px" style="margin-bottom: 10px;">
		<tr>
			<td style="text-align: center;"><s:submit value="派遣任务"
				cssClass="button" onclick="return validate(this.form);" /> <s:reset
				value="重置" cssClass="button" /></td>
		</tr>
	</table>
</s:form></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
	$("#taskForm").validate();
});

</script>
</body>
</html>