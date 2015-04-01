$(document).ready ->
	$('#button_login').click ->
		sendAjaxRequest('index/login')
	$('#button_signup').click ->
		sendAjaxRequest('index/signup')

sendAjaxRequest = (url_str) ->
	$.ajax
		url: url_str
		type: 'POST'
		data:
			id: $('#id').val()
			pass: $('#pass').val()
		success: (data, status, response) ->
		error: ->
		dataType: "json"


