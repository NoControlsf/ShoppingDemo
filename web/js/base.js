//回到顶部
function b() {
	h = $(window).height();
	t = $(document).scrollTop();
	if (t > h) {
		$('.backToTop-up').show();
	} else {
		$('.backToTop-up').hide();
	}
}
$(document).ready(function(e) {
	b();
	$('.backToTop-up').click(function() {
		//$(document).scrollTop(0); 直接返回顶部
		$('body,html').animate({
			scrollTop: 0
		}, 200); //延迟返回顶部
	})
});
$(window).scroll(function(e) {
	b();
})

//纵向导航
$(function(){
	$('.catalog').hover(function() {
		$(this).addClass('Hover');
	},function() {
		$(this).removeClass('Hover');
		$('.menu-cate-all-out dl').removeClass('on');
	})	
	$('.menu-cate-all-out dt').mouseover(function(){
		$('.menu-cate-all-out dl').removeClass('on');
		$(this).parent().addClass('on');
	})
});


//商品规格选择
$(function(){
    $(".sys_item_specpara").each(function(){
        var i=$(this);
        var p=i.find("ul>li");
        p.click(function(){
            if($(this).hasClass("disable")){
				return;              
            }else {
			 	$(this).addClass("on").siblings("li").removeClass("on");
			}
        })
    })
})

//固定导航
$(function(){
	var nav = $('.goods-menu'),
		doc = $(document),
		win = $(window);
	win.scroll(function() {
		if (doc.scrollTop() > 850) {
			nav.addClass('fixed');
		} 
		else {
			nav.removeClass('fixed');
		}
	});
	win.scroll();
});

$(window).scroll(function(){
	if($(window).scrollTop()>850){
		$('.goods-menu').addClass('fixed');
	}else{
		$('.goods-menu').removeClass('fixed');
	}
});

//小图切换大图
$(document).ready(function(){
    $(".jqzoom").imagezoom();
    
    $(".imageMenu li a").mousemove(function(){
        $(this).parents("li").addClass("sma").siblings().removeClass("sma");
        $(".jqzoom").attr('src',$(this).find("img").attr("mid"));
        $(".jqzoom").attr('rel',$(this).find("img").attr("big"));
    });

});

(function($){

    $.fn.imagezoom = function(options){

        var settings = {
            xzoom: 458,//宽度定义
            yzoom: 458,//高度定义
            offset: 10,
            position: "BTR",
            preload: 1
        };

        if(options) {
            $.extend(settings, options);
        }

        var noalt = '';

        var self = this;

        $(this).bind("mouseenter", function(ev){

            var imageLeft = $(this).offset().left;//元素左边距
            var imageTop = $(this).offset().top;//元素顶边距

            var imageWidth = $(this).get(0).offsetWidth;//图片宽度
            var imageHeight = $(this).get(0).offsetHeight;//图片高度

            var boxLeft = $(this).parent().offset().left;//父框左边距
            var boxTop = $(this).parent().offset().top;//父框顶边距
            var boxWidth = $(this).parent().width();//父框宽度
            var boxHeight = $(this).parent().height();//父框高度

            noalt= $(this).attr("alt");//图片标题
            var bigimage = $(this).attr("rel");//大图地址
            $(this).attr("alt",'');//清空图片alt


            if($("div.zoomDiv").get().length == 0){
                $(document.body).append("<div class='zoomDiv loading_big'><img class='bigimg' src='"+bigimage+"'/></div><div class='zoomMask'>&nbsp;</div>");//放大镜框及遮罩
            }


            if(settings.position == "BTR"){
                //如果超过了屏幕宽度 将放大镜放在右边
                if(boxLeft + boxWidth + settings.offset + settings.xzoom > screen.width){
                    leftpos = boxLeft  - settings.offset - settings.xzoom;
                }else{
                    leftpos = boxLeft + boxWidth + settings.offset;
                }
            }else{
                leftpos = imageLeft - settings.xzoom - settings.offset;
                if(leftpos < 0){
                    leftpos = imageLeft + imageWidth  + settings.offset;
                }
            }

            $("div.zoomDiv").css({ top: boxTop,left: leftpos });//大图定位的上边距离
            $("div.zoomDiv").width(settings.xzoom);
            $("div.zoomDiv").height(settings.yzoom);
            $("div.zoomDiv").show();

            $(this).css('cursor','crosshair');

            $(document.body).mousemove(function(e){

                mouse = new MouseEvent(e);
                if(mouse.x<imageLeft || mouse.x>imageLeft+imageWidth || mouse.y<imageTop || mouse.y>imageTop+imageHeight){
                    mouseOutImage();
                    return;
                }

                var bigwidth = $(".bigimg").get(0).offsetWidth;
                var bigheight = $(".bigimg").get(0).offsetHeight;

                var scaley ='x';
                var scalex ='y';


                //设置遮罩层尺寸
                if(isNaN(scalex)|isNaN(scaley)){
                    var scalex = (bigwidth/imageWidth);
                    var scaley = (bigheight/imageHeight);
                    $("div.zoomMask").width((settings.xzoom)/scalex);
                    $("div.zoomMask").height((settings.yzoom)/scaley);
                    $("div.zoomMask").css('visibility','visible');
                }

                xpos = mouse.x- $("div.zoomMask").width()/2 ;
                ypos = mouse.y- $("div.zoomMask").height()/2 ;
                
                xposs = mouse.x- $("div.zoomMask").width()/2 - imageLeft;
                yposs = mouse.y- $("div.zoomMask").height()/2 - imageTop ;
                
                xpos = (mouse.x - $("div.zoomMask").width()/2 < imageLeft ) ? imageLeft : (mouse.x + $("div.zoomMask").width()/2 > imageWidth + imageLeft ) ?  (imageWidth + imageLeft -$("div.zoomMask").width()): xpos;
                ypos = (mouse.y - $("div.zoomMask").height()/2 < imageTop ) ? imageTop : (mouse.y + $("div.zoomMask").height()/2 > imageHeight + imageTop ) ?  (imageHeight + imageTop - $("div.zoomMask").height()) : ypos;


                $("div.zoomMask").css({ top:ypos,left:xpos,});
                $("div.zoomDiv").get(0).scrollLeft = xposs * scalex;
                $("div.zoomDiv").get(0).scrollTop  = yposs * scaley;

            });

        });


        function mouseOutImage(){
            $(self).attr("alt",noalt);
            $(document.body).unbind("mousemove");
            $("div.zoomMask").remove();
            $("div.zoomDiv").remove();
        }

        //预加载
        count = 0;
        if(settings.preload){
            $('body').append("<div style='display:none;' class='jqPreload"+count+"'></div>");

            $(this).each(function(){

                var imagetopreload= $(this).attr("rel");

                var content = jQuery('div.jqPreload'+count+'').html();

                jQuery('div.jqPreload'+count+'').html(content+'<img src=\"'+imagetopreload+'\">');

            });

        }

    }

})(jQuery);

function MouseEvent(e) {
    this.x = e.pageX;
    this.y = e.pageY;
}

//替换指定对象里的指定值
var replace_obj_val = function(o,r,n){
    if(undefined == n)
    {
        n = '';
    }
    var n_val = o.val().replace(r,n);
    while(n_val.indexOf(r) > -1)
    {
        n_val = n_val.replace(r,n);
    }
    o.val(n_val);
};
//替换备注里的井号
var replace_remark_all_pound = function(){
    $('#remark').on('keyup',function(){
        replace_obj_val($(this),'#')
    });
    $('#remark').on('blur',function(){
        replace_obj_val($(this),'#')
    });
    $('#remark').attr('max-length',128);
}();