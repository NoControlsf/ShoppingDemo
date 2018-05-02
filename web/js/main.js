//滚动出现固定导航
(function(){
    $(window).scroll(function(){
        var scTop = $(window).scrollTop(),
            $scS = $('.scroll-search'),
            $frS = $('.fix-right-sub'),
            rW;
        rW = ($(window).width() - 1200)/2;

        scTop >= 200 ? $scS.slideDown(200) : $scS.slideUp(200);
        if(scTop >= 2700 && scTop < 4400){
            $frS.css({position: 'fixed', top: '0', right: rW, marginTop: ''});
        }
        else if(scTop >= 4400){
            $frS.css({position: '', marginTop: ''});
        }
        else{
            $frS.css({position: ''});
        }
    });
})(jQuery);

//回到顶部
function b(){
    h = $(window).height();
    t = $(document).scrollTop();
    if(t > h){
        $('.backToTop-up').show();
    }else{
        $('.backToTop-up').hide();
    }
}

$(document).ready(function(e) {
    b();
    $('.backToTop-up').click(function(){
        //$(document).scrollTop(0); 直接到达顶端
        $('body,html').animate({ scrollTop: 0 }, 200); //延迟到达顶端 
    })
});
$(window).scroll(function(e){
    b();
})

//同级li里面清除样式跟随
$(function(){
    $('.address-list li').each(function(index, element) {
        $(element).click(function(){
            $('li').removeClass('selected');
            $(element).addClass('selected');
            $('.address-list li').find('input').prop('checked', false);
            $(element).find('input').prop('checked', true);
        });
    });
});

$(function(){
    $('.top-left a').each(function(index, element) {
        $(element).click(function(){
            $('a').removeClass('yuyan');
            $(element).addClass('yuyan');
        });
    });
});

//帮助中心JS
$(function(){
    $('.sideBox li').each(function(index, element) {
        $(element).click(function(){
            $('li').removeClass('sideB');
            $(element).addClass('sideB');
        });
    });
});



//增加属性
$(function(){
    //勾选套餐
    $('.pop-compare').hide();
    $(".choose_group label input[type='checkbox']").click(function(){
        var $t=$(this).parent('label');
        var product_id=$t.attr('group_id');

        if($(this).prop('checked')){
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id: product_id, product_num: 1, product_type: 1},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html('');
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }
                }
            });
        }else{
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id: product_id, product_num: 1, product_type: 1, cancel_product: true},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html('');
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }
                }
            });
        }
        $('.pop-compare').show();
    })


    /**勾选单品**/
    $("a.Buy").click(function(){
        var $t=$(this);
        var product_id=$t.attr('goods_id');

        //区分代品和升级
        var is_coupons=$t.attr('is_coupons');
        if(is_coupons){
            var url = "/choose_package/click_show_coupons";
        }else {
            var url = "/choose_package/click_show";
        }

        //获取数量
        var product_num=parseInt($t.parent('.huangou').find('#goods_num').val());
        if(isNaN(product_num))
        {
            product_num = 1;
        }
        if($t.hasClass('selected')) {
            $(this).removeClass('selected');
            $.ajax({
                type: "POST",
                url: url,
                data: {product_id:product_id,product_num:product_num,product_type:2,cancel_product:true},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        } else {
            $(this).addClass('selected');
            $.ajax({
                type: "POST",
                url: url,
                data: {product_id:product_id,product_num:product_num,product_type:2},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }
        $('.pop-compare').show();
    })


    /**勾选代品券**/
    $(".coupons_selected input[type='checkbox']").click(function(){
        var $t=$(this).parent('label');
        var product_id=$t.attr('coupons_id');
        var product_num=parseInt($('#'+product_id).val());
        if($(this).attr("checked")){
            $(this).attr('checked',false);
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id: product_id, product_num: product_num, product_type: 3, cancel_product: true},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html('');
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }else{
            $(this).attr('checked',true);
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id: product_id, product_num: product_num, product_type: 3},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html('');
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }
        $('.pop-compare').show();
    })


    /***隐藏商品***/
    $('.Yinchang').click(function(){
        $('.pop-compare').hide();
    });
    
    
//    $('.go99top').click(function(){
//        var url = $(this).attr('url');
//        var scid = $.cookie('scid');
//        $.get(url + '/index/set_scid', {'scid' : scid}, function(){ }, 'jsonp');
//        window.open(url);
//    });
    
});

function to99top(topurl){
    var scid = $.cookie('scid');
    $.get(topurl + '/index/set_scid', {'scid' : scid}, function(){ }, 'jsonp');
}

$(".huangou_sl #goods_num").keyup(function() {
    var product_num=$(this).val();
    var t=$(this).parents('.huangou').find('a');
    var product_id=t.attr('goods_id');
    var pattern = /^[1-9]\d*$/;
    if (!pattern.test(product_num)) {
        $(this).val('');
    }
    if(t.hasClass('selected')){
        $.ajax({
            type: "POST",
            url: "/choose_package/click_show",
            data: {product_id:product_id,product_num:product_num,product_type:2},
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $('#buy_area').html(data.str);
                    $('#product_total_money').text(data.total_money);
                }
            }
        });

    }
})

$(".coupons_num").keyup(function() {
    var product_num=$(this).val();
    var t=$(this).parents('.col-md-2').find('.coupons_selected');
    var product_id=t.attr('coupons_id');
    var pattern = /^[1-9]\d*$/;
    var chb= t.find("#chb_coupons");
    if (!pattern.test(product_num)) {
        $(this).val('');
    }
    if(chb.attr("checked")){
        $.ajax({
            type: "POST",
            url: "/choose_package/click_show",
            data: {product_id:product_id,product_num:product_num,product_type:3},
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    $('#buy_area').html(data.str);
                    $('#product_total_money').text(data.total_money);
                }
            }
        });

    }
})

/***确认换购(换购)***/
function confirm_choose(){
    $.ajax({
        type: "POST",
        url: "/choose_goods/confirm_choose",
        data: {},
        dataType: "json",
        success: function (data) {
            if (data.success) {
                window.location.href=data.redirect_url;
            }else{
                layer.msg(data.msg);
                //setTimeout("$('#choose_package_msg').text('')", 3000);
            }
        }
    });
}

/***券选购商品***/
function confirm_choose_coupons(){
    $.ajax({
        type: "POST",
        url: "/choose_goods_for_coupons/confirm_choose_coupons",
        data: {},
        dataType: "json",
        success: function (data) {
            if (data.success) {
                window.location.href=data.redirect_url;
            }else{
                layer.msg(data.msg);
            }
        }
    });
}

/***确认换购(升级)***/
function confirm_choose_upgrade(){
    $.ajax({
        type: "POST",
        url: "/choose_goods_for_upgrade/confirm_choose",
        data: {},
        dataType: "json",
        success: function (data) {
            if (data.success) {
                window.location.href=data.redirect_url;
            }else{
                layer.msg(data.msg);
                //setTimeout("$('#choose_package_msg').text('')", 3000);
            }
        }
    });
}


//显示灰色 jQuery 遮罩层
function showBg() {
    var bh = $("body").height();
    var bw = $("body").width();
    $("#fullbg").css({
        height:bh,
        width:bw,
        display:"block"
    });
    $("#BOX_nav").show();
}
//关闭灰色 jQuery 遮罩
function closeBg(){
    $("#fullbg,#BOX_nav").hide();
    $('.jdcheckbox').prop('checked',true);
}

//关闭灰色 jQuery 遮罩
function closeAgreeBg(){
    $("#fullbg,#BOX_nav_agreement").hide();
}

//注册协议弹层
function showRegister($circle) {
    var type = arguments[1] ? arguments[1] : 'tps';
    var $circle_array=new Array('zh','english','hk','kr')
    if(in_array($circle,$circle_array)){
        $circle = $circle;
    }else{
        $circle = 'english';
    }
    if(type === 'zp'){
        $('.agree_content').load('/themes/mall/html/zp/agree_'+$circle+'.html?v=20180416');
    }else{
        $('.agree_content').load('/themes/mall/js/agree_'+$circle+'.html?v=20170516');
    }
    var bh = $("body").height();
    var bw = $("body").width();
    $("#fullbg").css({
        height:bh,
        width:bw,
        display:"block"
    });
    $("#BOX_nav").show();
}

//注册协议弹层
function showRegister2(path, circle) {
    var circle_array = new Array('zh','english','hk','kr')
    if(!in_array(circle,circle_array)){
        circle = 'english';
    }
    $('.agree_content').load('/themes/mall/file/reg_agree' + path + '/' + circle + '.html?v=20180416');
    
    var bh = $("body").height();
    var bw = $("body").width();
    $("#fullbg").css({
        height:bh,
        width:bw,
        display:"block"
    });
    $("#BOX_nav").show();
}


//注册协议弹层
function showBuyRegister($circle) {
    var $circle_array=new Array('zh','english','hk','kr','zp','js')
    if(in_array($circle,$circle_array)){
        $circle = $circle;
    }else{
        $circle = 'zh';
    }
    $('.agree_content').load('/themes/mall/js/agree_buy_'+$circle+'.html');

    var bh = $("body").height();
    var bw = $("body").width();
    console.dir(bh);
    console.dir(bw);
    $("#fullbg").css({
        height:bh,
        width:bw,
        display:"block"
    });
    $("#BOX_nav_agreement").show();
}

function get_goods_info(goods_id,goods_sn_main) {
    if(goods_id == '' || goods_sn_main == '') return;
    $.ajax({
        type: "POST",
        url: "/choose_goods_for_upgrade/get_goods_info",
        data: {goods_id:goods_id,goods_sn_main:goods_sn_main},
        dataType: "json",
        success: function (res) {
            if(res.success){

                $('.goods_desc').html(res.data.goods_desc);
                $('.goods_img').html(res.data.goods_img);

                var bh = $("body").height();
                var bw = $("body").width();
                $("#fullbg").css({
                    height:bh,
                    width:bw,
                    display:"block"
                });
                $("#BOX_nav").show();

            }else{
                layer.msg('Try Again!');
            }
        }
    });
}

$(function() {
	//清理所有锚点
	$('a').focus(function(){
		$(this).blur();
	});

	//主菜单
	$(".sidebar-info").slideToggle({
	  type:"menu", //效果类型
	  titCell:".mainCate", // 鼠标触发对象
	  targetCell:".subCate", // 效果对象，必须被titCell包含
	  delayTime:400, // 效果时间
	  triggerTime:150, //鼠标延迟触发时间
	  defaultPlay:false,//默认执行
	  returnDefault:true//返回默认
  	});
	
	//切换区域
	$('.change_location').click(function(){

		var $t=$(this),
		location_id = $t.attr('data-id'),
		//currency_id = $t.attr('data-cur'),
		//default_lang=$t.attr('data-lang'),
        goods_sn=$t.attr('data-goods-sn'),
        jump=$t.attr('data-jump'),
        goods_sn_main=$t.attr('data-goods-sn-main');
		$.ajax({
			type: "POST",
			url: "/common/changeLanguage",
			data: {location_id:location_id,jump:jump,goods_sn:goods_sn,goods_sn_main:goods_sn_main},
			dataType: "json",
			success: function (res) {
				if(res.success){
                    if(res.is_exist){
                        location.reload();
                    }else{
                        location.href = "/";
                    }
				}
			}
		});
	});

    //关闭区域提示
    $('.close_location').click(function() {
        $(".backdrop").css('display','none');
        $('.location').addClass('none');
    });
    $("body").click(function(){
        $(".backdrop").css('display','none');
        $(".location").addClass('none');
    });
        $(".g-jia").click(function(event){
            event.stopPropagation();
    });

	//切换语言
	var $dss=$(".currency_type");	
	$dss.click(function(){
		var $t=$(this),
		index=$t.index('.currency_type'),
		$def_cur=$('.js-li-currency').find('li').eq(index),
		icon=$def_cur.find('a').attr('data-v'),
		currency=$def_cur.find('a').attr('data-n'),
		currency_name=$def_cur.find('a').attr('data-name');
		
		if(icon == 'english') {
			currency_name=currency;
		}
		
		if(!$t.hasClass('blue')) {
			$.ajax({
				type: "POST",
				url: "/common/changeLanguage",
				data: {lan: $t.attr('data-v'),lan_name:$t.find('span').text(),lan_id:$t.attr('data-id'),icon:icon,currency:currency,currency_name:currency_name},
				dataType: "json",
				success: function (res) {
					if(res.success){
						location.reload();
					}
				}
			});
		}
	});

	//切换币种
	var $currency=$(".js-currency");	
	$currency.click(function(){
		var $t=$(this);
		if(!$t.hasClass('blue')) {
			$.ajax({
				type: "POST",
				url: "/common/changeCurrency",
				data: {icon: $t.attr('data-v'),currency:$t.attr('data-n'),currency_name:$t.find('span').text()},
				dataType: "json",
				success: function (res) {
					if(res.success){
						location.reload();
					}
				}
			});
		}
	});
	
	//切换收货地区
	$('.js-change-location a').click(function(){
		var $t=$(this);
		$.ajax({
			type: "POST",
			url: "/common/change_ship_location",
			data: {location_code: $.trim($t.attr('data-code')),location:$.trim($t.text())},
			dataType: "json",
			success: function (res) {
				if(res.success){
					location.reload();
				}
			}
		});
	});	
	$('.js-select-country').click(function(){
		var $js_sel=$('.js-location');
		$.ajax({
			type: "POST",
			url: "/common/change_ship_location",
			data: {location_code: $.trim($js_sel.val()),location:$.trim($js_sel.find('option:selected').text())},
			dataType: "json",
			success: function (res) {
				if(res.success){
					location.reload();
				}
			}
		});
	});
	
	//发货至
	$('.js_location').text($('.js-change-location').find('.sel').text());

});

function in_array(search, array) {
	for(var i in array) {
		if (array[i] == search) {
			return true;
		}
	}
	return false;
}

/***根据ID删除某件商品(套装)**/
function del_group(id){
    $('.choose_group label').each(function(){
        var group_id=$(this).attr('group_id');
        if(group_id==id){
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id:group_id,product_num:1,product_type:1,cancel_product:true},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }
                }
            });
            $(this).find("#sel_group").removeAttr('checked');
        }
    })
}

/***增加某件商品(套装)的数量**/
function increase_group(id){
    $('.choose_group label').each(function(){
        var group_id=$(this).attr('group_id');
        var num=$('#amount_'+group_id).val();
        num = parseInt(num)+1;
        if(group_id==id){
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id:group_id,product_num:num,product_type:1},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }
                }
            });
            //$(this).find("#sel_group").removeAttr('checked');
        }
    })
}

/***减少某件商品(套装)的数量**/
function decrease_group(id){
    $('.choose_group label').each(function(){
        var group_id=$(this).attr('group_id');
        var num=$('#amount_'+group_id).val();
        if(parseInt(num) <= 1){
            return;
        }
        num = parseInt(num) - 1;
        if(group_id==id){
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id:group_id,product_num:num,product_type:1},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }
                }
            });
            //$(this).find("#sel_group").removeAttr('checked');
        }
    })
}

/***增加某件商品的数量**/
function increase_goods(id){
    var goods_id=id;//$(this).attr('group_id');
    var num=$('#amount_goods_'+goods_id).val();
    num = parseInt(num)+1;
    $.ajax({
        type: "POST",
        url: "/choose_package/click_show",
        data: {product_id:goods_id,product_num:num,product_type:2},
        dataType: "json",
        success: function (data) {
            if (data.success) {
                $('#buy_area').html(data.str);
                $('#product_total_money').text(data.total_money);
            }
        }
    });
}

/***增加某件商品的数量**/
function increase_goods_c(id){
    var goods_id=id;//$(this).attr('group_id');
    var num=$('#amount_goods_'+goods_id).val();
    num = parseInt(num)+1;
    $.ajax({
        type: "POST",
        url: "/choose_package/click_show_coupons",
        data: {product_id:goods_id,product_num:num,product_type:2},
        dataType: "json",
        success: function (data) {
            if (data.success) {
                $('#buy_area').html(data.str);
                $('#product_total_money').text(data.total_money);
            }
        }
    });
}
/***减少某件商品的数量**/
function decrease_goods_c(id){
    var goods_id=id;
    var num=$('#amount_goods_'+goods_id).val();
    if(parseInt(num) <= 1){
        return;
    }
    num = parseInt(num) - 1;
    $.ajax({
        type: "POST",
        url: "/choose_package/click_show_coupons",
        data: {product_id:goods_id,product_num:num,product_type:2},
        dataType: "json",
        success: function (data) {
            if (data.success) {
                $('#buy_area').html(data.str);
                $('#product_total_money').text(data.total_money);
            }
        }
    });
}

/***减少某件商品的数量**/
function decrease_goods(id){
    var goods_id=id;
    var num=$('#amount_goods_'+goods_id).val();
    if(parseInt(num) <= 1){
        return;
    }
    num = parseInt(num) - 1;
    $.ajax({
        type: "POST",
        url: "/choose_package/click_show",
        data: {product_id:goods_id,product_num:num,product_type:2},
        dataType: "json",
        success: function (data) {
            if (data.success) {
                $('#buy_area').html(data.str);
                $('#product_total_money').text(data.total_money);
            }
        }
    });
}

/***根据ID删除某件商品(单品)**/
function del_goods(id){
    $('.huangou a').each(function(){
        var goods_id=$(this).attr('goods_id');
        if(goods_id==id){
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id:goods_id,product_num:1,product_type:2,cancel_product:true},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }
                }
            });
            $(this).removeClass('selected');
        }
    })
}

/***根据ID删除某件商品(代品券)**/
function del_coupons(id){
    $('.goux label').each(function(){
        var coupons_id=$(this).attr('coupons_id');
        if(coupons_id==id){
            $.ajax({
                type: "POST",
                url: "/choose_package/click_show",
                data: {product_id:coupons_id,product_num:1,product_type:3,cancel_product:true},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $('#buy_area').html(data.str);
                        $('#product_total_money').text(data.total_money);
                    }
                }
            });
            $(this).find("#chb_coupons").removeAttr('checked');
        }
    })
}
