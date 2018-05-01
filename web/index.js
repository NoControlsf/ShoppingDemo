/**
 * Created by Administrator on 2017/6/14.
 */
$(function() {

    start_new_item();
    start_hot_item();
    start_gm_item();
    start_qr_item();
    start_fx_item();
    start_xy_item();
    start_jf_item()

});

function start_new_item() {
    var basePath = $("#txtRootPath").val();
    //var sc = $("#start_fid").val();
    var content="";
    $.ajax({
        url:basePath + "/DrugSearch/drugbynew"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        /*,data: {
            solrkey: 'id',
            solrvalue: sc
        }*/
        ,success: function(data) {
            //遍历返回的JsonArray
            if(data != null){
                var temp = data;
                var count = 1;
                $.each(temp,function(index,temp){
                    if(count%5!=0) {
                        content += "<li class='detail-box'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }else {
                        content += "<li class='detail-box w-a'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }
                    count ++;
                });
                //动态将li 写入ul
                document.getElementById("new_items").innerHTML=content;
            }
        }
    });
}


function start_hot_item() {
    var basePath = $("#txtRootPath").val();
    //var sc = $("#start_fid").val();
    var content="";
    $.ajax({
        url:basePath + "/DrugSearch/drugbyhot"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        /*,data: {
         solrkey: 'id',
         solrvalue: sc
         }*/
        ,success: function(data) {
            //遍历返回的JsonArray
            if(data != null){
                var temp = data;
                $.each(temp,function(index,temp){
                        content += "<li class='detail-box'>" +
                            "<a class='' href='#' target='_blank'>" +
                            "<p class='b-q you'>" +
                            "<b class='pc-tps hot' title='热卖推荐'>&#xe673;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b><b class='pc-tps poverty' title='联盟专区'>&nbsp;</b></p>" +
                        "<div class='img-box'><img class='lazy' src='" + temp["drug_path"] + "' " +
                        " data-original='" + temp["drug_path"]  + "' alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3>" + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"

                });
                //动态将li 写入ul
                document.getElementById("hot_items").innerHTML=content;
            }
        }
    });
}

//风热感冒
function start_gm_item() {
    var basePath = $("#txtRootPath").val();
    //var sc = $("#start_fid").val();
    var content="";
    $.ajax({
        url:basePath + "/DrugSearch/drugbytype"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        ,data: {
         solrkey: 'drug_type_code',
         solrvalue: '4454'
         }
        ,success: function(data) {
            //遍历返回的JsonArray
            if(data != null){
                var temp = data;
                var count = 1;
                $.each(temp,function(index,temp){
                    if(count%5!=0) {
                        content += "<li class='detail-box'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }else {
                        content += "<li class='detail-box w-a'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }
                    count ++;
                });
                //动态将li 写入ul
                document.getElementById("gm_items").innerHTML=content;
            }
        }
    });
}



//清热祛火
function start_qr_item() {
    var basePath = $("#txtRootPath").val();
    //var sc = $("#start_fid").val();
    var content="";
    $.ajax({
        url:basePath + "/DrugSearch/drugbytype"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        ,data: {
            solrkey: 'drug_type_code',
            solrvalue: '4415'
        }
        ,success: function(data) {
            //遍历返回的JsonArray
            if(data != null){
                var temp = data;
                var count = 1;
                $.each(temp,function(index,temp){
                    if(count%5!=0) {
                        content += "<li class='detail-box'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }else {
                        content += "<li class='detail-box w-a'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }
                    count ++;
                });
                //动态将li 写入ul
                document.getElementById("qr_items").innerHTML=content;
            }
        }
    });
}


//腹痛腹泻
function start_fx_item() {
    var basePath = $("#txtRootPath").val();
    //var sc = $("#start_fid").val();
    var content="";
    $.ajax({
        url:basePath + "/DrugSearch/drugbytype"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        ,data: {
            solrkey: 'drug_type_code',
            solrvalue: '4419'
        }
        ,success: function(data) {
            //遍历返回的JsonArray
            if(data != null){
                var temp = data;
                var count = 1;
                $.each(temp,function(index,temp){
                    if(count%5!=0) {
                        content += "<li class='detail-box'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }else {
                        content += "<li class='detail-box w-a'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }
                    count ++;
                });
                //动态将li 写入ul
                document.getElementById("fx_items").innerHTML=content;
            }
        }
    });
}

//抗菌消炎
function start_xy_item() {
    var basePath = $("#txtRootPath").val();
    //var sc = $("#start_fid").val();
    var content="";
    $.ajax({
        url:basePath + "/DrugSearch/drugbytype"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        ,data: {
            solrkey: 'drug_type_code',
            solrvalue: '4426'
        }
        ,success: function(data) {
            //遍历返回的JsonArray
            if(data != null){
                var temp = data;
                var count = 1;
                $.each(temp,function(index,temp){
                    if(count%5!=0) {
                        content += "<li class='detail-box'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }else {
                        content += "<li class='detail-box w-a'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }
                    count ++;
                });
                //动态将li 写入ul
                document.getElementById("xy_items").innerHTML=content;
            }
        }
    });
}

//降脂减肥
function start_jf_item() {
    var basePath = $("#txtRootPath").val();
    //var sc = $("#start_fid").val();
    var content="";
    $.ajax({
        url:basePath + "/DrugSearch/drugbytype"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        ,data: {
            solrkey: 'drug_type_code',
            solrvalue: '6372'
        }
        ,success: function(data) {
            //遍历返回的JsonArray
            if(data != null){
                var temp = data;
                var count = 1;
                $.each(temp,function(index,temp){
                    if(count%5!=0) {
                        content += "<li class='detail-box'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }else {
                        content += "<li class='detail-box w-a'>" +
                            "<a href='#' target='_blank'>" +
                            "<p class='b-q'>" +
                            "<b class='pc-tps new' title='新品上架'>&#xe670;</b><b class='pc-tps free' title='包邮'>" +
                            "&#xe671;</b></p>" +
                            "<div class='img-box'><img " +
                            " src='" + temp["drug_path"] + "'" +
                            " alt=''></div>" +
                            "<div class='offer-detail'>" +
                            "<h3 title='" + temp["drug_item_name"] + "'> " + temp["drug_item_name"] + "</h3>" +
                            "<p>" + temp["drug_size"] + "</p>" +
                            "<p>" + temp["drug_productcompany"] + "</p>" +
                            "</div>" +
                            "</a>" +
                            "</li>"
                    }
                    count ++;
                });
                //动态将li 写入ul
                document.getElementById("jf_items").innerHTML=content;
            }
        }
    });
}