function registCoupons() {
	var mobile = $("#mobile").val();
	var password = $("#password").val();
	var verificationCode = $("#verificationCode").val();//验证码
	var skuId = $("#skuId").val();//单品ID
	var number = $("#number").val();//数量
	var pid = $("#pid").val();//商品ID
	mobile = $.trim(mobile);
	password = $.trim(password);

	if (!checkUserNameAndPass(mobile, password)) {
		return;
	}
	if(!beforeSub(mobile)){
		return ;
	}
	if(isEmpty(verificationCode)){
		showErrorMsg("验证码不能为空");
		return ;
	}
	
	var len = password.length;
	if (len < 6 || len > 20) {
		showErrorMsg("请输入6-20个字母和数字组合的密码");
		return;
	}
	if(!(/^([a-z]+(?=[0-9])|[0-9]+(?=[a-z]))[a-z0-9]+$/ig).test(password) || password==mobile){
		okBT("请输入6-20位的数字和字母组合构成的密码");
		return ;	
	}
	
	var enResult = strEnc(password, mobile);
	var _dataType = "text";
	var _type = "POST";
	var _url = $("#path").val() + "/customerActivity/registZero";
	var _async = false;
	var _data = "mobile=" + mobile + "&password=" + enResult+ "&verificationCode=" + verificationCode + "&skuId=" + skuId + "&pid=" + pid;
	$("#coupons").val("正在努力前往");
	$("#coupons").attr("disabled", "disabled");
	$.ajax({
		dataType : _dataType,
		type : _type,
		url : _url,
		data : _data,
		async : _async,
		success : function(data) {
			switch (data) {
			// 登录成功
			case '200':
				location.href = $("#path").val() + "/cart/directBuy?skuId=" + skuId + "&number=" + number;
				break;
			// 用户名或密码不正确
			case '501':
				showErrorMsg("用户名或密码不正确");
				$("#coupons").val("注册登陆");
				$("#coupons").removeAttr("disabled");
				break;
			case '502':
				showErrorMsg("用户名或密码不正确");
				$("#coupons").val("注册登陆");
				$("#coupons").removeAttr("disabled");
				break;
			// 系统错误
			case '503':
				showErrorMsg("系统繁忙，请稍后重试");
				$("#coupons").val("注册登陆");
				$("#coupons").removeAttr("disabled");
				break;
			case '500':
				showErrorMsg("验证码错误");
				$("#coupons").val("注册登陆");
				$("#coupons").removeAttr("disabled");
				break;
			case '504':
				showErrorMsg("注册失败");
				$("#coupons").val("注册登陆");
				$("#coupons").removeAttr("disabled");
				break;
			case '505':
				showErrorMsg("用户已注册");
				$("#coupons").val("注册登陆");
				$("#coupons").removeAttr("disabled");
				break;
			case '506':
				location.href = $("#path").val() + "/customerActivity/message?skuId=" + skuId + "&number=" + number;
				break;
			case '507':
				location.href = $("#path").val() + "/customerActivity/skuMessage?skuId=" + skuId + "&number=" + number;
				break;
			// 登录成功
			default:
				location.href = data;
				break;
			}
		},
		error : function() {
			showErrorMsg("网络连接超时");
			$("#coupons").val("点击领取");
			$("#coupons").removeAttr("disabled");
		}
	});

}


/**
 * 获取验证码
 */
function getRegistCode(){
	var mobile = $("#mobile").val();
	if(!beforeSub(mobile)){
		return ;
	}
	var _dataType = "text";
	var _type = "POST";
	var _url = $("#path").val()+"/customer/getRegistCode";
	var _async = true;
	var _data = "mobile="+mobile;
	$.ajax({
		dataType : _dataType,
		type : _type,
		url : _url,
		data : _data,
		async : _async,
		success : function(res) {
			if (res == "success") {
				time = 60;
				$("#reGet").attr("disabled",true);
				window.setTimeout(callbackCode, 1000); 
			} else if (res == "mobileExist") {
				$.dialog({
			        content : '亲爱的老用户，此活动只针对新注册用户，老用户登录将按原价结算，建议您返回活动将此活动分享给您的朋友们，让他们来0元抢购吧！',
			        title : '众聚猫提示',
			        ok : function() {
			        	setTimeout(function(){
			    			window.location.href = "http://m.zhongjumall.com/act/0yuanqianggou.html";
			    		},500);
			        },
			        cancel : function() {
			        	setTimeout(function(){
			    			window.location.href = $("#path").val() + "/customer/toLogin";
			    		},500);
			        },
			        lock : false
			    });
				test();
				/*showErrorMsg("手机号已经注册");
				location.href = $("#path").val() + "/customer/toLogin";*/
			} else if (res == "repeatSend") {
				showErrorMsg("请不要重复发送");
			} else {
				showErrorMsg("发送失败，请稍后重试");
			}
		},
		error : function() {
			showErrorMsg("网络连接超时，请您稍后重试");
		}
	});

}

function callbackCode() {
	time = time - 1;
	$("#reGet").val("重新发送(" + time +"秒)" );
	if (time == 0) {
		$("#reGet").attr("disabled", null);
		$("#reGet").val("重新发送");
		return;
	}
	setTimeout(callbackCode, 1000);
}

function showErrorMsg(str) {
	//$(".error_tips").removeClass("hide");
	//$(".error_tips").html(str);
	$.dialog({
        content : str,
        title : '众聚猫提示',
        time: 1000,
	});
	return;
}


/**
 *  提交之前检验
 * @param mobile
 * @param code
 */
 function beforeSub(mobile,code){
	if ( isEmpty(mobile) ) {
		showErrorMsg("请输入您的手机号");
		return false;
	}
	//目前只验证手机号
	var res = verifyPhoneNumber(mobile);
	if(res != "ok"){
		showErrorMsg(res);
		return false;
	}else {
		$(".error_tips").addClass("hide");
		return true;
	}
}
 
 /**
  * //之前校验
  * 
  * @param mobile
  * @param password
  * @returns {Boolean}
  */
 function checkUserNameAndPass(mobile, password) {
 	
 	if (isEmpty(mobile)) {
 		showErrorMsg("用户名不能为空");
 		return false;
 	}
 	if (isEmpty(password)) {
 		showErrorMsg("请输入密码");
 		return false;
 	}
 	return true;

 }
 function test(){
	 var oDiva=document.querySelector('.rDialog-footer .rDialog-ok');
	 var oDivb=document.querySelector('.rDialog-footer .rDialog-cancel');
	 
	 oDivb.style.background='#FBA733';
	 oDivb.style.color='#fff';
	 oDiva.innerHTML='【返回活动】';
	 oDivb.innerHTML='【登录结算】';
 }

 