<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title>查看专题地震</title>
<%@include file="/common/ec.jsp"%>
<%@include file="/common/extjs.jsp"%>
<%@include file="/common/meta.jsp"%>
</head>

<body style="text-align: center;">
<div class="x-panel" style="width:1003px;margin:0 auto;">
<div id="tabs" style="margin-top: 0px;margin-left: 0px;margin-right: 0px;">
<div id="basic" class="x-hide-display" >
	<table border="0">
		<tr>
		<td width="100">&nbsp;</td>
		<td width="350" valign="top">
				<table>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>地震目录:</td>
						<td>${catalogName}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>地  点:</td>
						<td>${model.location}  ${phaseCount}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>经  度:</td>
						<td>${model.longitude}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>纬  度:</td>
						<td>${model.latitude}${model.history_pic}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>震  级:</td>
						<td>${model.magnitude}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>深 度:</td>
						<td>${model.depth}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>发震时刻:</td>
						<td>${model.quakeTime}</td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>	
				</table>
			</td>
			<td width="325" align="center">
				<table border="0">
					<tr>
						
						<td>
							<img width="225" height="175" src="${ctx}${model.front_pic}" onError="this.src='${ctx}/images/nophoto.gif'"/>
						</td>
					</tr>
					<tr>
					<td align="center">专题图片</td>
					</tr>		
				</table>
			</td>
			<td width="100">&nbsp;</td>
		</tr>
		<tr>
		<td width="100">&nbsp;</td>
			<td colspan="2">
				<table border="0">
					<tr>
						<td width="55">专题标题:</td>
						<td>${model.title} </td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>	
					<tr>
						<td valign="top">地震描述:</td>
						<td style="line-height: 24px;"><div style="overflow: auto;height: 240px;">${model.desn}</div> </td>
					</tr>
				</table>
			</td>
			<td width="100">&nbsp;</td>
		</tr>
	</table>	
</div>
<c:if test="${model.area ne ''}">
<div id="area" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">影响地区：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.area}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${model.epifocus ne ''}">
<div id="epifocus" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">震中分布图：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.epifocus}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${model.history_pic ne ''}">
<div id="history_pic" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">历史地震分布图：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.history_pic}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${model.m_t ne ''}">
<div id="m_t" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">震中区M-T图：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.m_t}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${model.mechanism ne ''}">
<div id="mechanism" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">震源机制解：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.mechanism}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${model.fracture ne ''}">
<div id="fracture" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">震源破裂过程：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.fracture}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${model.intensity ne ''}">
<div id="intensity" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">烈度分布：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.intensity}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${model.event_wave ne ''}">
<div id="event_wave" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">事件波形数据：</td>
		<td align="left" style="vertical-align: top;line-height: 24px;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.event_wave}</div>
		</td>
	</tr>
</table>	
</div>
</c:if>
<c:if test="${model.station_wave ne ''}">
<div id="station_wave" class="x-hide-display">
<table id="mytable" height="380" style="margin-top: 5px;width: 800px" align="center">
	<tr>
		<td width="15%" align="right" valign="top">台站波形记录图：</td>
		<td align="left" style="vertical-align: top;" width="85%">
		<div style="overflow: auto;height: 480px;">${model.station_wave}</div>
		</td>
	</tr>
</table>
</div>
</c:if>
<c:if test="${phaseCount eq '1'}">
<div id="phase" class="x-hide-display">
<iframe height="480" src="${ctx}/admin/special/getPhaseList.do?specialId=${model.id}" width="970" frameborder="0"></iframe>
</div>
</c:if>
</div>
</div>
<script type="text/javascript">
	Ext.onReady(function() {
		var tabs = new Ext.TabPanel( {
			renderTo : 'tabs',
			anchor : '100% 100%',
			height : 560,
			width : '1003',
			activeTab : 0,
			frame : false,
			defaults : {
				autoHeight : false
			},
			items : [ {
				contentEl : 'basic',
				title : '地震参数'
			}<c:if test="${model.area ne ''}">
			,{
				contentEl : 'area',
				title : '影响地区'
			} </c:if>
			<c:if test="${model.epifocus ne ''}">
			,{
				contentEl : 'epifocus',
				title : '震中分布图'
			}</c:if>
			<c:if test="${model.history_pic ne ''}">
			,{
				contentEl : 'history_pic',
				title : '历史地震分布图'
			} </c:if>
			<c:if test="${model.m_t ne ''}">
			,{
				contentEl : 'm_t',
				title : '震中区M-T图'
			}</c:if>
			<c:if test="${model.mechanism ne ''}">
			 ,{
				contentEl : 'mechanism',
				title : '震源机制解'
			} </c:if>
			<c:if test="${model.fracture ne ''}">
			,{
				contentEl : 'fracture',
				title : '震源破裂过程'
			} </c:if>
			<c:if test="${model.intensity ne ''}">
			,{
				contentEl : 'intensity',
				title : '烈度分布'
			}</c:if> 
			<c:if test="${model.event_wave ne ''}">
			,{
				contentEl : 'event_wave',
				title : '事件波形数据'
			}  </c:if>
			<c:if test="${model.station_wave ne ''}">
			 ,{
				contentEl :'station_wave',
				title : '台站波形记录图'
			}</c:if> 
			<c:if test="${phaseCount eq '1'}">
			,{
				contentEl : 'phase',
				title : '震相数据'
			} </c:if>
			 ]
		});
	});
</script>
</body>
</html>