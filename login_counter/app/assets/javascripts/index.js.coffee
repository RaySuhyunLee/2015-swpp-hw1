$(document).ready ->
	$('#button_login').click ->
		sendAjaxRequest('/login')
	$('#button_signup').click ->
		sendAjaxRequest('/signup')
	$('#message_box').text(default_message)

sendAjaxRequest = (url_str) ->
	$.ajax
		url: url_str
		type: 'POST'
		data:
			username: $('#id').val()
			password: $('#pass').val()
		success: (data, status, response) ->
			e = data.error_code
			if e?
				$('#message_box').text(error_messages[-(e+1)])
			else
				window.location.replace('/index/logged')

		error: ->
		dataType: "json"

default_message = 'Please enter your credentials below'
error_messages = [
	'The user name should be 5~20 characters long. Please try again.',
	'The password should be 8~20 characters long. Please try again.',
	'This user name already exists. Please try again',
	'Invalid username and password combination. Please try again'
]
