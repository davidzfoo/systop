<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  request.setAttribute("ctx", request.getContextPath());
%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>systopbase</title>
<%@ include file="/common/extjs.jsp" %>
<%@ include file="/common/meta.jsp" %>
<link href="${ctx}/pages/layout.css" type='text/css' rel='stylesheet'/>
<style type="text/css">
.x-layout-split{
	border: 1px solid #abc;
	border-top: 0 none;
	border-buttom: 0 none;
}
</style>
<script type="text/javascript">
Ext.onReady( function() {
	deptTree=new Ext.tree.TreePanel({
		region :'west',
		title :'在职人员',
		width :160,
		minSize :150,
		maxSize :200,
		split :true,
		autoScroll :true,
		autoHeight :false,
		collapsible :true,
		border:false,
	       loader:new Ext.tree.XTreeLoader({
	         dataUrl:"/hr/employee/deptEmpTree.do",
        	 listeners : {
				"beforeCreateNode" : function(l, attr) {
					if (attr.descn == "DEPT" && !attr.childNodes) {
						attr.iconCls="dept-tree-node-icon";
					}
					if (attr.descn == "EMP") {
						if (attr.sex == 'F') {
							attr.iconCls = "emp-M-tree-node-icon";
						} else {
							attr.iconCls = "emp-F-tree-node-icon";
						}
					}
				}
	         }
	       }),
       rootVisible : false,
       root : new Ext.tree.AsyncTreeNode({
  		  text : 'systop',
  		  id : '0',
  		  expanded:true
	   }),
	   listeners:{
           "click":function(node,e){
	        	if (node.id == 0) {
					return;
	        	}
	        	if (node.attributes.descn == 'EMP') {
	        		Ext.get('empMain').dom.src = '${ctx}/hr/employee/edit.do?model.id='+node.id;
		        }
		        if (node.attributes.descn == 'DEPT') {
		        	Ext.get('empMain').dom.src = '${ctx}/hr/employee/index.do?deptId='+node.id;
			    }
			    
			}
		}
	   });
	 
	new Ext.Viewport( {
		layout :'border',
		defaults : {
			activeItem :0
		},
		items : [ deptTree, {
                  region:'center',
                  contentEl: 'center',
                  border:false,
                  style :'border: 0px solid red',
                  margins:'0 0 0 0'
              } ]
	});
});
</script>
</head>
<body>
<div id="center"><iframe src="${ctx}/hr/employee/index.do" id="empMain"
	name="empMain" style="width:100%; height:100%; border:0px;" scrolling="no" frameborder="0"></iframe></div>
</body>
</html>
