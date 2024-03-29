<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>

<html>
<head>
<%@include file="/common/ec.jsp" %>
<%@include file="/common/extjs.jsp" %>
<%@include file="/common/meta.jsp" %>

<title></title>
</head>
<body>

<s:form action="user/remove" theme="simple" id="removeForm"></s:form>
<s:form action="user/unsealUser" theme="simple" id="unsealForm"></s:form>
<div class="x-panel">
  <div class="x-panel-header">用户管理</div>
    <div class="x-toolbar">
      <table width="99%">
        <tr>
          <td> 
        <s:form action="user/index" theme="simple">
        	状&nbsp;&nbsp;态：<s:select name="model.status" list='#{"1":"可用","0":"禁用"}' headerKey="" headerValue="全部"/>
        	用户名：<s:textfield name="model.loginId" size="15"/>&nbsp;&nbsp;
        	<s:submit value="查询" cssClass="button"></s:submit>
         </s:form>
        </td>
         <td align="right">
           <table>  
          	  <tr>
		         <td><a href="${ctx}/security/user/index.do"><img src="${ctx}/images/icons/house.gif"/>用户管理首页</a></td>
		         <td><span class="ytb-sep"></span></td>
		         <td><a href="${ctx}/security/user/editNew.do"><img src="${ctx}/images/icons/add.gif"/> 新建用户</a></td>
		         <td><span class="ytb-sep"></span></td>
		         <td><a href="#" onclick="onRemove({noneSelectedMsg:'请至少选择一个用户.',deleteFormId:'unsealForm',
		             confirmMsg:'确认要启用这些用户吗？'})"><img src="${ctx}/images/exticons/recommend.gif"/> 启用用户</a></td>
		         <td><a href="#" onclick="onRemove({noneSelectedMsg:'请至少选择一个用户.',
		             confirmMsg:'确认要禁用这些用户吗？'})"><img src="${ctx}/images/icons/delete.gif"/> 禁用用户</a></td>
         	  </tr>
            </table>
          </td>
        </tr>
      </table>
    </div>   
    <div class="x-panel-body">
    <div style="margin-left:-3px;" align="center">
	<ec:table items="items" var="item" retrieveRowsCallback="limit" sortRowsCallback="limit" 
		action="index.do"
		useAjax="true" doPreload="false"
		maxRowsExported="10000000" 
		pageSizeList="10,20,50,100" 
		editable="false" 
		sortable="true"	
		rowsDisplayed="10"	
		generateScript="true"	
		resizeColWidth="true"	
		classic="false"	
		width="100%" 	
		height="400px"	
		minHeight="400"
		toolbarContent="navigation|pagejump|pagesize|refresh|extend|status"   
	>
	<ec:row>
	    <ec:column width="50" property="_s" title="选择" sortable="false" style="text-align:center">
	       <s:if test="#attr.item.isSys == 1">
	       <input type="checkbox" class="checkbox" disabled="disabled"/>
	       </s:if>
	       <s:else>
	           <input type="checkbox" name="selectedItems" id="selectedItems" value="${item.id}" class="checkbox"/>
	       </s:else>
	       
	    </ec:column>
		<ec:column width="40" property="_0" title="序号" value="${GLOBALROWCOUNT}" sortable="false" />
		<ec:column width="80" property="loginId" title="登录名" />
		<ec:column width="120" property="name" title="姓名" />
		<ec:column width="120" property="mobile" title="手机" />
		<ec:column width="60" property="status" title="状态" style="text-align:center">
		  <s:if test="#attr.item.status == 0">
		  	<font color="red">禁用</font>
		  </s:if>
		  <s:else>
		    <font color="green">可用</font>
		  </s:else>
		</ec:column>
		<ec:column width="70" property="isSys" title="系统用户" style="text-align:center">
		  <s:if test="#attr.item.isSys == 1">
		  	<font color="red">是</font>
		  </s:if>
		  <s:else>
			否
		  </s:else>
		</ec:column>
		<ec:column width="70" property="_1" title="角色" style="text-align:center" sortable="false">
		 	<a href="#" onclick="javascript:assignRoles(${item.id})">分配</a>
		</ec:column>
		<ec:column width="70" property="_2" title="操作" style="text-align:center"  sortable="false">
		   <a href="edit.do?model.id=${item.id}">编辑</a>
		</ec:column>
	</ec:row>
	</ec:table>
	</div>
	</div>
</div>


<div id="win" class="x-hidden">
    <div class="x-window-header">角色列表</div>
    <div id="role_grid"></div>
</div>
<script type="text/javascript" src="${ctx}/pages/admin/security/user/user.js">
</script>
<div id='load-mask'></div>
</body>
</html>