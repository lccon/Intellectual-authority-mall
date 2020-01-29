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