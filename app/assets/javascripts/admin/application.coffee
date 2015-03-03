#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require jquery-ui
#= require underscore
#= require bxslider
#= require fancybox
#= require jquery-fileupload
#= require jquery.Jcrop
#= require ckeditor/init
#= require ckeditor/front_config
#= require nprogress
#= require nprogress-turbolinks
#= require turbolinks
#= require dataTables/jquery.dataTables
#= require_tree .



NProgress.configure
	showSpinner: false
	ease: 'ease'
	speed: 300
	parent: '.nprogress'

$(document).on 'page:fetch', ->
	NProgress.start()
	$('.nprogress').show()

$(document).on "page:change", ->
	$('a.fancy').fancybox()
	NProgress.start()
	$('.nprogress').show().delay(0).fadeOut( "slow" )
	$('.remoteLink').click ->
		NProgress.start()
		$('.nprogress').show()

	CKEDITOR.config.customConfig = 'ckeditor/front_config.js.coffee'
#  $('a.link_to_flash').delay(2000).click()

$ ->
	$('a.fancy').fancybox type: "image"