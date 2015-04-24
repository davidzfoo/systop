需要加入的JS和CSS包括：
<%@include file="/common/extjs.jsp" %>
<%@include file="/common/meta.jsp"%>


&lt;link href="${ctx}/styles/treeSelect.css" type='text/css' rel='stylesheet'&gt;



选择部门（单位）的字段：
<div></div><font color='red'>**</font>**

&lt;s:hidden name="model.dept.id" id="deptId"&gt;



&lt;/s:hidden&gt;


div中会显示一个部门树形列表，该类表被点击后，下面的hidden字段会根据选择，输入不同的数据。
在页面的下方，需要加入：


&lt;script type="text/javascript" src="${ctx}/pages/admin/dept/edit.js"&gt;



&lt;/script&gt;




&lt;script type="text/javascript"&gt;


Ext.onReady(function() {
> var dtree = new DeptTree({
> > url : '/admin/dept/deptTree.do', //部门树形类表的URL
> > parent : '

&lt;stc:loginUserDept showPath="false" propertyName="id" showTopDept="true"&gt;



&lt;/stc:loginUserDept&gt;

',//这是一个taglib，用于显示当前登录用户的部门ID
> > initValue : '${model.dept.name}',//这个是初始数据，用于编辑的情况
> > el : 'comboxWithTree',//前面那个div的ID
> > innerTree :'inner-tree',
> > onclick : function(nodeId) {//当点击树形列表的节点，响应的事件
> > > Ext.get('deptId').dom.value = nodeId;

> > }

> });
> dtree.init();

});


&lt;/script&gt;




&lt;stc:loginUserDept/&gt;

是一个标签，用于显示当前登录用户所在的部门的某个属性：
showPath:是否显示用户所有部门，如果为true，propertyName="name"，则显示：石家庄市政府/裕华区/卫生局
propertyId:Dept表的一个属性。
showTopDept:显示用户所在顶级部门（公司）的属性