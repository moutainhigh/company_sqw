// 提示错误信息
function showError(str) {
	$.dialog({
		content : str,
		title : '众聚猫提示',
		time : 1000
	});
}

$(function() {
//	$("#item-sm").on("click", function() {
//		$(this).addClass("active").add().siblings().removeClass("active");
//		$(".app-box").show();
//		$(".app-bx").hide();
//		$(".msg-text").text("众聚猫将在1-3天内为您上门取回商品");
//	});
//	$("#item-kd").on("click", function() {
//		$(this).addClass("active").add().siblings().removeClass("active");
//		$(".app-box").hide();
//		$(".app-bx").show();
//		$(".msg-text").text("商品返回地址将在服务单审核通过后，以短信的方式告知");
//	});
	var proId = $("#provinceId").val();
	var cityId = $("#cityId").val();
	var countyId = $("#countyId").val();
	getAllProvince(proId,cityId,countyId);
});

/**
 * 改变市区
 * 
 * @param area
 */
function changeArea(area) {
	if (area == 'city') {
		getAllProvince(null,null,null);
	}
	if (area == 'county') {
		getCity($("#province").val(),null,null);
	}
	if(area = "changeCounty"){
		var text = $("#county").find('option').not(function() {return !this.selected}).text();
		$("#countyName").text(text);
	}
}

/**
 * 获取所有省份的地址
 */
function getAllProvince(proId,cityId,countyId) {
	if(proId ==null){
		proId=$("#province").val();
	}
	var _dataType = "text";
	var _type = "POST";
	var _url = $("#path").val() + "/cusAddress/getProvince";
	var _async = true;
	var _contentType = 'application/x-www-form-urlencoded;charset=utf-8';
	$.ajax({
		dataType : _dataType,
		type : _type,
		url : _url,
		async : _async,
		contentType : _contentType,
		success : function(res) {
			if (res == null || res == "") {
				return false;
			}
			var pros = eval('(' + res + ')');
			for (var i = 0; i < pros.length; i++) {
				if (pros[i].provinceid == proId || pros[i].provinceid == $("#province").val()) {
					$("#provinceName").text(pros[i].provincename);
					$("#provinceId").val(pros[i].provinceid);
					getCity(proId,cityId,countyId);
				} 
					$("#province").append(
							'<option value="' + pros[i].provinceid + '"  >'
									+ pros[i].provincename + '</option> ');
				
			}
			if (proId==null || proId == '') {
				getCity($("#province").val(), null,null);
			}
			$("#city").empty();
			$("#county").empty();
		},
		error : function() {
			showError("网络连接超时，请您稍后重试");
		}
	});
}

/**
 * 获取城市细信息根据 省id
 * 
 * @param prId
 * @param cityId
 */
function getCity(proId,cityId,countyId) {
	var _dataType = "text";
	var _type = "POST";
	var _url = $("#path").val() + "/cusAddress/getCity";
	var _async = true;
	var _data = "proId=" + proId;
	var _contentType = 'application/x-www-form-urlencoded;charset=utf-8';
	$.ajax({
		dataType : _dataType,
		type : _type,
		url : _url,
		data : _data,
		async : _async,
		contentType : _contentType,
		success : function(res) {
			if (res == null || res == "") {
				return false;
			}
			var pros = eval('(' + res + ')');		
			if(cityId==null){
				cityId = $("#city").val();
			}
			$("#city").empty();
			for (var i = 0; i < pros.length; i++) {
				
					$("#city").append(
							'<option value="' + pros[i].cityid + '">'
									+ pros[i].cityname + '</option> ');
					if (pros[i].cityid == cityId ) {
						$("#cityName").text(pros[i].cityname);
						$("#cityId").val(pros[i].cityid);
						getCounty(cityId, countyId);
						$("#city").val(cityId);
					} 
			}         

			if (cityId == null || cityId == '') {
				$("#cityName").text(pros[0].cityname);
				getCounty($("#city").val(), null);
				$("#cityId").val(pros[0].cityid);
			}
		},
		error : function() {
			showError("网络连接超时，请您稍后重试");
		}
	});
}

/**
 * 获取县区 根据市id
 * 
 * @param cityId
 * @param counId
 */
function getCounty(cityId, countyId) {
	$("#county").empty();
	var _dataType = "text";
	var _type = "POST";
	var _url = $("#path").val() + "/cusAddress/getCountry";
	var _async = true;
	var _data = "ciId=" + cityId;
	$.ajax({
		dataType : _dataType,
		type : _type,
		url : _url,
		data : _data,
		async : _async,
		success : function(res) {
			if (res == null || res == "") {
				return false;
			}
			var pros = eval('(' + res + ')');
			for (var i = 0; i < pros.length; i++) {
				if (pros[i].countyid == countyId || pros[i].countyid == $("#county").val() ) {
					$("#countyName").text(pros[i].countyname);
					$("#countyId").val(pros[i].countyid);
				} 
					$("#county").append(
							'<option value="' + pros[i].countyid + '">'
									+ pros[i].countyname + '</option> ');
				

			}
			if (countyId == null || countyId == '') {
				$("#countyName").text(pros[0].countyname);
				$("#countyId").val(pros[0].countyid);
			}
		},
		error : function() {
			showError("网络连接超时，请您稍后重试");
		}
	});
}

function upload(){
	var _dataType = "text";
	var _type = "POST";
	var _url = $("#path").val() + "/cusAddress/getCountry";
	var _async = true;
	var _data = "picURL=" + $("#pageUpload").val();
	$.ajax({
		dataType : _dataType,
		type : _type,
		url : _url,
		data : _data,
		async : _async,
		success : function(res) {
			alert(res);
		},
		error : function() {
			showError("网络连接超时，请您稍后重试");
		}
	});
}

function onSubmitSecond(){
	if($("#address").val()==""){
		showError("请填写详细地址！");
		return false;
	}
	if($("#consignor").val()==""){
		showError("请填写联系人！");
		return false;
	}
	if($("#phone").val()==""){
		showError("请填写联系电话！");
		return false;
	}
	
	if(!checkPhone($("#phone").val())){
		showError("请填写正确的联系电话！");
		return false;
	}
	document.forms[0].submit();
}

/**
 * 检查手机号码和固定电话
 * 
 * @param phone
 * @returns {Boolean}
 */
function checkPhone(phone) {
	phone.replace(/－/g, "-");
	var regu = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^\d{11}$)/;
	var re = new RegExp(regu);
	if (!re.test(phone)) {
		return false;
	}
	return true;
}