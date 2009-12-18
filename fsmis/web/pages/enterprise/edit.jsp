<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
<title></title>
<%@include file="/common/meta.jsp"%>
<%@include file="/common/dwr.jsp" %>
<script type="text/javascript" src="${ctx}/scripts/fckeditor/fckeditor.js"></script>
<script type="text/javascript" src="${ctx}/dwr/interface/CompanyDwrAction.js"></script>
<script type="text/javascript">
  //检查上传照片
  function checkPhotoPath(){
    try{
      document.getElementById("companyForm").submit();
    }catch(e){
      alert("上传的监管员照片无效!");      
      return false;
    }
  }
  //异步删除照片
  function deletePhoto(spId){
    if(confirm("确定要删除该监管员的照片吗?")){           
      CompanyDwrAction.deletePhoto(spId, function(mes){
		    if(mes == "success"){
		          document.getElementById("photoOperSpan1").innerHTML=
		            "<img alt='企业照片' align='center' width='300' height='255' id='imgphoto' src='${ctx}/images/com_nophoto_big.gif'/><br/>";
		          document.getElementById("photoOperSpan2").innerHTML=
		           "<input type='file' id='photo' name='photo' class='FileText' onchange='changeImg()'/>";
		    }else{
		          alert("删除企业照片失败，请与管理员联系！");
		    }     
      });    
    }    
  }
  
  function changeImg(){
  	var img = document.getElementById("photo");
  	var imgphoto = document.getElementById("imgphoto");
  	imgphoto.src = img.value;
  }
  
  //文本编辑组件
  function preFckEditor(){
	var fckEditor = new FCKeditor( 'integrityRecord' ) ;
    fckEditor.BasePath = "${ctx}/scripts/fckeditor/";
    fckEditor.ToolbarSet = 'BasicA';
    fckEditor.Height = 350;
    fckEditor.ReplaceTextarea();
}
</script>
</head>
<body onload="preFckEditor()">
<div class="x-panel">
<div class="x-panel-header">诚信企业管理&nbsp;>&nbsp;企业列表&nbsp;>&nbsp;企业信息</div>
<div align="center" >
 <s:form id="companyForm" action="save.do" method="post" theme="simple" enctype="multipart/form-data" onsubmit="return checkPhotoPath()">
	<s:hidden name="model.id" />
	<fieldset style="width: 830px; padding: 10px 10px 10px 10px;">
	<legend>企业信息</legend>
	<table width="800">
		<tr>
			<td><%@ include file="/common/messages.jsp"%> </td>
		</tr>
	</table>
	<table width="800" border="0">
	  <tr>
		<td width="500">
		  <table width="498" align="center" border="0" cellpadding="2" cellspacing="1">
          <tr>
            <td width="119" align="right">企业名称：</td>
            <td align="left" colspan="3">
            	<s:textfield id="name" name="model.name" cssStyle="width:350px" />
                <font color="red">&nbsp;*</font> 
            </td>
          </tr>
          <tr>
            <td width="119" align="right">地　　址：</td>
            <td align="left" colspan="3">
            	<s:textfield id="address" name="model.address" cssStyle="width:350px" />
                <font color="red">&nbsp;*</font> </td>
          </tr>
          <tr>
            <td width="119" align="right">法　　人：</td>
            <td align="left" colspan="3">
            	<s:textfield id="legalPerson" name="model.legalPerson" cssStyle="width:350px" />
            </td>
          </tr>
          <tr>
            <td width="119" align="right">工商营业执照：</td>
            <td width="149" align="left">
            	<s:textfield id="businessLicense" name="model.businessLicense" />
            </td>
            <td align="right" width="80">有效期：</td>
            <td width="150" align="left">
            	<input type="text" name="model.businessLicenseDate" value='<s:date name="model.businessLicenseDate" format="yyyy-MM-dd"/>'
				  onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" class="Wdate" style="width:115px;height:16px" readonly="readonly"/>
            </td>
          </tr>
          <tr>
            <td width="119" align="right">生产许可证：</td>
            <td width="149" align="left">
            	<s:textfield id="produceLicense" name="model.produceLicense"/>
            </td>
            <td align="right" width="80">有效期：</td>
            <td width="150" align="left">
            	<input type="text" name="model.produceLicenseDate" value='<s:date name="model.produceLicenseDate" format="yyyy-MM-dd"/>'
				  onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" class="Wdate" style="width:115px;height:16px" readonly="readonly"/>
            </td>
          </tr>
          <tr>
            <td width="119" align="right">卫生许可证：</td>
            <td width="149" align="left">
            	<s:textfield id="sanitationLicense" name="model.sanitationLicense" />
            </td>
            <td align="right" width="80">有效期：</td>
            <td width="150" align="left">
            	<input type="text" name="model.sanitationLicenseDate" value='<s:date name="model.sanitationLicenseDate" format="yyyy-MM-dd"/>'
				  onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" class="Wdate" style="width:115px;height:16px" readonly="readonly"/>
            </td>
          </tr>
          <tr>
            <td width="119" align="right">企业编号：</td>
            <td width="149" align="left">
            	<s:textfield id="code" name="model.code"/>
                <font color="red">&nbsp;*</font> 
            </td>
            <td width="80" align="right">部　门：</td>
            <td width="150" align="left">
            </td>
          </tr>
          <tr>
            <td width="119" align="right">固　话：</td>
            <td width="149" align="left">
            	<s:textfield id="phone" name="model.phone"/>
            </td>
            <td width="80" align="right">手　机：</td>
            <td width="150" align="left">
            	<s:textfield id="mobile" name="model.mobile" cssStyle="width:115px"/>
            </td>
          </tr>
          <tr>
            <td width="119" align="right">诚信等级：</td>
            <td width="149" align="left">
            	<s:select id="integrityGrade" name="model.integrityGrade" list="{'A','B','C','D'}" headerKey="" headerValue="诚信等级..."/>
            </td>
            <td width="80" align="right">邮　编：</td>
            <td width="150" align="left">
            	<s:textfield id="zip" name="model.zip" cssStyle="width:115px"/>
            </td>
          </tr>
          <tr>
            <td width="119" align="right">经营范围：</td>
            <td align="left" colspan="3">
            	<s:textfield id="operateDetails" name="model.operateDetails" cssStyle="width:350px;"/>
            </td>
          </tr>
          <tr>
            <td width="119" align="right">备　　注：</td>
            <td align="left" colspan="3">
            	<s:textfield id="remark" name="model.remark" cssStyle="width:350px;"/>
            </td>
          </tr>
          <tr>
            <td width="119" align="right">公司简介：</td>
            <td align="left" colspan="3">
            	<s:textarea id="descn" name="model.descn" cssStyle="width:350px; height:70px"/>
            </td>
          </tr>
        </table></td>
		<td width="300" valign="top" style="border-left: 1px dotted #099EBD;">
			<table width="300" border="0" >
				<tr>
					<td id="photoOperSpan1">
					<img alt="照片" align="middle" width="300" height="225"	id="imgphoto"
						src="<c:if test='${not empty model.photoUrl}'>${ctx}${model.photoUrl}</c:if>
							 <c:if test='${empty model.photoUrl}'> ${ctx}/images/corp/com_nophoto_big.gif</c:if>" />
					</td>
				</tr>
				<tr>
		            <td align="center"  id="photoOperSpan2" style="border-top: 1px dotted #099EBD; padding-top: 10px">
			            <c:choose>
							<c:when test="${empty model.photoUrl}">
								<s:file id="photo" name="photo" cssClass="FileText"
									onchange="changeImg()"></s:file>
							</c:when>
							<c:otherwise>
								<input name="button" type="button"
									onClick="deletePhoto(${model.id})" value="删除照片" />
							</c:otherwise>
						</c:choose>
		            </td>
		        </tr>
			</table>
		</td>
	  </tr>
	</table>
	<div class="x-toolbar" style="padding: 6px 0px 3px 0px; color:#15428B">
	诚信记录
	</div>
	<table width="100%" align="center">
		<tr>
			<td align="left" width="100%">
				<textarea id="integrityRecord" name="model.integrityRecord" cols="70" rows="8">${model.integrityRecord}</textarea>
			</td>
		</tr>
	</table>
	</fieldset>
	<table width="600px" style="margin-bottom: 10px;">
		<tr>
			<td style="text-align: center;">
				<s:submit value="保存" cssClass="button"/> 
				<s:reset value="重置" cssClass="button"/>
			</td>
		</tr>
	</table>
</s:form>
</div>
</div>
</body>
</html>