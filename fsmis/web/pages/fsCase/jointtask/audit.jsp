<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="${ctx}/styles/ec/ecside_style.css" />
<%@include file="/common/extjs.jsp" %>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/validator.jsp"%>
<style type="text/css">
.mytable{
	width:600px;
	margin-top:10px;
}
.title {
	padding:6 5 3 5;
	width:100px;
	font-size:12px;
	font-weight: bold;
	text-align: right;
}
.content {
	padding:6 5 3 5;
	font-size:12px;
	text-align: left;
}
/*去掉粗边框的样式*/
.x-tab-panel{
  margin: -1;
}
</style>
</head>
<body >
<script type="text/javascript">
Ext.onReady(function(){
    var tabs = new Ext.TabPanel({
        renderTo: 'tabs',
        anchor : '100% 100%',
        //height : 440,
        activeTab: 0,
        frame:false,
        defaults:{autoHeight: true},
        items:[
            {contentEl:'audit', title: '任务审核'},  
            {contentEl:'task', title: '任务信息'},               
            {contentEl:'taskDetail', title: '任务明细'},                              
            {contentEl:'fsCase', title: '事件信息'}
       
        ]
    });
});

var agreeVal = null;
function setAgreeValue(aValue) {
	agreeVal = aValue;
}

function auditSave(){
	var result = document.getElementById('result').value;
	var info = null;
    if (agreeVal == null || agreeVal == '') {
        Ext.MessageBox.show({
             title:'提示',
             minWidth:220,
             msg:'<div style=\'width:180\';><br/>请选择审核是否通过！</div>',
             buttons:Ext.MessageBox.OK,
             icon:Ext.MessageBox.INFO
        });
        return false;
    }
    if (result == null || result == '') {
        Ext.MessageBox.show({
             title:'提示',
             minWidth:220,
             msg:'<div style=\'width:180\';><br/>请填写审核具体意见！</div>',
             buttons:Ext.MessageBox.OK,
             icon:Ext.MessageBox.INFO
        });
        return false;
    }
    if (agreeVal == '1') {
       info = '确定此任务审核【<font color=\'green\';>通过</font>】吗？'; 
    } else {
       info = '确定此任务审核【<font color=\'red\';>不通过</font>】吗？';    
    }
    Ext.MessageBox.confirm('提示', info, function(btn){
        if (btn == 'yes') {
           var frm = document.getElementById('auditForm');
           frm.action = 'auditSave.do';
           frm.submit();
        }
    });	
}
</script>
<div class="x-panel">
<div class="x-panel-header">联合整治任务审核</div>
<c:if test="${model.id != null}">
<div class="x-toolbar">
    <table width="100%">
      <tr>
        <td align="right">
          <a href="${ctx}/jointTask/index.do">任务列表&nbsp;&nbsp;
          </a>
        </td>
      </tr>
    </table>
</div>
</c:if>
<div><%@ include file="/common/messages.jsp"%></div>
<s:form id="auditForm" validate="true" method="post" enctype="multipart/form-data">
<div id="tabs" style="width: 100%;">
<div id="audit" class="x-hide-display" align="center">
	<s:hidden id="id" name="model.id" />
	<s:hidden id="fsCaseId" name="model.fsCase.id" />	
	<table id="mytable" >
          <tr>
             <td align="right" width="80" height="20">审&nbsp;核&nbsp;人：</td>
             <td align="left" >
             	<stc:username></stc:username>
             </td>
          </tr>
	     <tr>
			<td  align="right">是否通过：</td>
			<td colspan="3" align="left">
				<s:radio list="#{'1':'是', '0':'否'}" id="isAgree" name="checkResult.isAgree" onchange="setAgreeValue(this.value)" cssStyle="border:0;"></s:radio>
				<font color="red">*</font>
			</td>
	     </tr>          
          <tr>
	          <td align="right"  >审核意见：</td>
	          <td align="left" colspan="3">
	          	<s:textarea id="result" name="checkResult.result" cssStyle="width:550px; height:280px" cssClass="required"/>
                <font color="red">&nbsp;*</font>	          
	          </td>
          </tr>       
	</table>
</div>

<div id="task" class="x-hide-display">
<table id="mytable" border="0" cellpadding="1" cellspacing="1"> 
  <tr>
  	<td align="right" width="80">申&nbsp;请&nbsp;人：</td>
  	<td align="left" ><stc:username></stc:username></td>
  </tr>
  <tr>
	<td align="right">拟办意见：</td>
    <td align="left" colspan="1">
    	<div style="width:700px;word-break:break-all;">
     	${model.opinion}
    	</div>
    </td>
  </tr>  
  <tr>
	<td align="right">任务标题：</td>
	<td align="left">${model.title}</td>
  </tr>    
  <tr>
	<td align="right">任务说明：</td>
    <td align="left" colspan="1">
    	<div style="width:700px;word-break:break-all;">
     	${model.descn}
    	</div>
    </td>
  </tr> 
	<tr>
	  <td width="80" align="right">&nbsp;&nbsp;任务附件：</td>
		<td>
		   <table>
				<c:forEach var="mtd" items="${model.taskAttachses}" >
		            <tr>
		              <td width="300" >
						  <a href="${ctx}${mtd.path}" target="_blank"><font color="blue">${mtd.title}</font></a>&nbsp;&nbsp;
		               </td>
					</tr>
				</c:forEach>			
		  </table>
	  </td>
	</tr>       
</table>
</div>

<div id="taskDetail" class="x-hide-display">
<iframe  height="450" src="${ctx}/jointTask/details/index.do?jointTaskId=${param['model.id']}" width="100%" name="taskDetails" frameborder="0"></iframe>
</div>

<div id="fsCase" class="x-hide-display" style="width: 100%">			
	<table class="mytable" align="center" cellpadding="0" cellspacing="0">		
		<tr>
			<td class="title">事件标题:</td>
			<td class="content" colspan="3"><b>${model.fsCase.title}</b></td>
		</tr>
        <tr>
            <td class="title" >事件类型:</td>
            <td class="content" >
               <c:if test="${model.fsCase.isMultiple eq '0'}">
                                                  单体事件
               </c:if>
               <c:if test="${model.fsCase.isMultiple eq '1'}">
                                                  多体事件
               </c:if>
            </td>
        </tr>				
		<tr>
			<td class="title">事件类别:</td>
			<td class="content" colspan="3">${model.fsCase.caseType.name}</td>
		</tr>
		<tr>
			<td class="title">事发时间:</td>
			<td class="content" width="100"><s:date name="model.fsCase.caseTime"format="yyyy-MM-dd" /></td>
			
			<td class="title" width="300">事件地点:</td>
			<td class="content">${model.fsCase.address}</td>
		</tr>
		<tr>
			<td class="title">事件报告人:</td>
			<td class="content">${model.fsCase.informer}&nbsp;</td>
			
			<td class="title">报告人电话:</td>
			<td class="content">${model.fsCase.informerPhone}&nbsp;</td>
		</tr>
		<tr>
			<td class="content" colspan="4" style="border-top:1px dashed #99BBE8; padding: 4 10 4 10;">
				${model.fsCase.descn}
			</td>
		</tr>						
	</table>
</div>
</div>
<table width="100%" style="margin-bottom: 0px;">
		<tr>
			<td height="5"></td>
		</tr>
		<tr>
			<td style="text-align: center;">
			    <input class="button" type="button" value="保存" onclick="return auditSave()">&nbsp;
			    <!--<s:submit value="保存" cssClass="button" onclick="return auditSave()"/>&nbsp;&nbsp;-->
				<s:reset value="重置" cssClass="button"/>
			</td>
		</tr>
</table>
</s:form>
</div>
<script type="text/javascript" src="${ctx}/scripts/fsmis/ShowDeptName.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
$("#auditForm").validate();
});
</script>
</body>
</html>