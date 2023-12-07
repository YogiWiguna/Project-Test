extends Control

@onready var http : HTTPRequest = $HTTPRequest
@onready var username : LineEdit = $Username
@onready var password : LineEdit = $Password
@onready var confirm : LineEdit = $confirm
@onready var notification : Label = $Error
@onready var notification_login = get_node("/root/login_manager/Login_Input/Error")
@onready var LoginManager = $".."

func _on_exit_pressed():
	LoginManager.RegisterInputMenu()

func _on_http_request_request_completed(_result, response_code, _headers, body):
	var response_body = JSON.parse_string(body.get_string_from_ascii())
#	print(body)
	if response_code == 200:
		Global.resume()
		notification.text = "Registration Sucessful!"
		await get_tree().create_timer(1).timeout
		LoginManager.login_show()
		username.text = ""
		password.text = ""
		confirm.text = ""
		notification.text = ""
	else :
		notification.text = response_body.error.message

func _on_register_pressed():
	if password.text != confirm.text:
		notification.text = "Please Check Your Password"
		return
#	elif username.text.is_empty():
#		notification.text = "Please Input Your Email"
#		return
#	elif password.text.is_empty():
#		notification.text = "Please Input Your Password"
	FireBase.register(username.text, password.text, http)


