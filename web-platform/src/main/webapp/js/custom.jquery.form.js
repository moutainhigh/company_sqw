var pathName = window.location.pathname.substring(1); 
var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/')); 
var BaseUrl= window.location.protocol + '//' + window.location.host + '/'+ webName + '/'; 

/*
*jquery预读方法
*/
jQuery(document).ready(function(){
	loadingReady();
}); 
function loading(){
	var h = $("body").height() / 4;
	$("body").append('<div  id="load" style="width:98%;position:absolute;top:'+h+'px;text-align:center;"><img src="../images/loading2.gif" style="height: 50%;max-height: 100px;" /></div>');
}
function removeLoading(){
	$("#load").remove();
}
function loadingReady(){
	jQuery("body").ajaxSend(function(request,settings,uu){
		loading();
	});
	jQuery("body").ajaxComplete(function(request, settings){
		removeLoading();
	
	});
	jQuery("body").ajaxError(function(request, settings){
		removeLoading();
	});
}
/*
*form提交(post方式)
*
*formname form Name
*callbackfn 回调函数名(要求函数必须有参数且不能多与两个,一个参数时参数为响应文本,两个参数时第一个参数为响应文本)
*param 回调函数参数(如果为null,那么调用一个参数的回调函数,否则调用两个参数的回调函数)
*/
function jquerySubByFName(formName,callbackFn,param){
	var formObj = jQuery("form[@name=" + formName + "]");
	var options = {success: function(responseText) {
		if(param === null){
			callbackFn(responseText);
		}else{
			callbackFn(responseText,param);
		}
	}}; 
	formObj.ajaxSubmit(options); 
}
/*
*form提交(post方式)
*
*formId form Id
*callbackfn 回调函数名(要求函数必须有参数且不能多与两个,一个参数时参数为响应文本,两个参数时第一个参数为响应文本)
*param 回调函数参数(如果为null,那么调用一个参数的回调函数,否则调用两个参数的回调函数)
*async: false ,false表示同步提交，true表示异步提交
*/
function jquerySubByFId(formId,callbackFn,param,dataType,async){
	var formObj = jQuery("#" + formId);
	var options = {
			/*undefined和null是js5种原始数据类型的其中2个(jQuery是js的一个框架)*/
			async: ("undefined"!=async && null!=async)?async:true,  /*三元运算符*/
            dataType:  ("undefined"!=dataType && null!=dataType)?dataType:"json",
			success: function(responseText) {
				if(param === null){
					callbackFn(responseText);
				}else{
					callbackFn(responseText,param);
				}
			},
			//返回的数据不是json时,调用的函数
			error:function(){
				alert("数据加载失败");
			}
	};
	formObj.ajaxSubmit(options); 
}
