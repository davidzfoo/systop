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
  function valileader(){
    var code = document.getElementById("code").value;
    var informerPhone = document.getElementById("informerPhone").value;
    var informer = document.getElementById("informer").value;
   
    if(isNaN(code)){
      alert("事件编号必须为数字！");
      return false;
    }else if(isNaN(informerPhone)){
      alert("报告人电话必须为数字！");
      return false;
    }else if(parseInt(informer.length)>=10){
      alert("报告人字数太多！");
      return false;
    }
	
  }

  $(function(){
	  $('#levelone').change(function() {
			var subid = $("#levelone")[0].value;
			if (subid == null || subid == '') {
				$('#itemId').empty();
				$('<option value=\'\'>请选择...</option>').appendTo('#itemId');
				return;
			}
			
			$.ajax({
				url: '${ctx}/fscase/getLevelTwo.do',
				type: 'post',
				dataType: 'json',
				data: {typeId : subid},
				success: function(rows, textStatus){
				   $('#itemId').empty();
				   $('<option value=\'\'>请选择...</option>').appendTo('#itemId');
				   for (var i = 0; i < rows.length; i ++) {
				   	var row = rows[i];
				   	$('<option value=' + row.id + '>' + row.name + '</option>').appendTo('#itemId');
				   }
					//alert(data.length);
				}
			});
	    });
  });

 
  Ext.onReady(function(){

			var subid = document.getElementById("oneId").value;
			var twoid = document.getElementById("twoId").value;
			if (subid != null && subid != '') {
				$('#levelone').val(subid);
			}
	      $.ajax({
			     url: '${ctx}/fscase/getLevelTwo.do',
			     type: 'post',
				 dataType: 'json',
				 data: {typeId : subid},
				 success: function(rows, textStatus){
				 $('#itemId').empty();
				 $('<option value=\'\'>请选择...</option>').appendTo('#itemId');
				 for (var i = 0; i < rows.length; i ++) {
					  var row = rows[i];
					   $('<option value=' + row.id + '>' + row.name + '</option>').appendTo('#itemId');
				 }
				 if (twoid != null && twoid != '') {
						$('#itemId').val(twoid);
				 }
			}
	     }); 		    
	
  });

  //文本编辑组件
  function preFckEditor(){
	var fckEditor = new FCKeditor( 'descn' ) ;
    fckEditor.BasePath = "${ctx}/scripts/fckeditor/";
    fckEditor.ToolbarSet = 'BasicA';
    fckEditor.Height = 300;
    fckEditor.Width = 600;
    fckEditor.ReplaceTextarea();
  }
</script>
</head>
<body onload="preFckEditor()">
<div class="x-panel">
<div class="x-panel-header">案件列表</div>
<div class="x-toolbar">
 <table width="100%">
     <tr>
        <td  align="right">
               <a href="${ctx}/fscase/index.do">首页</a>
        </td>
     </tr>
 </table>
</div>
<div><%@ include file="/common/messages.jsp"%></div>
<div align="center">
<s:form action="save.do" id="save" method="post" theme="simple" validate="true" onsubmit="return valileader()">
    <input type="hidden" name="isMultipleCase" value="${isMultipleCase}"></input>
    <input type="hidden" name="modelId" value="${param['modelId'] }"></input>
    <input type="hidden" name="smsReceiveId" value="${smsReceiveId}"></input>
    <s:hidden name="isMultiple"></s:hidden>
	<s:hidden name="model.id" />
	<s:hidden name="mesId"/>
	<s:hidden id="oneId" name="oneId"/>
	<s:hidden id="twoId" name="twoId"/>
	<fieldset style="width: 800px; padding: 10px 10px 10px 10px;">
	<legend>编辑案件</legend>
	<table width="800px" align="left">
		<tr>
			<td align="right" width="150">案件标题：</td>
			<td align="left"><s:textfield id="name"
				name="model.title" cssStyle="width:380px" cssClass="required"/><font color="red">&nbsp;*</font>
			</td>
		</tr>
		
		<tr>
			<td align="right">案发时间：</td>
			<td align="left"><input type="text" name="model.caseTime"  style="width: 160px" class="required"
				value='<s:date name="model.caseTime" format="yyyy-MM-dd HH:mm:ss"/>'
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
				class="Wdate" /><font color="red">&nbsp;*</font></td>
		</tr>
		<tr>
			<td align="right">案发地点：</td>
			<td align="left"><s:textfield id="softVersion"
				name="model.address" cssStyle="width:380px" cssClass="required"/><font color="red">&nbsp;*</font></td>
		</tr>
		<tr>
			<td align="right">案件编号：</td>
			<td align="left"><s:textfield id="code"
				name="model.code" cssStyle="width:380px" cssClass="required"/><font color="red">&nbsp;*</font></td>
		</tr>
		<tr>
			<td align="right">案件类别：</td>
			<td align="left">
				 <select id="levelone" name="typeoneId" style="width:120px;" class="required">
					    <option value="">请选择...</option>
						<c:forEach items="${levelone}" var="item">
					       <option value="${item.id}" >${item.name}</option>
					    </c:forEach>
			      </select>
			     <select id="itemId" name="typetwoId" style="width:120px;">
					    <option value="">请选择...</option>
				 </select>
				 <font color="red">&nbsp;*</font>
			</td>
		</tr>
		<tr>
			<td align="right">所属区县：</td>
			<td align="left">		
				<div id="comboxWithTree"  style="float: left;margin-left:2px;" class="required"></div><font color="red" style="margin-left:2px;">*</font>
				<s:hidden name="model.county.id" id="deptId"></s:hidden>
			</td>
		</tr>
		<tr>
			<td align="right">报告人：</td>
			<td align="left"><s:textfield id="informer"
				name="model.informer" cssStyle="width:120px" /></td>
		</tr>
		<tr>
			<td align="right">报告人电话：</td>
			<td align="left"><s:textfield id="informerPhone"
				name="model.informerPhone" cssStyle="width:120px" /></td>
		</tr>
		<tr>
			<td align="right">案件描述：</td>
			<td align="left">
				<textarea id="descn" name="model.descn" cols="45" rows="4" class="required" >${model.descn}</textarea>
				<font color="red">*</font>
			</td>
		</tr>
	</table>
	</fieldset>
	<table width="600px" style="margin-bottom: 10px;">
		<tr>
			<td style="text-align: center;">
			  <s:submit value="保存" 	cssClass="button" /> 
			  <s:reset value="重置" cssClass="button" />
			</td>
		</tr>
	</table>
</s:form></div>
</div>

<script type="text/javascript" src="${ctx}/pages/admin/dept/edit.js"></script>
<script type="text/javascript">
Ext.onReady(function() {
	var dtree = new DeptTree({
		url : '/admin/dept/deptTree.do',
		parent : '<stc:loginUserDept showPath="false" propertyName="id" showTopDept="true"></stc:loginUserDept>&noLowerDept=1',
		initValue : '${model.county.name}',
		el : 'comboxWithTree',
		innerTree :'inner-tree',
		onclick : function(nodeId) {
		  Ext.get('deptId').dom.value = nodeId;
		}
	});
	dtree.init();	
	
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
	$("#save").validate();
});
</script>
</body>
</html>