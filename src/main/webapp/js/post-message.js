$(function(){

    $("body").on("change","div.chuans input.uploadImg",function(){
        
        var reads = new FileReader();    
        var f = $(this).get(0).files[0];
        var rep = /jpeg|png|gif|bmp/ig;
        var gstyle = f.type.split("/")[1];
        if(rep.test(gstyle)){
            reads.readAsDataURL(f);
            var that = this;
            reads.onload = function(e) {
                $(that).parent().find("img").attr("src",this.result)
            };
        }else{
            layer.msg("图片格式不正确，请上传 jpeg|png|gif|bmp 格式的图片")
        }
        
    });
    
    $("body").on("mouseenter","div.chuans",function(){
        var odatasrc = $(this).find("img").data("imgsrc");
        var osrc =  $(this).find("img").attr("src");
    
        if(osrc.indexOf(odatasrc)==-1){
            $(this).find("span.delx").show();
        }
    });
    $("body").on("mouseleave","div.chuans",function(){
        $(this).find("span.delx").hide();
    });
    
    $("body").on("click","span.delx",function(){
        var odatasrc = $(this).parents(".chuans").find("img").data("imgsrc");
        var osrc =  $(this).parents(".chuans").find("img").attr("src");
        $(this).parents(".chuans").find("img").attr("src",odatasrc);
        $(this).hide();
        $(this).parents(".chuans").find("input").val("");
    });
    
    $("body").on("click","span.tibtn",function(){
        var odata = getchuancan();
        console.log(odata);
        if(jiancecanshu()){
            $.ajax({
                type:"post",
                url:otijiourl,
                data:odata,
                dataType: 'json', //返回值类型 一般设置为json
                // contentType: "application/x-www-form-urlencoded; charset=utf-8",
                processData: false,  // jQuery不要去处理发送的数据
                success:function(res){
                    console.log(res);
                },error:function(){
                    console.log("后台处理错误");
                }
            })
        }
    });

})
var code1;
var result1;
function uploadImage(obj) {
    var f = $(obj).val();
    if(f == null || f == undefined || f == '') {
        return false;
    }
    if (!/\.(?:png|jpg|PNG|JPG)$/.test(f)) {
        console.log("类型必须是图片(.png|jpg|PNG|JPG)");
        $(obj).val('');
        return false;
    }
    var data = new FormData();
    $.each($(obj)[0].files, function(i, file) {
        data.append('img', file);
    })
    $.ajax({
        type:"POST",
        url: "/upload/uploadImg",
        data: data,
        cache:false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(result) {
            if (result.flag == true) {
                var pictureUrl = $("#productPictureUrl").val();
                if (pictureUrl != null) {
                    pictureUrl = pictureUrl +result.resultStr;
                    $("#productPictureUrl").val(pictureUrl);
                } else {
                    $("#productPictureUrl").val(result.resultStr);
                }
                console.log("上传成功");
            } else {
                console.log(result.resultStr);
                $(obj).val('');
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("上传失败，请检查网络后重试");
        }
    })
}

function uploadVideo(obj) {
    var f = $(obj).val();
    if(f == null || f == undefined || f == '') {
        return false;
    }
    if (!/\.(?:mp4)$/.test(f)) {;
        $(obj).val('');
        return false;
    }
    var data = new FormData();
    $.each($(obj)[0].files, function(i, file) {
        data.append('video', file);
    })
    $.ajax({
        type:"POST",
        url: "/upload/uploadVideo",
        data: data,
        cache:false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(result) {
            if (result.flag == true) {
                $("#productVideoUrl").val(result.resultStr);
                console.log("上传成功");
            } else {
                console.log({message:result.resultStr});
                $(obj).val('');
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("上传失败，请检查网络后重试");
        }
    })
}

var code_time = 90;
function time_inter() {
    $('.code-btn').addClass('code-btn-gray');
    var timeflag = setInterval(function () {
        $('.code-btn-gray').html("" + code_time + "s后获取").css({
            "cursor": "no-",
            "color": "#999"
        });
        code_time--;
        if (code_time == 0) {
            clearInterval(timeflag);
            $('.code-btn-gray').html("获取验证码").css({
                "cursor": "pointer",
                "color": "#a07941"
            });
            $('.code-btn').removeClass('code-btn-gray');
        }
    }, 1000)

}
//获取验证码点击事件
$('.code-btn').on('click', function () {
    if ($(this).hasClass('code-btn-gray')) {
        return false;
    }
    var tel_num = $('#tel_num').val();
    if (tel_num && tel_num.length == 11) {
        time_inter();//按钮倒计时
        $.ajax({
            type:"POST",
            url: "/api/userMobileLogin?mobile="+tel_num,
            datatype:"JSON",
            success: function(result) {
                if(result){
                    var d = $.parseJSON(result);
                    code1=d.code;
                    result1=d.result;
                }
                else {

                }

            },
        })
    } else {
        phoneerr=document.getElementById("tip_phone");
        phoneerr.className="error1";
        phoneerr.innerText="请输入手机号";
    }
})

//    联系电话
function LXDHonblus(){
    var phone=document.getElementById("tel_num");
    var phoneerr=document.getElementById('tip_phone');
    var re =/^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
    if(phone.value==""){
        phoneerr.className="error1";
        phoneerr.innerText="请输入手机号";
    }
    else if(!re.test(phone.value)){
        console.log(phone);
        phoneerr.className="error2";
        phoneerr.innerText="电话格式输入错误";
    }
    else {
        phoneerr.className="success";
        phoneerr.innerText ="";
    }
}
function LXDHonfocu(){
    var phoneerr=document.getElementById('tip_phone');
    phoneerr.className="msg-box";
    phoneerr.innerText ="";
}

//验证码
function YZMonblus() {
    var code_num=document.getElementById("code_num");
    var code_numerr=document.getElementById("tip_code_num");
    if(code_num.value==code1 && result1){
        code_numerr.className="success";
    }
    else{
        code_numerr.className="error2";
        code_numerr.innerText="验证码不正确";
    }
}
function YZMonfou() {
    var code_numerr=document.getElementById("tip_code_num");
    code_numerr.className="msg-box";
    code_numerr.innerText="";
}