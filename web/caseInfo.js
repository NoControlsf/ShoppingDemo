/**
 * Created by NoControl on 2018/4/26.
 */
$(function () {
    start()
});

function start() {
    var basePath = $("#txtRootPath").val();
    var sc = $("#start_fid").val();
    $.ajax({
        url:basePath + "/EntSearchEngine/getEntInfo"
        ,method:"post"
        ,dataType: "JSON"
        //,contentType:"application/x-www-form-urlencoded"
        //参数
        ,data: {
            solrkey: 'id',
            solrvalue: sc
        }
        ,success: function(data) {
            //遍历返回的JsonArray
            console.log(data);
            if(data != null){
                var temp = data;
                $("#taxpayer_name").text(data['taxpayer_name']);
                $("#id").text(data['id']);
                $("#organization_code").text(data['organization_code']);
                $("#registered_address").text(data['registered_address']);
                $("#legal_representative").text(data['legal_representative']);
                $("#financial_officer").text(data['financial_officer']);
                $("#agency").text(data['agency']);
                $("#case_nature").text(data['case_nature']);
                $("#illegal_facts").text(data['illegal_facts']);
                $("#punishment_situation").text(data['punishment_situation']);
            }
        }
    });
}