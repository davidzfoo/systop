<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>事件采集管理</title>
<%@include file="/common/ec.jsp"%>
<%@include file="/common/extjs.jsp"%>
<%@include file="/common/meta.jsp"%>
<script type="text/javascript">
function remove(id) {
    Ext.MessageBox.confirm('提示','确认要删除此事件吗？删除后不能恢复！', function(btn){
        if (btn == 'yes') {
          window.location = "${ctx}/fscase/remove.do?model.id=" + id+"&modelId=0&isMultipleCase="+${isMultipleCase};
        }
    });
  }
function caseRemove(caseId) {
    Ext.MessageBox.confirm('提示','确认要删除联合整治事件信息吗?删除后不能恢复！', function(btn){
        if (btn == 'yes') {
          window.location = "${ctx}/jointTask/caseRemove.do?model.fsCase.id=" + caseId;
        }
    });
  }
function mapOfFsCases() {
    window.location = "${ctx}/fscase/fsCaseOfMap.do";
}
</script>
</head>
<body>
<div class="x-panel">
<div class="x-panel-header">${isMultipleCase eq 0?'单体事件':'多体事件'}管理</div>
<div class="x-toolbar">
<table width="99%">
	<tr>
		<td><s:form action="index" method="post">
			<s:hidden name="isMultipleCase"></s:hidden>
						事件标题:
			<s:textfield name="model.title" cssStyle="width:100px"></s:textfield>	
						事件编号:
			<s:textfield name="model.code" cssStyle="width:70px"></s:textfield>
			<br>			事发时间:
			<input type="text" name="caseBeginTime" style="width: 120px"
				value='<s:date name="caseBeginTime" format="yyyy-MM-dd HH:mm"/>'
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm'})"
				class="Wdate" />
						</>至
			<input type="text" name="caseEndTime" style="width: 120px"
				value='<s:date name="caseEndTime" format="yyyy-MM-dd HH:mm"/>'
				onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm'})"
				class="Wdate" />
			                              事件状态:
			<s:select name="model.status" list="stateMap" headerKey="" headerValue="请选择"/>		
			<s:submit value="查询" cssClass="button"></s:submit>
		</s:form></td>
		<td>
			<c:if test="${isMultipleCase eq 0}"><input onclick="mapOfFsCases()" type="button" value="事件分布图" class="button" /></c:if>
		</td>
		<td align="right">
		<stc:role ifNotGranted="ROLE_DEPT_OPER">
		<table>
			<tr>
				<td><span class="ytb-sep"></span></td>
				<td>
					<c:if test="${isMultipleCase eq 0}"><a href="${ctx}/fscase/edit.do?isMultipleCase=${isMultipleCase}&modelId=${modelId}"> 添加事件</a></c:if>			
				</td>
			</tr>
		</table>
		</stc:role>
		</td>
	</tr>
</table>
</div>
<div class="x-panel-body">
<div style="margin-left: -3px;" align="center">
<ec:table
	items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit"
	action="index.do" useAjax="false"
	doPreload="false" 
	pageSizeList="20,50,100,200" 
	editable="false"
	sortable="false" 
	rowsDisplayed="20" 
	generateScript="true"
	resizeColWidth="false" 
	classic="false" 
	width="100%" 
	height="430px"
	minHeight="430"
	toolbarContent="navigation|pagejump|pagesize|refresh|extend|status">
	<ec:row>
		<ec:column width="30" property="_s" title="No." value="${GLOBALROWCOUNT}" sortable="false" style="text-align:center"/>	
		<ec:column width="350" property="title" title="事件标题" tipTitle="${item.title}" ellipsis="true" sortable="false"/>
		<ec:column width="80" property="caseType.name" title="事件类别" sortable="false"/>
		<ec:column width="115" property="caseTime" title="事发时间"
			style="text-align:center" cell="date" format="yyyy-MM-dd HH:mm" sortable="false"/>	
		<c:if test="${item.isSubmited ne '1'}">
		 <ec:column width="50" property="status" title="事件状态"  mappingItem="stateColorMap" style="text-align:center" sortable="false"/>
		</c:if>
		<c:if test="${item.isSubmited eq '1'}">
		 <ec:column width="50" property="status" title="事件状态"  mappingItem="stateColorMap" style="text-align:center" sortable="false">
		    <font color='#993300'>已上报</font>
		 </ec:column>
		</c:if>	
		<c:if test="${param['isMultipleCase'] eq 0}">
		<ec:column width="60" property="_3" title="事件来源" style="text-align:center" sortable="false">
			<c:if test="${item.caseSourceType == 'generic'}">普通</c:if>
			<c:if test="${item.caseSourceType == 'jointask'}">联合</c:if>
			<c:if test="${item.caseSourceType == 'deptreport'}">部门报</c:if>
			<c:if test="${item.caseSourceType == 'district'}">区县报</c:if>
		</ec:column>
		</c:if>
		<ec:column width="60" property="_4" title="处理流程" style="text-align:center" sortable="false">
			<c:if test="${item.processType == 'task'}">普通</c:if>
			<c:if test="${item.processType == 'jointask'}">联合</c:if>
		</ec:column>
		<ec:column width="50" property="_6" title="查看" style="text-align:center" sortable="false">
		<c:if test="${item.caseSourceType != 'jointask' }">
		   <c:if test="${empty item.processType || item.processType eq 'task'}">	
		        <a title="查看事件" href="${ctx}/fscase/view.do?fsCaseId=${item.id}&modelId=0&isMultipleCase=${isMultipleCase}">看 </a> |
		   </c:if>
		   <c:if test="${item.processType eq 'jointask'}">	
                <a title="查看事件" href="${ctx}/jointTask/view.do?model.id=<c:forEach items='${item.jointTaskses}' var='jointTask'>${jointTask.id}</c:forEach>">看 </a> |		   
		   </c:if>
		</c:if>
		
		<c:if test="${item.caseSourceType eq 'jointask'}">
	       <c:choose>
		     <c:when test="${!empty item.jointTaskses}"> 
                <a title="查看事件" href="${ctx}/jointTask/view.do?model.id=<c:forEach items='${item.jointTaskses}' var='jointTask'>${jointTask.id}</c:forEach>">看 </a> |       
		     </c:when>
		     <c:otherwise>
                <a title="查看事件" href="${ctx}/fscase/view.do?fsCaseId=${item.id}&modelId=0&isMultipleCase=${isMultipleCase}">看 </a> |	       
		     </c:otherwise>
		   </c:choose> 			
		</c:if>
		
		<c:set var="i" value="0"></c:set>
		<c:set var="dispatchTime" value="0"></c:set>
		<c:set var="closedTime" value="0"></c:set>
			<c:forEach items="${item.taskses}" var="st">
			    <c:if test="${st.status == '1'}">
				  <c:set var="i" value="1"></c:set>
				</c:if>
				<c:if test="${st.status == '2' || st.status == '3'}">
				  <c:set var="closedTime" value="${st.closedTime}"></c:set>
				</c:if>
				<c:set var="dispatchTime" value="${st.dispatchTime}"></c:set>
			</c:forEach>	
		<a title="流" href="#" onclick="showProcess('${item.status}','${i}','${item.isSubmited}','${item.caseTime}','${item.closedTime}','${dispatchTime}','${closedTime}','${item.isMultiple}','${item.title}')">流</a>
		</ec:column>
		<stc:role ifNotGranted="ROLE_DEPT_OPER">
		<ec:column width="155" property="_0" title="操作" style="text-align:center" sortable="false">
		<!-- 0未派遣1已派遣2已处理3回退4已核实完成5忽略6核实不过-->	
			<c:if test="${item.caseSourceType != 'jointask'}">
				<c:if test="${empty item.status or item.status eq '0' or item.status eq '3' or item.status eq '5' or item.status eq '6'}">		
				    <a title="修改事件" href="${ctx}/fscase/edit.do?model.id=${item.id}&modelId=0&isMultipleCase=${isMultipleCase}">改 </a> |
				    <a title="派遣任务" href="#" onclick="showChooseSendTypeWindow(${item.id},'${item.title}')">派</a> |
				    <c:if test="${(item.isSubmited eq '0') && (item.submitedCase eq null) }">
				      <a title="删除任务"href="#" onclick="remove(${item.id})" >删</a> 
				    </c:if>
				    <c:if test="${item.isSubmited eq '1' }">
				       <font color="silver" >删</font> 
				    </c:if>
				    <c:if test="${item.submitedCase != null }">
				       <font color="silver" >删</font> 
				    </c:if>
				    <c:if test="${param['isMultipleCase'] eq 0}">
				     | <font color="silver" >核</font>	
				    </c:if>		    
	            </c:if>
            </c:if>  
            
            <c:if test="${item.caseSourceType eq 'jointask'}">
				<c:if test="${empty item.status or item.status eq '0' }">		
				    <a title="修改事件" href="${ctx}/jointTask/addCase.do?model.fsCase.id=${item.id}">改 </a> |
				    <a title="派遣任务" href="${ctx}/jointTask/edit.do?model.fsCase.id=${item.id}">派</a> |
				    <a title="删除任务" href="#" onclick="caseRemove(${item.id})" >删</a> 
				    <c:if test="${param['isMultipleCase'] eq 0}">
				     | <font color="silver" >核</font>	
				    </c:if>		    
	            </c:if>
	            <c:if test="${item.status eq '1' || item.status eq '2'}">
		            <font color="silver" >改</font> |
				    <font color="silver" >派</font> |
				    <font color="silver" >删</font> 
				    <c:if test="${param['isMultipleCase'] eq 0}">
				     | <font color="silver" >核</font> 	
			    </c:if>	
	            </c:if>
            </c:if>        
                          
            <c:if test="${item.caseSourceType != 'jointask' && item.status eq '1'}">		
			    <font color="silver" >改</font> |
			    <font color="silver" >派</font> |
			    <font color="silver" >删</font> 
			    <c:if test="${param['isMultipleCase'] eq 0}">
			     | <font color="silver" >核</font> 	
			    </c:if>		  
            </c:if>
            <c:if test="${item.caseSourceType != 'jointask' && item.status eq '2'}">		
			    <a title="修改事件" href="${ctx}/fscase/edit.do?model.id=${item.id}&modelId=0&isMultipleCase=${isMultipleCase}">改 </a> |
			    <a title="派遣任务" href="#" onclick="showChooseSendTypeWindow(${item.id},'${item.title}')">派</a>  |
			    <font color="silver" >删</font> 
			    <c:if test="${param['isMultipleCase'] eq 0}">
			    <c:choose>
				    <c:when test="${empty item.msgCheckedFlag or item.msgCheckedFlag == '0'}">
				    	| <a title="核实" href="addSendMsg.do?model.id=${item.id}&modelId=0&isMultipleCase=${isMultipleCase}">核</a>
				    </c:when>	
				     <c:when test="${item.msgCheckedFlag == '1'}">
				    	| <a title="核实反馈" href="confirmBackMsg.do?model.id=${item.id}&modelId=0&isMultipleCase=${isMultipleCase}"><img src="${ctx}/images/icons/he.gif"  /></a>
				    </c:when>		    
				    <c:otherwise>
				    	| <font color="silver" >核</font> 	
				    </c:otherwise>
			    </c:choose>	
			    </c:if>	   
            </c:if>
            <c:if test="${item.caseSourceType != 'jointask' && item.status eq '4'}">		
			    <font color="silver" >改</font> |
			    <font color="silver" >派</font> |
			    <font color="silver" >删</font> 
			    <c:if test="${param['isMultipleCase'] eq 0}">
			     | <a title="查看核实反馈" href="confirmBackMsg.do?model.id=${item.id}&operType=V&modelId=0&isMultipleCase=${isMultipleCase}">核</a>
			    </c:if>	
            </c:if>
		<c:if test="${isMultipleCase eq '0' && item.coordinate eq null}">
			| <a title="地图标注信息" href="map.do?model.id=${item.id}">注</a>
		</c:if>
		<c:if test="${isMultipleCase eq '0' && item.coordinate ne null}">
			| <a title="地图标注信息" href="map.do?model.id=${item.id}">图</a>
		</c:if>
		<c:if test="${isMultipleCase eq '1'}">
			| <a title="地图标注信息" href="mapMult.do?model.id=${item.id}">图</a>
		</c:if>
		</ec:column>
		</stc:role>
	</ec:row>
</ec:table>
</div>
</div>
</div>
<jsp:include page="flow/process.jsp"></jsp:include>
<jsp:include page="chooseSendType.jsp"></jsp:include>
</body>
</html>
