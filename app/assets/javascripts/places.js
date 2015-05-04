// = require mobilecheck
// = require amap
// = require module
// = require hotkeys
// require uploader
// = require simditor

(function() {
  function preview(file) {
    var img = new Image(), url = img.src = URL.createObjectURL(file)
    var $img = $(img)
    img.onload = function() {
      URL.revokeObjectURL(url)
      $('#preview').append($img)
   }
  }
  $(function() {
    //#select-image change listener
    $('#select-image').change(function(e) {
      console.log("change");
      $('#preview').empty();
      for(var i = 0; i < e.target.files.length; i++) {
         var file = e.target.files[i]
         console.log("file change");
         preview(file)
      }
    });

    var lon = $("#place_longitude").val();
    var lat = $("#place_latitude").val();
 
    //Default 南邮图书馆坐标
    if (!lon || !lat) { 
      lon = 118.931784;
      lat = 32.111899; 
    } else if(lon && lat) {
      lon = Number(lon);
      lat = Number(lat);
    }

    console.log(lon);
    console.log(lat);
    //map
    var map = new AMap.Map('mapContainer', {
      resizeEnable: true,
      //rotateEnable: true,
      //dragEnable: true,
      //zoomEnable: true,
      //设置可缩放的级别
      zooms: [3,18],
      icon: "http://cache.amap.com/lbs/static/0.png",
      //传入2D视图，设置中心点和缩放级别
      view: new AMap.View2D({
        center: new AMap.LngLat(lon, lat),
        zoom: 16
      })
    });   

    //在地图中添加ToolBar插件
    map.plugin(["AMap.ToolBar"],function(){   
      toolBar = new AMap.ToolBar();
      map.addControl(toolBar);    
    });

    //为地图注册click事件获取鼠标点击出的经纬度坐标
    var clickEventListener=AMap.event.addListener(map,'click',function(e){
      $("#place_longitude").val(e.lnglat.getLng());
      $("#place_latitude").val(e.lnglat.getLat());
    }); 

    //init simditor 
    var editor, mobileToolbar, toolbar;
    toolbar = ['title', 'bold', 'italic', 'underline', 'color', '|', 'ol', 'ul', 'blockquote', '|', 'link', 'hr', 'image', '|', 'indent', 'outdent' ];
    mobileToolbar = ["bold", "underline", "color", "ul", "ol"];
    if (mobilecheck()) {
      toolbar = mobileToolbar;
    }
    
    editor = new Simditor({
      textarea: $('#place-html-doc'),
      placeholder: '输入丰富多彩的介绍',
      toolbar: toolbar,
      pasteImage: true,
      defaultImage: 'assets/images/library.png'
      // upload: location.search === '?upload' ? {
      //   url: '/upload'
      // } : false
    });
  });
}).call(this);
