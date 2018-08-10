<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<%@include file="/WEB-INF/views/commons/base.jsp" %>
<script type="text/javascript" src="${staticFile_s}/commons/js/zepto.min.js"></script>
<script type="text/javascript" src="${staticFile_s}/commons/js/main.js"></script>
<script type="text/javascript" src="${staticFile_s}/commons/js/user/common.js"></script>
<link href="${staticFile_s}/commons/css/order.css" rel="stylesheet" type="text/css">
<link href="${staticFile_s}/commons/css/zepto.alert.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${staticFile_s}/commons/js/jqueryAlert/zepto.alert.js"></script>
</head>
<title><spring:message code="title_pay_result" /></title>
<%@include file="/WEB-INF/views/commons/baidu_tongji.jsp" %>
<body>
<%-- hidden域 --%>
<input type="hidden" id="path" value="<%=path %>"/>
<input type="hidden" id="basePath" value="<%=basePath %>"/>
<div class="header">
	<a href="javascript:goBack();" class="bug-go"></a>
	<!-- 
	<a href="<%=basePath %>" class="home-go"></a>
	 -->
	 <c:choose>
	 	<c:when test="${back.msgCode == 'SUCCESS'}">
	 		<c:choose>
	 			<c:when test="${payType eq 13}">订单支付发送完成</c:when>
	 			<c:when test="${payType ne 13}">订单支付完成</c:when>
	 		</c:choose>
	 	</c:when>
	 	<c:when test="${back.msgCode != 'SUCCESS'}">订单支付失败</c:when>
	 </c:choose>
</div>
<c:if test="${back.msgCode == 'SUCCESS' }">
	<ul class="wrap-li">
		<li>订单编号：${ back.orderOrPayId }</li>
		<li>订单时间：<fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd HH:mm:ss" /></li>
		<li>订单金额： <fmt:formatNumber value='${fn:escapeXml(orderDto.price)}' pattern='#0.00'/>
			<c:if test="${back.payModel == 33 }"><fmt:formatNumber value='${fn:escapeXml(back.payAmount)}' pattern='#0.00'/></c:if>
		</li>
	</ul>
</c:if>
<div class="wrap">
    <div class="null">
		<c:if test="${ back.msgCode != 'SUCCESS' }">
			<c:if test="${ back.msgCode == 'FA' }">
				<div class="null-icon pay-error-icon"></div>
		 		<p class="null-text">红旗券余额不足</p>	
			</c:if>
			<c:if test="${ back.msgCode != 'FA' }">
			    <div class="null-icon pay-error-icon"></div>
		 		<p class="null-text">支付异常，请联系客服</p>				
			</c:if>	
		</c:if>
		<!-- android返回 -->
       	<c:if test="${userId != null and orderId !=null }">
      	 <!-- <a href="javaScript:void(0)" onclick="toOrderList()" class="goHome-btn">去订单中心</a>
      	 <a href="javaScript:void(0)" onclick="toHome()" class="goHome-btn">继续购物</a> -->
      	 <a href="<%=basePath %>cusOrder/toMyAllOrder?pageNow=1&status=" class="goHome-btn">去订单中心</a>
      	 <a href="<%=basePath %>"  class="goHome-btn">继续购物</a>
      	 <script type="text/javascript">
      	 	var androidMsg="{userId:'${userId}',orderId:'${orderId}',msgCode:'${msgCode}'}";
			function toHome() {
      	 		window.ccigmall_b2c.toHomePage(androidMsg);
      	 	}
			
      	 	function toOrderList() {
      	 		window.ccigmall_b2c.toOrderList(androidMsg);
      	 	}
      	 </script>
		 </c:if>
		<c:if test="${userId == null and orderId == null}">
			<!-- 支付失败 -->
			<c:if test="${ back.msgCode != 'SUCCESS' }">
				<c:if test="${ empty activity }">
					<a href="<%=basePath %>cusOrder/toMyAllOrder?pageNow=1&status=" class="goHome-btn">去订单中心</a>
					<a href="<%=basePath %>" class="goHome-btn">继续购物</a>
				</c:if>
				<c:if test="${ !empty activity }">
					<a href="<%=basePath %>cusOrder/toMyAllOrder?pageNow=1&status=" class="goHome-btn">去订单中心</a>
					<a href="<%=basePath %>${ activity }" class="goHome-btn">返回活动</a>
					<a href="<%=basePath %>${ activityNew }" class="goHome-btn">返回活动</a>
				</c:if>
			</c:if>
			<!-- 支付成功 -->
			<c:if test="${ back.msgCode == 'SUCCESS' }">
				<c:if test="${ empty activity }">
					<a href="<%=basePath %>cusOrder/toMyAllOrder?pageNow=1&status=" class="goHome-btn">去订单中心</a>
					<a href="<%=basePath %>" class="goHome-btn">继续购物</a>
				</c:if>
				<c:if test="${ !empty activity }">
					<a href="<%=basePath %>${ activityNew }" class="goHome-btn">返回活动</a>
					<a href="<%=basePath %>${ activity }" class="goHome-btn">返回活动</a>
					<a href="<%=basePath %>" class="goHome-btn">继续购物</a>
				</c:if>
			</c:if>
		</c:if>
       </div>
</div>
<script src="${staticFile_s}/commons/js/main.js" type="text/javascript"></script>
<script type="text/javascript">
//统计埋码
var _trackDataType = 'wap'; //标记数据来源，参数是web和wap，可以为空，默认是web
var _Schannel_website_id = '10000006';//分站编号，不存在可不写此变量或者留空
var _trackData = _trackData || [];//必须为全局变量，假如之前并没有声明，请加此行代码；
	var test = "${back.msgCode}";
	var orderId = "${back.orderOrPayId}";
	if(test=="SUCCESS"){
		_trackData.push(['addordercomplate', orderId+""]);
	}else{
		_trackData.push(['delorderpay', orderId+""]);
	}
	
</script>
</body>
</html>