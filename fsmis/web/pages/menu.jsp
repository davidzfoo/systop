<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setAttribute("ctx", request.getContextPath()); %>
<%@ taglib prefix="stc" uri="/systop/common" %>
<div id="menu" style="display:none">
	<div id="command">	
	    <stc:role ifAnyGranted="ROLE_ADMIN,ROLE_CITY,ROLE_COUNTY">	
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/fscase/index.do?isMultipleCase=0&modelId=0" target="main">单体事件管理</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/task/index.do?isMultipleCase=0&modelId=1" target="main">单体任务管理</a>
		</div>
		</stc:role>
		<stc:role ifAnyGranted="ROLE_COUNTY,ROLE_DEPT">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/taskdetail/index.do?isMultipleCase=0&modelId=1" target="main">单体任务接收</a>
		</div>
		</stc:role>
		<stc:role ifAnyGranted="ROLE_ADMIN,ROLE_CITY,ROLE_COUNTY">	
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/fscase/index.do?isMultipleCase=1&modelId=0" target="main">多体事件管理</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/task/index.do?isMultipleCase=1&modelId=2" target="main">多体任务管理</a>
		</div>
		</stc:role>
		<stc:role ifAnyGranted="ROLE_COUNTY,ROLE_DEPT">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/taskdetail/index.do?isMultipleCase=1&modelId=2" target="main">多体任务接收</a>
		</div>
		</stc:role>
		<stc:role ifAnyGranted="ROLE_CITY,ROLE_COUNTY">	
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/casetype/index.do" target="main">事件类别</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/sendType/index.do" target="main">派遣环节</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/jointTask/index.do" target="main">联合整治管理</a>
		</div>	
		</stc:role>
		<stc:role ifAnyGranted="ROLE_COUNTY,ROLE_DEPT">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/jointTask/deptTaskDetail/deptTaskDetailIndex.do" target="main">联合整治任务接收</a>
		</div>
		</stc:role>
		<stc:role ifAnyGranted="ROLE_DEPT">			
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/casereport/index.do" target="main">部门上报</a>
		</div>	
		</stc:role>
		<stc:role ifAnyGranted="ROLE_CITY">
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/fscase/countyView/listAllDepts.do" target="main">全市情况总揽</a>
			</div>
		</stc:role>		
	</div>
		
	<div id="assess">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/expert/category/index.do" target="main">专家类别</a>
		</div>	
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/expert/index.do" target="main">专家管理</a>
		</div>		
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/assessment/index.do" target="main">评估管理</a>
		</div>
	</div>
	<div id="urgent">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/urgentcase/index.do" target="main">应急管理</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/uctype/index.do" target="main">类别管理</a>
		</div>		
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/ucgroup/index.do" target="main">指挥组管理</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/pages/video/videoClient.jsp" target="_blank">视频会议</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/room/index.do" target="main">历史会议</a>
		</div>
	</div>
	<div id="analyse">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/fscase/statisticByStatus.do" target="main">事件状态统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/fscase/statisticByCounty.do" target="main">事件区县统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/fscase/statisticByNum.do" target="main">事件数量统计</a>
		</div><div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/fscase/statisticByType.do" target="main">事件类别统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/fscase/statisticBySendType.do" target="main">事件派遣环节统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/fscase/statisticBySource.do" target="main">事件来源统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/fscase/statisticByTime.do" target="main">事件统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/task/statisticTaskCounty.do" target="main">任务区县统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/task/statisticTaskStatus.do" target="main">任务状态统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/user/statisticUser.do" target="main">用户登录统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/supervisor/statisticReportCount.do" target="main">信息员信息统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/corp/statisticFsCaseCount.do" target="main">企业信息统计</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/statistics/sms/statisticsSmsSend.do" target="main">短信统计</a>
		</div>
	</div>
	<div id="corp">
		<div style="padding-left:5px;">
		    <div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/corp/edit.do" target="main">添加企业</a>
			</div>          
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/corp/index.do" target="main">企业管理</a>
			</div>
		</div>
	</div>
		
	<div id="supervisor">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/supervisor/index.do" target="main">信息员</a>
		</div>
	</div>
	<div id=member>    
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/member/edit.do" target="main">添加成员</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/member/index.do" target="main">成员管理</a>
		</div>
	</div>
	<div id="sms">
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/smssend/index.do" target="main">短信发送</a>
		</div>
		<div style="padding-top:2px">
			<img src="${ctx}/images/icons/add.gif" class="icon">
			<a href="${ctx}/smsreceive/index.do" target="main">短信接收</a>
		</div>
	</div>
	<div id="office">
		<div style="padding-left:5px;">   
			<stc:role ifAnyGranted="ROLE_CITY,ROLE_COUNTY">	
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/office/doctype/index.do" target="main">栏目管理</a>
			</div>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/office/doc/index.do" target="main">文章管理</a>
			</div>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/office/notice/index.do" target="main">通知管理</a>
			</div>
			</stc:role>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/office/receiverecord/index.do" target="main">接收通知</a>
			</div>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/office/message/received.do" target="main">内部消息</a>
			</div>
		</div>
	</div>
	<div id="configer">
		<div style="padding-left:5px;">
			  <div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/configuration/index.do" target="main">多体事件汇总配置</a>
			</div>
		</div>
	</div>
	<div id="cms">
		<div style="padding-left:5px;">   
			<div style="padding-top:2px">
				<a href="${ctx}/admin/template/listTemplate.do" target="main">
					<img src="${ctx}/images/icons/xhtml_go.gif" class="icon">模板管理</a>
			</div>
			<br>
			<div style="padding-top:2px">
				<a href="${ctx}/admin/catalog/listCatalog.do" target="main">
					<img src="${ctx}/images/icons/folder_table.gif" class="icon">栏目管理</a>
			</div>
			<div style="padding-top:2px">
				<a href="${ctx}/admin/article/listArticles.do" target="main">
					<img src="${ctx}/images/icons/articles.gif" class="icon">文章管理</a>
			</div>
			<div style="padding-top:2px">
				<a href="${ctx}/admin/article/listAuditArticles.do" target="main">
					<img src="${ctx}/images/icons/article_check.gif" class="icon">文章审核</a>
			</div>
			<br>
			<div style="padding-top:2px">
				<a href="${ctx}/admin/announce/listAnnounce.do" target="main">
					<img src="${ctx}/images/icons/a_list.gif" class="icon">公告管理</a>
			</div>
			<div style="padding-top:2px">
				<a href="${ctx}/admin/links/listLink.do" target="main">
					<img src="${ctx}/images/icons/link.gif" class="icon">链接管理</a>
			</div>
			<div style="padding-top:2px">
				<a href="${ctx}/admin/software/index.do" target="main">
					<img src="${ctx}/images/icons/compressed.gif" class="icon">软件管理</a>
			</div>
			<div style="padding-top:2px">	
                <a href="${ctx}/admin/advisory/list.do" target="main">
                	<img src="${ctx}/images/icons/template.gif" class="icon">反馈管理</a>
			</div>		
		</div>
	</div>
	
	<div id="xkgl">
		<div style="padding-left:5px;">
		    <div style="padding-top:2px">
				<img src="${ctx}/images/icons/group.gif" class="icon">
				<a href="${ctx}/admin/dept/index.do" target="main">单位/部门管理</a>
			</div>          
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/user.gif" class="icon">
				<a href="${ctx}/security/user/index.do" target="main">用户管理</a>
			</div>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/role.gif" class="icon">
				<a href="${ctx}/security/role/index.do" target="main">角色管理</a>
			</div>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/authority.gif" class="icon">
				<a href="${ctx}/security/permission/index.do" target="main">权限管理</a>
			</div>
			<div style="padding-top:4px;"> 
				<img src="${ctx}/images/icons/resource.gif" class="icon">
				<a href="${ctx}/userHistory/userHistoryList.do" target="main"><font color="red">登录记录</font></a>
			</div> 
			<div style="padding-top:2px"> 
				<img src="${ctx}/images/icons/resource.gif" class="icon">
				<a href="${ctx}/security/resource/index.do" target="main">资源管理</a>
			</div>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/user_go.gif" class="icon">
				<a href="${ctx}/regist/index.do" target="main">注册用户管理</a>
			</div>
			<div style="padding-top:2px">
				<img src="${ctx}/images/icons/add.gif" class="icon">
				<a href="${ctx}/fsmis/googlemap/edit.do" target="main">WebGIS配置</a>
			</div>
		</div>
	</div>
	<div id="help">
		<div style="padding-left:5px;">  
		</div>
	</div>
</div>
