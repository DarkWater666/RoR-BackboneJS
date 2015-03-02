# http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html#.toolbar_Full
CKEDITOR.editorConfig = (config) ->
  config.language = 'ru'
  config.height = '200'
  config.skin = 'admin_orange'
  config.forcePasteAsPlainText = true
#  config.uiColor = '#e9ecf3'
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files"
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files"
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files"
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures"
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures"
  config.filebrowserImageUploadUrl = "/ckeditor/pictures"
  config.filebrowserUploadUrl = "/ckeditor/attachment_files"
  config.assets_plugins = ['image', 'smiley']
  config.toolbar_Pure = [
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] }
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] }
    { name: 'links',       items: [ 'Link','Unlink','Anchor' ] }
    { name: 'colors',      items: [ 'TextColor','BGColor' ] }
    { name: 'insert',      items: [ 'Image','Table','HorizontalRule','SpecialChar' ] }
    { name: 'editing',     items: [ 'Find','-','SpellChecker', 'Scayt' ] }
    { name: 'tools',       items: [ 'Maximize'] }
    { name: 'document',    items: [ 'Source'] }
  ]
  config.toolbar = 'Pure'