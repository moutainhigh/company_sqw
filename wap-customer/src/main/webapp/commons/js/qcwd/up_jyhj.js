$(function() {
    var delParent;
    var defaults = {
        fileType: ["jpg", "png", "bmp", "jpeg"],
        // 上传图片支持的格式
        fileSize: 1024 * 1024 * 10 // 上传的图片大小不得超过 10M
    };
    /*点击图片*/
    $(".file").change(function() {
        var idFile = $(this).attr("id");
        var file = document.getElementById(idFile);
        var imgContainer = $(this).parents(".aui-photo");
        //存放图片的父元素
        var fileList = photo(file);
        //获取的图片文件
        var input = $(this).parent();
        //文本框的父亲元素
        var imgArr = [];
        //遍历得到的图片
        var numUp = imgContainer.find(".aui-up-section").length;
        var ht = imgContainer.find(".lazy_img").length;
        var totalNum = numUp +1+ht;
        //图片总的数量可自定义
        if (totalNum > 6) {
            alert("你好！上传图片不得超过6张，请重新选择");
            //一次选择上传超过3个  自己定义
        } else if (numUp < 6) {
            for (var i = 0; i < 1; i++) {
                var imgUrl = window.URL.createObjectURL(fileList);
                imgArr.push(imgUrl);
                var $section = $("<section class='aui-up-section fl loading'>");
                imgContainer.prepend($section);
                var $span = $("<span class='aui-up-span'>");
                $span.appendTo($section);

                var $img0 = $("<img class='aui-close-up-img'>").on("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    $(".aui-works-mask").show();
                    delParent = $(this).parent();
                });
                $img0.attr("src", "../commons/img/clear.png").appendTo($section);
                
                var $img = $("<img class='aui-to-up-img aui-up-clarity' id='imgId' data-preview-src='' data-preview-group='2'>");
                
               // $img.attr("src", imgArr[i]);
                
                $img.appendTo($section);
                
                var $p = $("<p class='img-aui-img-name-p'>");
                
                $p.html(fileList.name).appendTo($section);
                
                var $input = $("<input id='actionId' name='actionId' value='' type='hidden'>");
                
                $input.appendTo($section);
                
                var $input2 = $("<input id='tags' name='tags' value='' type='hidden'/>");
                
                $input2.appendTo($section);
                

            }
        }
        setTimeout(function() {
            $(".aui-up-section").removeClass("loading");
            $(".aui-to-up-img").removeClass("aui-up-clarity");
        }, 1000);
        numUp = imgContainer.find(".aui-up-section").length;
        if (numUp >= 6) {
            $(this).parent().hide();
        }

        $(this).val("");
    });

    $(".aui-photo").delegate(".aui-close-up-img", "click", function() {
        $(".aui-works-mask").show();
        delParent = $(this).parent();
    });

    $(".aui-accept-ok").click(function() {
        $(".aui-works-mask").hide();
        var numUp = delParent.siblings().length;
        if (numUp < 6) {
            delParent.parent().find(".aui-file-up").show();
        }
//        $.ajax({
//        	type : "POST",
//			url : "/supplier/daletePhone",
//			data : ,
//			success : function() {
//				
//			}
//        })
        delParent.remove();

    });

    $(".aui-accept-no").click(function() {
        $(".aui-works-mask").hide();
    });

    function validateUp(files) {
        var arrFiles = [];
        //替换的文件数组
        for (var i = 0, file; file = files[i]; i++) {
            //获取图片上传的后缀名
            var newStr = file.name.split("").reverse().join("");
            if (newStr.split(".")[0] != null) {
                var type = newStr.split(".")[0].split("").reverse().join("");
                console.log(type + "===type===");
                if (jQuery.inArray(type, defaults.fileType) > -1) {
                    // 符合图片格式，可以上传
                    if (file.size >= defaults.fileSize) {
                        alert(file.size);
                        alert('您这个"' + file.name + '"文件大小过大');
                    } else {
                        arrFiles.push(file);
                    }
                } else {
                    alert('您这个"' + file.name + '"上传类型不符合');
                }
            } else {
                alert('您这个"' + file.name + '"没有类型, 无法识别');
            }
        }
        return arrFiles;
    }

})