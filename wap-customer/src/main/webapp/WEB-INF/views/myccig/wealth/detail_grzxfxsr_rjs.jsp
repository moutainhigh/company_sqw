<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<%@include file="/WEB-INF/views/commons/base.jsp" %>
<%-- zepto alert --%>
<title>${title }</title>
<link rel="stylesheet" type="text/css" href="${staticFile_s}/commons/css/grzxcss/aui.css" />
<link rel="stylesheet" type="text/css" href="${staticFile_s}/commons/css/grzxcss/index.css" />
<link rel="stylesheet" type="text/css" href="${staticFile_s}/commons/css/grzxcss/grzx_djq_css.css" />
    <link rel="stylesheet" type="text/css" href="${staticFile_s}/commons/css/grzxcss/fxsr.css" />
<%@include file="/WEB-INF/views/commons/baidu_tongji.jsp" %>
</head>
<style>
body{font-family:"微软雅黑";}		
a{color:#fff}
.yexs{position:fixed;width:100%;margin:0 auto}

.aui-card-list-header {
    color: #AFAFAF;
    font-size: 0.7rem;
    width: 100%;
}
.aui-info-item {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    
    font-size: 0.6rem;
}
.list-wrapper {
    position: fixed;
    z-index: 1;
    top:6.5rem;
    bottom: 0px;
    left: 0;
    width: 100%;
    background: #f9f9f9;
    overflow: hidden;
    border-top: 1px solid #eaeaea;
}
.fxedd {
    font-size: 0.2rem;
    color: #464444;
    background: #ff0000;
    border-radius: 10px;
    line-height: 1rem;
    float: left;
    margin: 0;
    padding: 0.2rem 0.5rem;
    position: fixed;
    top: 5.5rem;
    right: 1rem;
}
.fxedd a{color:#fff}
.aui-card-list {
    position: relative;
    margin: 0;
    padding: 1rem 0;
    border-bottom: 1px solid #e4e4e4;
    background: #ffffff;
    width: 100%;
}
.aui-card-list {
    position: relative;
    margin: 0;
    padding: 0.2rem 0;
    border-bottom: 1px solid #f1f1f1;
    background: #ffffff;
    width: 100%;
}
.jyjl{width: 100%;     text-align: center;   background: #f9f9f9;padding: 0.5rem 0;    font-family: 微软雅黑;border-top: 1px solid #f1f1f1;position: relative;
    top: 2rem;}
.jyjl_xx{line-height: 1.6rem;font-weight: 500;font-size: 0.8rem;}
.jyjl_rjs{float: right;width: 27%;color: #757575;    padding-bottom: 1rem;     padding-top: 1.5rem;   padding-right: 0.5rem;  font-size: 0.7rem;   text-align: right;}
.djqye {color: red;font-size: 1.4rem;text-align: center; margin: 0; padding: 3rem; padding-bottom: 1rem; background: #fff;}
.list-item{margin-bottom:0.3rem}
.jyxq_n{    font-size: 0.7rem;
    color: #565656;
    width: 92%;
    margin: 0 4%;
    margin-top: 2%;
    border-top: 1px solid #eaeaea;
    line-height: 2rem;}
.text{
  border: none;
    background-color: transparent;
    border-radius: 0;
    box-shadow: none;
    display: inline;
    padding: 0;
    width:40%;
    text-align: center;
    margin: 0;
    height: 2.2rem;
    line-height: normal;
    color: #424242;
    font-size: 0.8rem;
    font-family: inherit;
    box-sizing: border-box;
    -webkit-user-select: text;
    user-select: text;
    -webkit-appearance: none;
    appearance: none;
    margin-top:1rem;
 }
  .aui-list-item-arrow:before {
    content: '';
    width: 0.4rem;
    height: 0.4rem;
    position: absolute;
    top: 87%;
    right: 0.75rem;
    margin-top: -0.2rem;
    background: transparent;
    border: 1px solid #dddddd;
    border-top: none;
    border-right: none;
    z-index: 2;
    -webkit-border-radius: 0;
    border-radius: 0;
    -webkit-transform: rotate(-135deg);
    transform: rotate(-135deg);
}
</style>
<body>
<%-- hidden域 --%>

<input type="hidden" id="path" value="<%=path %>"/>
<input type="hidden" id="basePath" value="<%=basePath %>"/>	
<input type="hidden" id="page" value="${pageBean.page}"/>	
<input type="hidden" id="totalPage" value="${pageBean.totalPage}"/>	
<input type="hidden" id="account" value="${account}"/>
<input type="hidden" id="today" value="${today}"/>
<header class="aui-bar aui-bar-nav">
        <a class="aui-pull-left aui-btn" href="${path }/wealth/detail_grzxfxsr">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">${title }</div>
</header>
<div class="yexs">
<div class="jyjl">
		<h4 class="jyjl_xx">
		<p><input type="date" class="text" name="birth" id="birth" value="${today}" placeholder="请选择年月日" style="padding-top: 0.5rem;
    padding-left: 1rem;"/><i class="aui-iconfont aui-icon-down" style="    position: absolute;    top:0.8rem;    right: 5.5rem;"></i></p>
		<p style="position: relative;   top: -0.3rem;">金额:￥${balanceSumByUserAndDay }</p>
		</h4>
</div>
</div>
<div class="list-wrapper list-wrapper-hook">
    <div>
      <!-- 顶部提示信息 
      <div class="top-tip">
        <span class="refresh-hook">下拉刷新</span>
      </div> 
      <!-- 列表 -->
      <ul class="list-content list-content-hook" id="thelist">
        <c:forEach items="${pageBean.result }" var="detail" varStatus="var">
        <li class="list-item">
          <div class="aui-card-list">
       		            <div class="aui-card-list-header">
			                 <div class="aui-info-item"><span class="aui-margin-l-0"><fmt:formatDate value="${detail.operatorTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span></div>
                             <div class="aui-info-item">订单号：${detail.refObjId}</div>
			            </div>
			            <div class="aui-card-list-content-padded">
							<%-- <b style="font-weight: 500;">${detail.recordTypeString}</b> --%>
							<b style="color: red;font-size: 0.9rem;font-weight: 500">
				                <c:if test="${detail.earning>0}">
				               	 	+<span>￥${detail.earning}</span>
				                </c:if>
				                <c:if test="${detail.expenditure>0}">
				               	 	-<span>￥${detail.expenditure}</span>
				                </c:if>
							</b>
							&nbsp;&nbsp;<b>余额：${detail.balance }</b>
			            </div>
			             <%-- <div class="aui-card-list-content-padded">
							<b  style="color:#B8B8B8;font-weight: 500;font-size: 0.6rem">用户ID：</b>
		                    <b style="margin-left: 0.5rem;font-weight:500">${detail.userId}</b>
		                    <b  style="color:#000;font-weight: 500;font-size: 0.6rem;float: right;">用户名称：${detail.name}</b>
			            </div> --%>
			            <div class="aui-card-list-content-padded">
			           		<b>备注:</b> <b style="color:#B8B8B8;font-weight: 500;padding-left: 0.5rem;font-size: 0.6rem">${detail.memo}</b>
			            </div>
			            <a href="${path }/wealth/detail_fxsrxq?recordId=${detail.id}"><div class="jyxq_n">交易详情<span style="float: right"><div class="aui-list-item-right"><div class="aui-list-item-inner aui-list-item-arrow"></div></div></span></div></a>
			</div>
        </li>
        </c:forEach>   
      </ul>
      <!-- 
        1、底部提示信息 
        2、这里有一种情况,就是没有更多数据时,这里的文本应该显示"暂无更多数据"
      -->	 
      <div class="bottom-tip">
        <span class="loading-hook">上拉加载更多</span>
      </div>
    </div>
  </div>
  <!-- content end  --> 
  <!-- alert -->
  <div class="alert alert-hook">刷新成功</div>
  </body>
</html>
  <!-- js -->
  <script src="${staticFile_s}/commons/js/bscroll.js"></script>
  <script src="${staticFile_s}/commons/js/index_grzxfxsr.js"></script>
  <script type="text/javascript" src="${staticFile_s}/commons/js/main.js"></script>
  <script type="text/javascript" src="${staticFile_s}/commons/js/jqueryAlert/zepto.alert.js"></script>
<script>
function dateFtt(fmt,date)   
{ //author: meizz   
  var o = {   
    "M+" : date.getMonth()+1,                 //月份   
    "d+" : date.getDate(),                    //日   
    "h+" : date.getHours(),                   //小时   
    "m+" : date.getMinutes(),                 //分   
    "s+" : date.getSeconds(),                 //秒   
    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
    "S"  : date.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} 

$("#birth").live("change", function() {
	var startTime = $("#birth").val();
	/* var mydate = new Date();
	var endTime = mydate.toLocaleDateString(); // 获取当前日期
	if (!checkEndTime(startTime, endTime)) {
		showErrorMsg("日期不能大于当前时间");
		return;
	}; */
	window.location ="${path }/wealth/detail_grzxfxsr_rjs?day="+startTime;
});
//比较日期
function checkEndTime(begin, over) {
var start = new Date(begin.replace("-", "/").replace("-", "/"));
var end = new Date(over.replace("-", "/").replace("-", "/"));
if (end < start) {
	return false;
} else {
	return true;
}

}
function showErrorMsg(str) {
	// $(".error_tips").removeClass("hide");
	// $(".error_tips").html("<font
	// color=red>&nbsp;&nbsp;&nbsp;"+str+"</font>");
	$.dialog({
		content : str,
		title : '众聚猫提示',
		time : 1000,
	});
	return;
}
</script>
</html>