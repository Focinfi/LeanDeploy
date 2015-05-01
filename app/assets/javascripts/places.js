// = require mobilecheck
// = require module
// = require hotkeys
// = require uploader
// = require simditor
(function() {
  $(function() {
    var editor, mobileToolbar, toolbar;
    toolbar = ['title', 'bold', 'italic', 'underline', 'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent'];
    mobileToolbar = ["bold", "underline", "strikethrough", "color", "ul", "ol"];
    if (mobilecheck()) {
      toolbar = mobileToolbar;
    }
    return editor = new Simditor({
      textarea: $('#place-html-doc'),
      placeholder: '输入丰富多彩的介绍',
      toolbar: toolbar,
      pasteImage: true,
      // defaultImage: 'assets/images/image.png',
      upload: location.search === '?upload' ? {
        url: '/upload'
      } : false
    });
  });
}).call(this);
