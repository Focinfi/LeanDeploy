// = require echo
// = require mobilecheck
// = require module
// = require hotkeys
// require uploader
// = require simditor
(function() {
  $(function() {
    // set url-copy listener
    // $('#url-copy-1').click(function () {
    //   window.clipboardData.setData("url-copy-1", $('#url-copy-1').text());
    // })
    // $('#url-copy-2').click(function () {
    //   window.clipboardData.setData("url-copy-2", $('#url-copy-2').text());
    // })
    // $('#url-copy-3').click(function () {
    //   window.clipboardData.setData("url-copy-3", $('#url-copy-3').text());
    // })
    // init echo
    echo.init({
      offset: 100,
      throttle: 250,
      unload: false,
      callback: function (element, op) {
        console.log(element, 'has been', op + 'ed')
      }
    });

   // init simditor 
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
