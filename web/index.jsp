<%--
  Created by IntelliJ IDEA.
  User: NoControl
  Date: 2018/4/19
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>医务用品商城</title>
  <link rel="stylesheet" href="css/style.css?v=8">
  <link rel="stylesheet" href="css/base.css?v=8">
  <script src="js/jquery-1.11.0.min.js?v=8"></script>
  <script src="js/SuperSlide2.1.js?v=8"></script>
  <script src="js/layer.js?v=8"></script>
  <script src="js/md5.min.js?v=8"></script>
  <script src="js/fun.js?v=8"></script>
  <script charset="utf-8" type="text/javascript" language="javascript" src="index.js"></script>

  <script type="text/javascript">

      function generateUUID() {
          var d = new Date().getTime();
          var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
              var r = (d + Math.random() * 16) % 16 | 0;
              d = Math.floor(d / 16);
              return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
          });
          return uuid;
      }
      ;

      function SetCookie(name, value) {

          var curDate = new Date();

          //当前时间戳
          var curTamp = curDate.getTime();

          //当日凌晨的时间戳,减去一毫秒是为了防止后续得到的时间不会达到00:00:00的状态
          var curWeeHours = new Date(curDate.toLocaleDateString()).getTime() - 1;

          //当日已经过去的时间（毫秒）
          var passedTamp = curTamp - curWeeHours;

          //当日剩余时间
          var leftTamp = 24 * 60 * 60 * 1000 - passedTamp;
          var leftTime = new Date();
          leftTime.setTime(leftTamp + curTamp);
          document.cookie = name + "=" + escape(value) + ";expires=" + leftTime.toGMTString();
      }
      ;

      function getCookie(name) {
          var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
          if (arr = document.cookie.match(reg))
              return unescape(arr[2]);
          else
              return null;
      }

      if (getCookie('uid')) {
          var uid = getCookie('uid');
      } else {
          var uid = generateUUID();
          SetCookie('uid', uid)
      }

      var clintId = uid;
      var url = location.href; ////获取本页URL
      var fromurl = document.referrer; //获取本页来源URL
      var str_md5 = "";
      str_md5 += 'web';
      str_md5 += uid;
      str_md5 += url;
      str_md5 += fromurl;
      str_md5 += "TPS20170825#COM$PS";
      var sign = md5(str_md5);
      /*$(function(){
       //流量统计添加数据接口
       $.ajax({
       //提交数据的类型 POST GET
       type:"POST",
       //提交的网址
       //url:"http://10.1.1.234:9010/flow/addFlow.action",
       url:"/flow/addFlow.action",
       //提交的数据
       //data:{clientId:clintId,pageUrl:url,srcUrl:fromurl,channel:'web',sign:sign},
       data:JSON.stringify({clientId:clintId,pageUrl:url,srcUrl:fromurl,channel:'web',sign:sign}),

       //返回数据的格式
       datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
       contentType: "application/json;charset=utf-8",

       timeout:3000,
       cache:false,
       async:true,
       beforeSend:function(){
       // alert('请求之前');
       },
       //成功返回之后调用的函数
       success:function(data){
       if (data.result == 1){
       alert("数据保存成功！");
       }
       },
       //调用执行后调用的函数
       complete: function(XMLHttpRequest, textStatus){
       //alert(XMLHttpRequest.responseText);
       //alert(textStatus);
       //HideLoading();
       },
       //调用出错执行的函数
       error: function(){
       //请求出错处理
       // alert("数据保存失败！");
       }
       });
       })*/
      // eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('5 B(){3 d=7 8().f();3 w=\'11-Z-13-12-W\'.V(/[Y]/g,5(c){3 r=(d+v.X()*16)%16|0;d=v.19(d/16);a(c==\'x\'?r:(r&1c|1b)).15(16)});a w};5 q(9,A){3 l=7 8();3 m=l.f();3 t=7 8(l.17()).f()-1;3 C=m-t;3 y=L*s*s*G-C;3 p=7 8();p.M(y+m);k.u=9+"="+U(A)+";O="+p.Q()};5 h(9){3 e,z=7 1v("(^| )"+9+"=([^;]*)(;|$)");n(e=k.u.1w(z))a 1x(e[2]);D a 1F}n(h(\'4\')){3 4=h(\'4\');1A.1B(4)}D{3 4=B();q(\'4\',4)}3 E=4;3 b=1h.1i;3 i=k.1j;3 6="";6+=\'F\';6+=4;6+=b;6+=i;6+="1e";3 j=1k(6);$(5(){$.1q({1r:"1o",b:"1l://10.1.1.1m:1n/1g/1p.1f",o:{1d:E,1s:b,1D:i,1C:\'F\',j:j},1E:"1z",1y:1t,1u:P,N:T,R:5(){},S:5(o){n(o.H==1){I("K！")}},J:5(18,14){},1a:5(){}})})',62,104,'|||var|uid|function|str_md5|new|Date|name|return|url|||arr|getTime||getCookie|fromurl|sign|document|curDate|curTamp|if|data|leftTime|SetCookie||60|curWeeHours|cookie|Math|uuid||leftTamp|reg|value|generateUUID|passedTamp|else|clintId|web|1000|result|alert|complete|数据保存成功|24|setTime|async|expires|false|toGMTString|beforeSend|success|true|escape|replace|xxxxxxxxxxxx|random|xy|xxxx||xxxxxxxx|yxxx|4xxx|textStatus|toString||toLocaleDateString|XMLHttpRequest|floor|error|0x8|0x3|clientId|TPS20170804FFDSOD342DF|action|flow|location|href|referrer|md5|http|234|9010|POST|addFlow|ajax|type|pageUrl|3000|cache|RegExp|match|unescape|timeout|json|console|log|channel|srcUrl|datatype|null'.split('|'),0,{}))
  </script>

  <script>

      $(function () { //ie9.0以下提示升级ie
          if ($.browser && $.browser.msie && $.browser.version < 9.0) {
              $('.this-ts').show();
          }
      });

      //百度统计
      window.onload = function () {
          var _hmt = _hmt || [];
          (function () {
              var hm = document.createElement("script");
              hm.src = "js/baidu_statistics.js?v=6.7";
              var s = document.getElementsByTagName("script")[0];
              s.parentNode.insertBefore(hm, s);
          })();
      }

      /*$(function () {
       $('#tog').click(function () {
       // $('.w-100').slideDown(260);
       }, function () {
       $('.w-100').slideUp(260);
       })
       });*/
  </script>
</head>

<body class="zh">

<%--系统根目录--%>
<input id="txtRootPath" type="hidden" value="<%=request.getContextPath()%>"/>

<!-- 顶部图片内容 -->
<!--<div class="w-100">
    <a href="/index/poverty" target="_blank">
        <s class="ggao"
           style=" background:url('https://img.tps138.com//Tpsmall/Ad/80197d600076a1e59a85cc1e80c35462_w1920_h80.jpg') no-repeat center"></s>
    </a>
    <span id="tog">×</span>
</div>-->


<div class="main-header">

  <!--main-header start-->
  <div class="header-bar">
    <div class="w1200">
      <!-- 币种和区域内容 -->
      <!--<ul class="fl nav-top">


                  <li class="fl w90" style="padding:0 25px 0 0">
                                                                                                                                                                                                                                                                          <a class="down" href="javascript:;">
                              <s class="qizhi-CNY"></s>中国<s class="minicart_arrow"></s>
                          </a>
                                                                                                                                              <ol class="xs li-b">
                                                          <li>
                              <a data-id="840" data-lang="english" data-cur="USD" data-goods-sn="" data-jump="" data-goods-sn-main="" class=" change_location" href="javascript:;">
                                  <s class="qizhi-USD"></s>U.S.A                                    </a>
                          </li>
                                                          <li>
                              <a data-id="410" data-lang="kr" data-cur="KRW" data-goods-sn="" data-jump="" data-goods-sn-main="" class=" change_location" href="javascript:;">
                                  <s class="qizhi-KRW"></s>한국                                    </a>
                          </li>
                                                          <li>
                              <a data-id="344" data-lang="hk" data-cur="HKD" data-goods-sn="" data-jump="" data-goods-sn-main="" class=" change_location" href="javascript:;">
                                  <s class="qizhi-HKD"></s>HK香港                                    </a>
                          </li>
                                                          <li>
                              <a data-id="156" data-lang="zh" data-cur="CNY" data-goods-sn="" data-jump="" data-goods-sn-main="" class="c-o change_location" href="javascript:;">
                                  <s class="qizhi-CNY"></s>中国                                    </a>
                          </li>
                                                          <li>
                              <a data-id="000" data-lang="english" data-cur="" data-goods-sn="" data-jump="" data-goods-sn-main="" class=" change_location" href="javascript:;">
                                  <s class="qizhi-"></s>Other                                    </a>
                          </li>
                                                      </ol>
                  </li>


                                  <li class="fl mfr-5">
                  <a class="down" href="javascript:;">
                      ¥人民币<s class="minicart_arrow"></s>
                  </a>
                  <ol class="xs li-b">
                                                  <li>
                          <a href="javascript:;" class="js-currency c-o" data-v="¥" data-n="CNY" data-name="人民币">
                              ¥&nbsp;
                              <span>
                                  人民币									</span>
                          </a>
                      </li>
                                                  <li>
                          <a href="javascript:;" class="js-currency " data-v="HK$" data-n="HKD" data-name="港币">
                              HK$&nbsp;
                              <span>
                                  港币									</span>
                          </a>
                      </li>
                                                  <li>
                          <a href="javascript:;" class="js-currency " data-v="₩" data-n="KRW" data-name="韩币">
                              ₩&nbsp;
                              <span>
                                  韩币									</span>
                          </a>
                      </li>
                                                  <li>
                          <a href="javascript:;" class="js-currency " data-v="$" data-n="USD" data-name="美元">
                              $&nbsp;
                              <span>
                                  美元									</span>
                          </a>
                      </li>
                                              </ol>
              </li>
                              </ul> -->

      <!-- 登录 注册 个人中心 等内容 -->
      <ul class="fr nav-top">

        <li class="fl mfr-5"><a class="c-o" href="#">登录</a></li>
        <li class="fl">|</li>
        <li class="fl mfr-5"><a class="c-o" href="#">注册</a></li>
        <li class="fl mfr-5"><a href="#"><i
                class="pc-tps"></i>我的关注(<span class="wish_num">0</span>)</a></li>
        <li class="fl w92 mfr-5">
          <a class="down" href="#">个人中心<s class="minicart_arrow"></s></a>
          <ol class="xs li-b">
            <li><a href="#">我的订单</a></li>
          </ol>
        </li>
        <!--  帮助中心  -->
        <li class="fl w92 ">
          <a class="down" href="#">帮助中心<s class="minicart_arrow"></s></a>
          <ol class="xs li-b">
            <li><a href="#">我的工单</a></li>
          </ol>
        </li>
      </ul>
    </div>
  </div>
  <!-- end main-header-->


  <!--site-header start-->
  <div class="site-header">
    <div class="w1200">

      <!-- 搜索框 左边的 图标和名字内容 -->
      <div class="logo fl">
        <a style="position:relative" href="#">
          <img class="scrollStyle" style="margin-top:-18px;" src="img/blogo.png"/>
        </a>
        <!--<dl class="huiy">
            <img class="scrollStyle2" style="margin-top:4px;" src="img/blogo2.png"/>
        </dl>-->
      </div>

      <!-- 搜索框 右边的 购物车 -->
      <div class="header-cart">
        <a class="down" href="#">
          <i class="pc-tps">&#xe64c;</i>
          <em>购物车</em>
          <b class="ci-count">0</b>
        </a>
        <!-- <p class="no">购物袋中还没有商品，赶快选购吧！</p> -->
      </div>

      <!-- 搜索框 -->
      <form action="#" method="get"
            onsubmit="if ($.trim($('#search_keywords').val()) == '') return false">
        <div class="search-box fr clear">
          <div class="tps-search">
            <input name="keywords" id="search_keywords" class="search-text" type="search"
                   placeholder="请输入关键词搜索商品" maxlength="200px">
            <button type="submit" target="_blank">
              <i class="pc-tps">&#xe647;</i>
            </button>
          </div>
        </div>
        <input type="hidden" name="token" value="dca5a932aef3c7b1e130aa9b476c4a84">
      </form>

    </div>
  </div>
  <!-- end site-header-->


  <!--nav-wp start-->
  <div class="nav-wp">
      <div class="w1200">
          <div class="catalog fl ">
              <h3><i class="pc-tps mr-10">&#xe600;</i>全部商品分类</h3>
              <div class="menu-cate-all-out">
              </div>
          </div>
          <ul class="menu-normal fl">
              <li>
                  <a href="#">
                      商城首页
                  </a>
              </li>
              <li>
                  <a href="#">
                      新品上市
                  </a>
              </li>
              <li>
                  <a href="#">
                      口碑热卖
                  </a>
              </li>
          </ul>
      </div>
  </div>
  <!--end nav-wp-->
</div>


<script>
    $(function () {
        var login_bbs_url = "";
        if (login_bbs_url.length > 0) {
            $.ajax({
                type: "get",
                url: login_bbs_url,
                xhrFields: {
                    withCredentials: true
                },
                crossDomain: true,
                dataType: "jsonp",
                jsonp: "jsoncallback",
                success: function (res) {

                }
            });
        }
    })
</script>


<script>
    $(function () {
        var logout_bbs_url = "";
        if (logout_bbs_url.length > 0) {
            $.ajax({
                type: "get",
                url: logout_bbs_url,
                xhrFields: {
                    withCredentials: true
                },
                crossDomain: true,
                dataType: "jsonp",
                jsonp: "jsoncallback",
                success: function (res) {

                }
            });
        }
    })
</script>
<script>
    $(function () {
        var timer = null;
        $('.j-appDownload').on('mouseover', function () {
            $('.showAppCode').fadeIn()
        });
        $('.j-appDownload').on('mouseout', function () {
            timer = setTimeout(function () {
                $('.showAppCode').fadeOut()
            }, 500)
        });
        $('.showAppCode').on('mouseover', function () {
            clearTimeout(timer);
        });
        $('.showAppCode').on('mouseout', function () {
            $('.showAppCode').fadeOut()
        })
    })
</script>

<div class="main-content">
  <!--banner start-->
  <div class="banner clear">
    <div class="bd">
      <ul>
        <li _src="url(img/Tpsmall/backg1.jpg)"
            style="background: #fdf5c7 no-repeat center;"><a target="_blank" href="#"></a></li>

        <li _src="url(img/Tpsmall/backg2.jpg)"
            style="background: #ffffff no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

        <li _src="url(img/Tpsmall/backg3.jpg)"
            style="background: #fdfdfd no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

        <li _src="url(img/Tpsmall/backg4.jpg)"
            style="background: #ffffff no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

        <li _src="url(img/Tpsmall/backg5.jpg)"
            style="background: #c4a482 no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

        <li _src="url(img/Tpsmall/backg6.jpg)"
            style="background: #ffffff no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

        <li _src="url(img/Tpsmall/backg7.jpg)"
            style="background: #000000 no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

        <li _src="url(img/Tpsmall/backg8.jpg)"
            style="background: #eae8ed no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

        <li _src="url(img/Tpsmall/backg9.jpg)"
            style="background: #151515 no-repeat center;"><a target="_blank"
                                                             href="#"></a></li>

        <li _src="url(img/Tpsmall/backg10.jpg)"
            style="background: #f2f2f2 no-repeat center;"><a target="_blank"
                                                             href="#"></a>
        </li>

      </ul>
    </div>
    <div class="hd">
      <ul></ul>
    </div>
    <span class="prev"><i class="pc-tps">&#xe63f;</i></span>
    <span class="next"><i class="pc-tps">&#xe648;</i></span>
  </div>
  <!--end banner-->

  <div class="w1200">

    <!--x-banner start-->
    <div class="x-banner clear">
    </div>
    <!--end x-banner-->


    <!--新品上架 start-->
    <div class="tps-line">
      <div class="tc mb-10">
        <b class="d-ib">新品上架</b>
        <em class="d-ib fs-18 mfr-10">/</em>
        <span class="d-ib c-99 fs-14">每天一点小期待</span>
        <a class="fs-14 c-66 fr" href="#">更多 ></a>
      </div>
      <div class="bd clear">
        <ul id="new_items">
        </ul>
      </div>
      <span class="prev"><i class="pc-tps">&#xe63f;</i></span>
      <span class="next"><i class="pc-tps">&#xe648;</i></span>
    </div>
    <!--end 新品上架-->


    <!--热门推荐 start-->
    <div class="tps-line">
      <div class="tc mb-10">
        <b class="d-ib">
          热卖推荐 </b>
        <em class="d-ib fs-18 mfr-10">/</em>
        <span class="d-ib c-99 fs-14">“网红”好货  怎能错过</span>
        <a class="fs-14 c-66 fr" href="#">更多></a>
      </div>
      <div class="titles clear">
        <ul id="hot_items">
        </ul>
      </div>
    </div>
    <!--end 热门推荐-->


    <!--特惠促销 start-->
    <!--end 特惠促销-->


    <!--首页楼层内容 start-->
    <div class="popular lazy">

      <!-- 楼层的名字（一级类目的名字）  start -->
      <div class="title-tps">
        <h2>风热感冒</h2>

        <!-- leon 添加更多商品跳转内容 -->
        <a class="more" href="#">更多 &gt;</a>
      </div>
      <!--end   楼层的名字（一级类目的名字） -->

      <div class="tab clear">

        <!-- 左侧的图片和楼层 -->
        <div class="l-side">
          <img src="img/mall/cate_1.jpg" alt="">    <!-- 楼层左侧上角的图片（暂时隐藏） -->
          <!-- 楼层中的 二级分类内容 菜单 -->
          <ul>
            <li title="片剂">
              <a href="#">片剂</a>
            </li>
            <li title="丸剂">
              <a href="#">丸剂</a>
            </li>
            <li title="胶囊">
              <a href="#">胶囊</a>
            </li>
            <li title="口服液">
              <a href="#">口服液</a>
            </li>
            <li title="冲剂">
              <a href="#">冲剂</a>
            </li>
            <li title="糖浆">
              <a href="#">糖浆</a>
            </li>
            <li title="吸入剂">
              <a href="#">吸入剂</a>
            </li>
          </ul>
          <!-- 楼层中的 二级分类内容 菜单 -->
        </div>

        <div class="activity">
          <ul class="bd">
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/gm_1.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/gm_2.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/gm_3.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/gm_4.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/gm_5.jpg"
                      alt=""></a>
            </li>
          </ul>
          <ul class="hd">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <span class="prev"><i class="pc-tps">&#xe63f;</i></span>
          <span class="next"><i class="pc-tps">&#xe648;</i></span>
        </div>


        <div class="activity brands">
          <!-- 楼层品牌 -->
          <ul class="bd">
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/1.jpg"
                    alt=""></a><a class="img"
                                  href="#"><img
                    src="img/drugimg/ad/2.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/3.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/4.jpg" alt=""></a>
            </li>
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/5.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/6.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/7.jpg" alt=""></a>
            </li>
          </ul>

          <!-- 品牌图标和热卖商品 切换界面的按钮 -->
          <ul class="hd">
            <li></li>
            <li></li>
          </ul>

        </div>


      </div>

      <!-- 楼层底部的商品 start -->
      <div class="list clear">
        <ul id="gm_items">
        </ul>
      </div>
      <!--end 楼层底部的商品 -->

    </div>
    <div class="popular lazy">

      <!-- 楼层的名字（一级类目的名字）  start -->
      <div class="title-tps">
        <h2>清热祛火</h2>
        <!-- leon 添加更多商品跳转内容 -->
        <a class="more" href="#">更多 &gt;</a>
      </div>
      <!--end   楼层的名字（一级类目的名字） -->

      <div class="tab clear">

        <!-- 左侧的图片和楼层 -->
        <div class="l-side">
          <img src="img/mall/cate_2.jpg" alt="">    <!-- 楼层左侧上角的图片（暂时隐藏） -->
          <!-- 楼层中的 二级分类内容 菜单 -->
          <ul>
            <li title="蜜丸">
              <a href="#">蜜丸</a>
            </li>
            <li title="片剂">
              <a href="#">片剂</a>
            </li>
            <li title="胶囊">
              <a href="#">胶囊</a>
            </li>
            <li title="颗粒剂">
              <a href="#">颗粒剂</a>
            </li>
            <li title="浓缩丸">
              <a href="#">浓缩丸</a>
            </li>
            <li title="口服液">
              <a href="#">口服液</a>
            </li>
          </ul>
          <!-- 楼层中的 二级分类内容 菜单 -->
        </div>

        <div class="activity">
          <ul class="bd">
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/qr_1.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/qr_2.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/qr_3.jpg"
                      alt=""></a>
            </li>
          </ul>
          <ul class="hd">
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <span class="prev"><i class="pc-tps">&#xe63f;</i></span>
          <span class="next"><i class="pc-tps">&#xe648;</i></span>
        </div>


        <div class="activity brands">
          <!-- 楼层品牌 -->
          <ul class="bd">
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/1.jpg"
                    alt=""></a><a class="img"
                                  href="#"><img
                    src="img/drugimg/ad/2.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/3.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/4.jpg" alt=""></a>
            </li>
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/5.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/6.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/7.jpg" alt=""></a>
            </li>
          </ul>

          <!-- 品牌图标和热卖商品 切换界面的按钮 -->
          <ul class="hd">
            <li></li>
            <li></li>
          </ul>

        </div>


      </div>

      <!-- 楼层底部的商品 start -->
      <div class="list clear">
        <ul id="qr_items">

        </ul>
      </div>
      <!--end 楼层底部的商品 -->

    </div>
    <div class="popular lazy">

      <!-- 楼层的名字（一级类目的名字）  start -->
      <div class="title-tps">
        <h2>腹痛腹泻</h2>
        <!-- leon 添加更多商品跳转内容 -->
        <a class="more" href="#">更多 &gt;</a>
      </div>
      <!--end   楼层的名字（一级类目的名字） -->

      <div class="tab clear">

        <!-- 左侧的图片和楼层 -->
        <div class="l-side">
          <img src="img/mall/cate_3.jpg" alt="">    <!-- 楼层左侧上角的图片（暂时隐藏） -->
          <!-- 楼层中的 二级分类内容 菜单 -->
          <ul>
            <li title="片剂">
              <a href="#">片剂</a>
            </li>
            <li title="颗粒剂">
              <a href="#">颗粒剂</a>
            </li>
            <li title="口服液">
              <a href="#">口服液</a>
            </li>
            <li title="散剂">
              <a href="#">散剂</a>
            </li>
            <li title="胶囊">
              <a href="#">胶囊</a>
            </li>
            <li title="浓缩丸">
              <a href="#">浓缩丸</a>
            </li>
            <li title="微丸">
              <a href="#">微丸</a>
            </li>
            <li title="粉剂">
              <a href="#">粉剂</a>
            </li>
            <li title="水丸">
              <a href="#">水丸</a>
            </li>
            <li title="蜜丸">
              <a href="#">蜜丸</a>
            </li>
          </ul>
          <!-- 楼层中的 二级分类内容 菜单 -->
        </div>

        <div class="activity">
          <ul class="bd">
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/fx_1.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/fx_2.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/fx_3.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/fx_4.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/fx_5.jpg"
                      alt=""></a>
            </li>
          </ul>
          <ul class="hd">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <span class="prev"><i class="pc-tps">&#xe63f;</i></span>
          <span class="next"><i class="pc-tps">&#xe648;</i></span>
        </div>


        <div class="activity brands">
          <!-- 楼层品牌 -->
          <ul class="bd">
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/1.jpg"
                    alt=""></a><a class="img"
                                  href="#"><img
                    src="img/drugimg/ad/2.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/3.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/4.jpg" alt=""></a>
            </li>
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/5.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/6.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/7.jpg" alt=""></a>
            </li>
          </ul>

          <!-- 品牌图标和热卖商品 切换界面的按钮 -->
          <ul class="hd">
            <li></li>
            <li></li>
          </ul>

        </div>


      </div>

      <!-- 楼层底部的商品 start -->
      <div class="list clear">
        <ul id="fx_items">
        </ul>
      </div>
      <!--end 楼层底部的商品 -->

    </div>
    <div class="popular lazy">

      <!-- 楼层的名字（一级类目的名字）  start -->
      <div class="title-tps">
        <h2>抗菌消炎</h2>
        <!-- leon 添加更多商品跳转内容 -->
        <a class="more" href="#">更多 &gt;</a>
      </div>
      <!--end   楼层的名字（一级类目的名字） -->

      <div class="tab clear">

        <!-- 左侧的图片和楼层 -->
        <div class="l-side">
          <img src="img/mall/cate_4.jpg" alt="">    <!-- 楼层左侧上角的图片（暂时隐藏） -->
          <!-- 楼层中的 二级分类内容 菜单 -->
          <ul>
            <li title="蜜丸">
              <a href="#">蜜丸</a>
            </li>
            <li title="颗粒剂">
              <a href="#">颗粒剂</a>
            </li>
            <li title="片剂">
              <a href="#">片剂</a>
            </li>
            <li title="胶囊">
              <a href="#">胶囊</a>
            </li>
            <li title="口服液">
              <a href="#">口服液</a>
            </li>
            <li title="滴丸">
              <a href="#">滴丸</a>
            </li>
            <li title="合剂">
              <a href="#">合剂</a>
            </li>
          </ul>
          <!-- 楼层中的 二级分类内容 菜单 -->
        </div>

        <div class="activity">
          <ul class="bd">
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/xy_1.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/xy_2.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/xy_3.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/xy_4.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/xy_5.jpg"
                      alt=""></a>
            </li>
          </ul>
          <ul class="hd">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <span class="prev"><i class="pc-tps">&#xe63f;</i></span>
          <span class="next"><i class="pc-tps">&#xe648;</i></span>
        </div>


        <div class="activity brands">
          <!-- 楼层品牌 -->
          <ul class="bd">
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/1.jpg"
                    alt=""></a><a class="img"
                                  href="#"><img
                    src="img/drugimg/ad/2.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/3.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/4.jpg" alt=""></a>
            </li>
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/5.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/6.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/7.jpg" alt=""></a>
            </li>
          </ul>

          <!-- 品牌图标和热卖商品 切换界面的按钮 -->
          <ul class="hd">
            <li></li>
            <li></li>
          </ul>

        </div>


      </div>

      <!-- 楼层底部的商品 start -->
      <div class="list clear">
        <ul id="xy_items">
        </ul>
      </div>
      <!--end 楼层底部的商品 -->

    </div>
    <div class="popular lazy">

      <!-- 楼层的名字（一级类目的名字）  start -->
      <div class="title-tps">
        <h2>降脂减肥</h2>
        <!-- leon 添加更多商品跳转内容 -->
        <a class="more" href="#">更多 &gt;</a>
      </div>
      <!--end   楼层的名字（一级类目的名字） -->

      <div class="tab clear">

        <!-- 左侧的图片和楼层 -->
        <div class="l-side">
          <img src="img/mall/cate_5.jpg" alt="">    <!-- 楼层左侧上角的图片（暂时隐藏） -->
          <!-- 楼层中的 二级分类内容 菜单 -->
          <ul>
            <li title="胶囊">
              <a href="#">胶囊</a>
            </li>
            <li title="水蜜丸">
              <a href="#">水蜜丸</a>
            </li>
          </ul>
          <!-- 楼层中的 二级分类内容 菜单 -->
        </div>

        <div class="activity">
          <ul class="bd">
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/jf_1.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/jf_2.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/jf_3.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/jf_4.jpg"
                      alt=""></a>
            </li>
            <li>
              <a href="#"><img
                      src="img/drugimg/backg/jf_5.jpg"
                      alt=""></a>
            </li>
          </ul>
          <ul class="hd">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <span class="prev"><i class="pc-tps">&#xe63f;</i></span>
          <span class="next"><i class="pc-tps">&#xe648;</i></span>
        </div>


        <div class="activity brands">
          <!-- 楼层品牌 -->
          <ul class="bd">
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/1.jpg"
                    alt=""></a><a class="img"
                                  href="#"><img
                    src="img/drugimg/ad/2.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/3.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/4.jpg" alt=""></a>
            </li>
            <li><a class="img" href="#"><img
                    src="img/drugimg/ad/5.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/6.jpg" alt=""></a><a
                    class="img" href="#"><img
                    src="img/drugimg/ad/7.jpg" alt=""></a>
            </li>
          </ul>

          <!-- 品牌图标和热卖商品 切换界面的按钮 -->
          <ul class="hd">
            <li></li>
            <li></li>
          </ul>

        </div>


      </div>

      <!-- 楼层底部的商品 start -->
      <div class="list clear">
        <ul id="jf_items">
        </ul>
      </div>
      <!--end 楼层底部的商品 -->
    </div>
    <!--end 首页楼层内容-->

    <!--浏览历史 start-->

    <!--end 浏览历史-->
  </div>
</div>




<!-- 楼层导航 -->
<div class="floatCtro">
  <p>
    <i class="pc-tps lc-1"></i>
    <span>风热感冒</span>
  </p>
  <p>
    <i class="pc-tps lc-2"></i>
    <span>清热祛火</span>
  </p>
  <p>
    <i class="pc-tps lc-3"></i>
    <span>腹痛腹泻</span>
  </p>
  <p>
    <i class="pc-tps lc-4"></i>
    <span>抗菌消炎</span>
  </p>
  <p>
    <i class="pc-tps lc-5"></i>
    <span>降脂减肥</span>
  </p>
  <em class="top" title="TOP"><i class="pc-tps">&#xe672;</i></em>
</div>


<!--
        <div class="appFloat">
            <div class="appContent">
                                    <a href="/index/appDownLoad"><img src="/themes/mall/img/appFloatImg.png"/></a>
                                <div class="closeBtn"></div>
            </div>
        </div>

<script>
    $(function(){
        $('.closeBtn').on('click',function(){
            $(this).parents('.appFloat').fadeOut(1000)
        })
    })
</script>-->


<script src="js/jquery.lazyload.min.js"></script>


<script>
    $(function () {
        $("img.lazy").lazyload();
    })
</script>
<script>
    //竖直导航
    $(function () {
        $('.catalog').hover(function () {
            $(this).addClass('Hover');
        }, function () {
            $(this).removeClass('Hover');
            $('.menu-cate-all-out dl').removeClass('on');
        })
        $('.menu-cate-all-out dt').mouseover(function () {
            $('.menu-cate-all-out dl').removeClass('on');
            $(this).parent().addClass('on');
        })
    });

    /**
     * tps 顶部大图
     * 调用image背景显示
     */
    jQuery(".banner").slide({
        titCell: ".hd ul", mainCell: ".bd ul", effect: "fold", autoPlay: true, autoPage: true, interTime: 3000,
        startFun: function (i) {
            var curLi = jQuery(".banner .bd li").eq(i);
          /* 当前大图的li */
            if (!!curLi.attr("_src")) {
                curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
              /* 将_src地址赋予li背景，然后删除_src */
            }
        }
    });
    jQuery(".tps-line").slide({
        mainCell: ".bd",
        effect: "left",
        autoPage: true,
        autoPlay: true,
        delayTime: 500,
        interTime: 3000,
        trigger: "click"
    });
    jQuery(".img-gg").slide({
        titCell: ".hd ul",
        mainCell: "ul.pic",
        effect: "fold",
        autoPage: true,
        autoPlay: true,
        interTime: 5000,
    });
    jQuery(".activity").slide({
        titCell: ".hd li",
        mainCell: ".bd",
        effect: "left",
        delayTime: 500,
        autoPlay: true,
        interTime: 3000,
    });

    //固定导航
    $(function () {
        var nav = $('.site-header'),
            doc = $(document),
            win = $(window);
        win.scroll(function () {
            if (doc.scrollTop() > 500) {
                nav.addClass('fixed-top');
            }
            else {
                nav.removeClass('fixed-top');
            }
        });
        win.scroll();
    });


    // $(".floatCtro p").click(function(){
    // 	var index = $(this).index();
    // 	//让滚动条移动到对应页面位置
    // 	var topslide = $(".popular").eq(index).offset().top;
    // 	$("html,body").animate({"scrollTop":topslide},500);
    // });
    // //滚动条事件
    // $(window).scroll(function(){
    // 	var topslide = $(window).scrollTop();
    // 	$(".popular").each(function(i){
    // 		if(topslide>=$(this).offset().top){
    // 			$(".floatCtro p").eq($(this)).addClass("cur").siblings().removeClass("cur");
    // 		}
    // 	});
    // 	//显示楼梯导航
    // 	if(topslide>=1900){
    // 		$(".floatCtro").addClass("show");
    // 	}else{
    // 		$(".floatCtro").removeClass("show");
    // 	}
    // });
    // //顶部
    // $(".floatCtro .top").click(function(){
    // 	$('body,html').animate({scrollTop:0},500);
    // })


    //*****************右侧侧楼梯导航*******************//
    $(function () {
        //1.楼梯什么时候显示，800px scroll--->scrollTop
        $(window).on('scroll', function () {
            var $scroll = $(this).scrollTop();
            if ($scroll >= 1900) {
                $('.floatCtro').addClass("show");
            } else {
                $('.floatCtro').removeClass("show");
            }

            //4.拖动滚轮，对应的楼梯样式进行匹配
            $('.popular').each(function () {
                if ($('.popular').eq($(this).index()).offset()) {
                    var $populartop = $('.popular').eq($(this).index()).offset().top + 400;
                    //console.log($populartop);
                    if ($populartop > $scroll) {//楼层的top大于滚动条的距离
                        $('.popular p').removeClass('cur');
                        $('.popular p').eq($(this).index()).addClass('cur');
                        return false;//中断循环
                    }
                }
            });
        });
        //2.获取每个楼梯的offset().top,点击楼梯让对应的内容模块移动到对应的位置  offset().left

        var $popularli = $('.floatCtro p').not('.last');
        $popularli.on('click', function () {
            $(this).addClass('cur').siblings('p').removeClass('cur');
            var $populartop = $('.popular').eq($(this).index()).offset().top;
            //获取每个楼梯的offsetTop值
            $('html,body').animate({//$('html,body')兼容问题body属于chrome
                scrollTop: $populartop
            })
        });

        //3.回到顶部
        $('.floatCtro .top').on('click', function () {
            $('html,body').animate({//$('html,body')兼容问题body属于chrome
                scrollTop: 0
            })
        });


    });

    //中秋活动专题弹框
    /*$(function(){
     $('.festb_close').on('click',function(){
     $('.festivalBox').fadeOut()
     })
     });
     setTimeout(function(){
     $('.festivalBox').fadeOut()
     },8000);*/

</script>


<!--
            <div class="appFloat">
            <div class="appContent">
                                    <a href="/index/appDownLoad"><img src="/themes/mall/img/appFloatImg.png"/></a>
                                <div class="closeBtn"></div>
            </div>
        </div>-->


<script src="js/main.js?v=20180423"></script>
<script src="js/base.js?v=20170614"></script>
<script src="js/jquery.cookie.js?v=1"></script>
<script>
    //定义统计流量请求地址
    window.GETDATEURL = 'https://tps-report.tps138.com/'
</script>
<script>
    $(function () {
//            $('#glgcgxfooter').click(function(){
//                window.open('http://www.glgcgx.com/')
//            })
    })
</script>
<script>
    function show_travel_msg() {
        layer.msg('在线旅游服务即将推出...');
    }
    function show_promote_msg() {
        layer.msg('');
    }
</script>

<!--	<script type='text/javascript'>-->
<!-- 		//(function(){-->
<!--		//	document.getElementById('___szfw_logo___').oncontextmenu = function(){-->
<!--		//		return false;-->
<!-- 		//	}-->
<!--		//})();-->
<!--	</script>-->

<script type="text/javascript">
    //站点统计
    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cspan  class=d-n id='cnzz_stat_icon_1262216189'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s13.cnzz.com/z_stat.php%3Fid%3D1262216189' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    //站点统计
    window.onload = function () {
        $(function () {
            $("#cnzz_stat_icon_1262216189").hide();
        })
    }
</script>

<script>
    window.onload = function () {
        //百度统计
        var tps_path_info = 'mall/index';
        var orderInfo = {};
        if (tps_path_info == 'mall/respond') {
            var order_obj = eval("{}");
            orderInfo = {
                "orderId": order_obj.order_id,
                "orderTotal": order_obj.order_total,
                "item": []
            };
            var list = order_obj.order_list;
            for (var i = 0; i < list.length; i++) {
                orderInfo.item.push({
                    "skuId": list[i].sku_id,
                    "skuName": list[i].sku_name,
                    "category": list[i].category,
                    "Price": list[i].price,
                    "Quantity": list[i].quantity
                });
            }
        }
        var _hmt = _hmt || [];
        _hmt.push(['_trackOrder', orderInfo]);
        (function () {
            var hm = document.createElement("script");
            hm.src = "js/baidu_statistics.js?v=5";
            //hm.src = "";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
        $(function () {
            var search_hots_width = 0;
            $(".search-hots").children().each(function () {
                search_hots_width += $(this).width() + 6;
                if (search_hots_width > 460) {
                    $(this).remove();
                }
            });
            var obj_b = $(".search-hots a").last().next('b');
            if (obj_b[0]) {
                obj_b.remove();
            }
        });
    }

    //统计流量
    $(function () {

        var curPageUrl = window.location.href; //本页面url

        var prevPageUrl = '';                  //页面来源
        if (curPageUrl.indexOf('index') > 0) {
            //console.log("前台")
            prevPageUrl = "前台"
        } else if (curPageUrl.indexOf('ucenter') > 0) {
            //console.log("用户中心")
            prevPageUrl = "用户中心"
        } else {
            //console.log("首页")
            prevPageUrl = "首页"
        }

        var curLang = $.cookie('curLoc');   //获取语言类型
        var clientIdVal = $.cookie('uid');
        //var clientIdVals = new Date().getTime()+clientIdVal; //用户唯一标识

        if (clientIdVal) {
            var clientIdUid = $.cookie('uid');
            console.log(clientIdUid);
        } else {
            var clientIdUid = generateUUID();
            SetCookie('uid', clientIdUid)
        }

        var fromUrlVal = document.referrer; //获取本页来源URL
        //var prevPageUrl = document.referrer; //页面来源
        //console.log('====*****'+prevPageUrl);
        $.ajax({
            url: GETDATEURL + 'flow/addFlow.action',
            type: 'POST',
            async: true,
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                clientId: clientIdUid,                   //用户唯一标识(统计UV)
                pageUrl: curPageUrl,                     //本页面url
                srcUrl: fromUrlVal,                      //来源url
                channel: 0,                              //渠道(冗余字段，为了后续推广使用)
                srcDevice: "PC",                         //设备来源(PC、IOS、ANDROID)
                area: curLang,                           //区域
                srcPage: prevPageUrl,                     //页面来源
                sign: md5(curLang + 0 + clientIdUid + curPageUrl + 'PC' + prevPageUrl + fromUrlVal + 'TPS20170825#COM$PS')
            }),
            dataType: 'json',
            success: function (data) {
                console.log(data)
            },
            error: function (xhr, textStatus) {
                console.log('错误');
                console.log(xhr);
                console.log(textStatus)
            }
        })
    });

    function generateUUID() {
        var d = new Date().getTime();
        var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = (d + Math.random() * 16) % 16 | 0;
            d = Math.floor(d / 16);
            return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
        });
        return uuid;
    }
    ;
</script>

<script type="text/javascript">
    $(".online_service").hide();
</script>

</body>
</html>

