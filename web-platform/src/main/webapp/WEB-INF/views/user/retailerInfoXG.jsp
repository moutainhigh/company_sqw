<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
	<head>
	  <meta charset="UTF-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" >
	  <title>UNICORN-商户信息</title>
	  <%@include file="/WEB-INF/views/include/base.jsp"%>
	  <link rel="stylesheet" type="text/css" href="${path}/commons/css/jiben.css">
	  <link rel="stylesheet" type="text/css" href="${path}/commons/css/reset.css"> 
      <link rel="stylesheet" type="text/css" href="${path}/commons/css/keep.css">
      <script type="text/javascript" src="${path}/commons/js/user/validate.js"></script>
	  <script type="text/javascript" src="${path}/commons/js/user/jiben.js"></script>
<style type="text/css">
	     input:focus{
			border:1px solid #09F;
			outline-style:none;
		}
		.input_warning{
			float:left;
		    font-family:Arial,"宋体",Lucida,Verdana,Helvetica,sans-serif;
			font-size:12px;
			padding-top:4px;
			padding-left:24px;
		}
		.divfile{
		   display: none;
		}
		#thief_warning{
			height:12px;
		}
		#filespan {margin:0;}
		
	</style>
	<script type="text/javascript">

	  var subUpdate =function(){
		//if($('#textfield').val()!='') {	
		//}
		
		var fmdata = $("#vatInvoices").serialize();
		$("#vatInvoices").submit();
	 }
	  
	 $(function(){ 
		 //alert($('input:radio[name="name"]:checked').val());
	 });
	</script>
</head>
    <body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	 <div class="wrap">
		<%@include file="/WEB-INF/views/include/leftUser.jsp"%>
		<div class="right f_l">
			<div class="title">

				<p class="c1">基本信息</p>
				<div class="clear"></div>
			</div>
			<div class="blank5"></div>
			<div class="cont">
				<ul class="ul_vertical">
				<form id="vatInvoices"  method="post" action="${path}/user/updateXG" enctype="multipart/form-data" >
					<div class="item">
					<label>商户来源：</label>
					<div class="itemright">
						<span><input disabled="disabled" type="radio" name="type" value="1" <c:if test="${1==data.type }">checked</c:if>>PC</span>
						<span><input disabled="disabled" type="radio" name="type" value="0" <c:if test="${0==data.type }">checked</c:if>>PAD</span>
						
						<!-- 
						<span><input type="radio" name="type">WAP</span>
						<span><input type="radio" name="type">APP</span>
						 -->
					</div>
				</div>
				
				<div class="item">
					<label>用户类型：</label>
					<div class="itemright">
						<span><input disabled="disabled" type="radio" name="merchantType" value="1" <c:if test="${1==data.merchantType }">checked</c:if>>企业注册</span>
						<span><input disabled="disabled" type="radio" name="merchantType" value="2" <c:if test="${2==data.merchantType }">checked</c:if>>会员注册</span>
					</div>
				</div>

				<div class="item">
				<!-- 
					<p class="p1"><b style=" color: #FF0000;"><label>经营主体名称：</label></p><label>经营主体名称：</label>
				 -->
					<label>经营主体名称：</label>
					<div class="itemright">
						<input disabled="disabled" name="businessName"
						value="${fn:escapeXml(data.businessName)}"
						onblur="validateSingle(this, 'notnull')"
						 type="text" class="it">
					</div>
				</div>

				<div class="item">
					<label>营业执照注册号：</label>
					<div class="itemright">
						<input disabled="disabled" type="text"
						 name="businessLicense"
						 value="${fn:escapeXml(data.businessLicense)}"
						 onblur="validateSingle(this, 'notnull')"
						 class="it">
					</div>
				</div>
				
				<%--
					<div class="item">
					<label>商户编号：</label>
					<div class="itemright">
						<input type="text"
						 readonly="readonly"
						 name="retailerCode"
						 value="${fn:escapeXml(data.retailerCode)}"
						 onblur="validateSingle(this, 'notnull')"
						 class="it">
					</div>
				</div>
				 --%>
				<div class="item">
					<label>商户编号：</label>
					<div class="itemright">
						<input type="text"
						 disabled="disabled"
						 name="retailerCode"
						 value="${fn:escapeXml(data.retailerCode)}"
						 onblur="validateSingle(this, 'notnull')"
						 class="it">
					</div>
				</div>

				<div class="item">
					<label>商户名称：</label>
					<div class="itemright">
						<input type="text"
						disabled="disabled"
						 name="name"
						 value="${fn:escapeXml(data.name)}"
						 onblur="validateSingle(this, 'notnull')"
						 class="it">
					</div>
				</div>

				<div class="item">
					<label>商户地址：</label>
					<div class="itemright">
						<select class="si" disabled="disabled"><option>${provincename}</option></select>
						<select class="si" disabled="disabled"><option>${city}</option></select>
						<!-- 
						<select class="si"><option>裕华区</option></select>
						 -->
						<select disabled="disabled" class="si" name="areaId">
							<c:if test="${!empty data.areaId}">
								<c:forEach items="${counties}" var="agentCounty">
									<option <c:if test="${agentCounty.countyid ==
									data.areaId}">selected</c:if>
									value="${agentCounty.countyid}">${agentCounty.countyname}
									</option>
								</c:forEach>
							</c:if>	
						</select>
						
					</div>
				</div>
				
				<div class="item">
					<label></label>
					<div class="itemright">
						<input type="text"
						 disabled="disabled"
						 name="address"
						 value="${fn:escapeXml(data.address)}"
						 onblur="validateSingle(this, 'notnull')"
						 class="it">
					</div>
				</div>

				<div class="item">
					<label>经营者姓名：</label>
					<div class="itemright">
						<input type="text"
						disabled="disabled"
						 name="legalPerson"
						 value="${fn:escapeXml(data.legalPerson)}"
						 onblur="validateSingle(this, 'notnull')"
						 class="it">
					</div>
				</div>

				<div class="item">
					<label>经营者证件编号：</label>
					<div class="itemright">
						<input type="text"
						disabled="disabled"
						 name="legalPersonNo"
						 value="${fn:escapeXml(data.legalPersonNo)}"
						 onblur="validateSingle(this, 'notnull')"
						 class="it">
					</div>
				</div>
				<%--
				
				<div class="item">
					<label><i>*</i>身份证件号码：</label>
					<div class="itemright">
						<input type="text"
						readonly="readonly"
						 name="legalPersonNo"
						 value="${fn:escapeXml(data.legalPersonNo)}"
						 class="it">
					</div>
				</div>
				 --%>

				<div class="item">
					<label>手机：</label>
					<div class="itemright">
						<input type="text"
						disabled="disabled"
						 name="mobile"
						 value="${data.mobile}"
						 class="it">
					</div>
				</div>

				<div class="item">
					<label>邮箱：</label>
					<div class="itemright">
						<input type="text"
						 name="email"
						 disabled="disabled"
						 value="${fn:escapeXml(data.email)}"
						 class="it">
					</div>
				</div>
				
				<div class="item">
					<label>联系人电话/传真：</label>
					<div class="itemright">
						<input type="text"
						 name="fax"
						 disabled="disabled"
						 value="${fn:escapeXml(data.fax)}"
						 class="it">
					</div>
				</div>

				<div class="item">
					<label>开户银行：</label>
					<div class="itemright">
						<input type="text"
						 name="accountBank"
						 disabled="disabled"
						 value="${fn:escapeXml(data.accountBank)}"
						 class="it">
					</div>
				</div>

				<div class="item">
					<label>银行账号：</label>
					<div class="itemright">
						<input type="text"
						 name="accountNumber"
						 disabled="disabled"
						 value="${fn:escapeXml(data.accountNumber)}"
						 class="it">
					</div>
				</div>

				<div class="item" id="gszz">
					<label>工商执照：</label>
					<div class="itemright">
						<ul>
							<c:if test="${!empty dataFile.businessLicenseUrl  }">
								<a href="${path}/user/downloadFile?url=${dataFile.businessLicenseUrl}"><li><img src="${picUrl}${dataFile.businessLicenseUrl}" width="63px" height:"54px"></li></a>
							</c:if>
							<!-- 
							<li><img src="${path}/commons/images/keep.png" width="63px" height:"54px"></li>
							<li><img src="${path}/commons/images/keep.png" width="63px" height:"54px"></li>
							 -->
						</ul>
					</div>
				</div>
				<input  type="hidden"  name="source" value="2">
			    <input  type="hidden"  name="retailerId" value="${data.retailerId}">
			    <input  type="hidden"  name="fileId" value="${dataFile.fileId}">

				<div class="item">
					<label>具有一般纳税人资质：</label>
					<div class="itemright">
						<span><input disabled="disabled" type="radio" name="isTaxEffective" value="1"  <c:if test="${1==data.isTaxEffective }">checked</c:if> >是</span>
						<span><input disabled="disabled" type="radio" name="isTaxEffective" value="0"  <c:if test="${0==data.isTaxEffective }">checked</c:if>>否</span>
					</div>
				</div>

				
				<div class="item" id="ok">
					<label>一般纳税人资质：</label>
					<div class="itemright">
						<ul>
						<c:if test="${not empty dataFile.effectiveCertificateUrl }">
							<a href="${path}/user/downloadFile?url=${dataFile.effectiveCertificateUrl}"><img src="${picUrl}${dataFile.effectiveCertificateUrl}" width="63px" height:"54px"></a>
						</c:if>
						<!-- 
							<li><img src="${path}/commons/images/keep.png" width="63px" height:"54px"></li>
							<li><img src="${path}/commons/images/keep.png" width="63px" height:"54px"></li>
						 -->
						</ul>
					</div>
				</div>

				<div class="item">
					<label>销售员姓名：</label>
					<div class="itemright">
						<c:if test="${!empty allSale}">
							<select   id="xsname" class="sm" name="saleId">
								<option value="">请选择</option>
								<c:forEach items="${allSale}" var="sa">
											 <option <c:if test="${data.saleId == sa.saleId}">selected</c:if> 
											 value="${fn:escapeXml(sa.saleId)}">${fn:escapeXml(sa.saleName)}
											 </option>
								</c:forEach>
							</select>
						</c:if>
					</div>
				</div>

				<div class="item">
					<label>商户销售渠道：</label>
					<div class="itemright">
						<select class="sm" name="channelId" id="channelId">
							<option value="">请选择</option>
							<c:forEach items="${list }" var="sa">
								<option <c:if test="${data.channelId == sa.channelId }">selected</c:if>
								value="${fn:escapeXml(sa.channelId)}">${fn:escapeXml(sa.channelName)}					
								</option>
							</c:forEach>	
						</select>
					</div>
				</div>
				
				<!-- 
				channelId
				<div class="item">
					<label>用户状态：</label>
					<div class="itemright">
						<span><input type="radio" name="status" value="1">启用</span>
						<span><input type="radio" name="status" value="0">禁用</span>
					</div>
				</div>
				 -->
				
				</form>
				
				<form id="checkForm" >
					 <input type="hidden" id="isRecord" name="isRecord" value="1" class="text1">
			        <input type="hidden" id="id1" name="id1" class="text1">
			        <input type="hidden" id="status1" name="status1" value="${data.status}"   class="text1">
			        <input type="hidden" id="source1" name="source"  value="2" class="text1">
					<textarea hidden="hidden"  id="reason" rows=""  name="reason" cols=""></textarea>
				</form>
				 
				<div class="btn1">
				<!-- 
					<c:if test="${!empty buttonsMap['商户审核-添加发票']}">
					      <input style="color: #fff;background: #FF6752;" type="button"  onclick="subUpdate()" value="修改" ></input>	 
				    </c:if>
				    <a href="javascript:void(0)" onclick="subUpdate()">修改</a>
				    <a href="javascript:void(0)" onclick="">备案</a>
				 -->
					<a id="sh" href="javascript:void(0)" onclick="subUpdate()">修改</a>
					<a href="../user/checklist?source=2">返回</a>
				    <!-- 
				     -->
				</div>
				    
			</div>
			
		
		</div>
		<!-- 右边 end -->
	</div>
	<p class="blank30"></p>
		   
		</div>
		<div class="clear"/>
		<iframe name="downloadFileIframe" style="display:none"></iframe>
 </body>
<script type="text/javascript">


	function go(){
		 window.location.href = "../user/checklist?source=2";	
	}
	
	$(function(){
		var xsname = $("#xsname").val();
		var message='${message}'; 
		if(message=='ok'){
			alert("操作成功!");
		}
		if(message=='1'){
			alert("缺少参数,操作失败!");
		}
		if(message=='2'){
			alert("上传失败,请重新选择上传文件!"); 		
		}
		if(message=='3'){
			alert("上传文件到图片服务器出错,请稍后再试!"); 	
		}
		if(message=='4'){
			alert("服务器忙,请稍后再试!"); 	
		}
		$("#reason").keyup(function(){
			var len = $(this).val().length;
			if(len > 1000){
			$(this).val($(this).val().substring(0,500));
			alert("字数不能超过500字!");
			}
		});
		$("#reason").hide();
		/*
		执照和资质类型的判断
		if(0==$('input[name="isTaxEffective"]').val()){
			$("#ok").hide();
		}
		<c:if test="${empty dataFile.businessLicenseUrl  }">
			$("#gszz").hide();
		</c:if>
		*/
	});
	  
/* 	function checkFile(){
		  var filepath=$("#shangchuan").val(); 
          var extStart=filepath.lastIndexOf("."); 
          var ext=filepath.substring(extStart,filepath.length).toUpperCase(); 
          if(ext!=".JPG"&&ext!=".JPEG"&&ext!=".PNG"&&ext!=".DOCX"){ 
         // $("#fileshang").html("<font class='error_mes' >文件格式不正确！</font>");
           alert(); 
         $("#subject").focus();
            return false; 
	}; */
	
	
   	function valueToView2(id,isRecord){
  		if(status==2&&$("#reason").val()==''){
  			alert("请填写审核失败原因!");
  			return;
  		}else{
  			var xsname = $("#xsname").val();
  			var channelId = $("#channelId").val();
  			$("#xsname01").val(xsname);
			$("#channelId01").val(channelId);
			alert($("#channelId01").val());
  			$("#isRecord").val(isRecord);
			$("#id1").val(id);
		    //$("#status1").val(status);
			
   			var source = $("#source1").val();
			var fmdata = $("#checkForm").serialize();
			$.ajax({
		         type: "POST",
		         data: fmdata+"&"+Math.random(),
		         url: "../user/updateXG",
		         dataType:'json',
		         success: function (result) {
		        	 if(result == '1'){
		        		 tipMessage("修改成功!",function(){
		        	  		 window.location.href = "../user/checklist?source="+source;
		        		 });
		        	 }
		        	 if(result == '0'){
		        		alert("服务调用异常！");
		        	 }
		        	 if(result == '-1'){
			        		alert("用户信息异常！");
			         }
		          }
		 	   });
      	}
	}
</script>
</html>