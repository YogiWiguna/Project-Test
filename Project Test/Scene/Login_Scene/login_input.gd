extends Control

@onready var LoginManager = $".."

@onready var http : HTTPRequest = $HTTPRequest
@onready var username : LineEdit = $Username
@onready var password : LineEdit = $Password
@onready var error = $Error



func _on_exit_pressed():
	LoginManager.LoginInputMenu()



func _on_login_pressed():
	if username.text.is_empty() or password.text.is_empty():
		error.text = "Please, enter your username and password"
		return
	FireBase.login(username.text, password.text, http)


func _on_http_request_request_completed(_result, response_code, _headers, body):
	var response_body = JSON.parse_string(body.get_string_from_ascii())
#	print(response_body["email"])
	if response_code == 200:
		Global.resume()
		Global.email = response_body["email"]
		error.text = "Sign in Succesful!"
		print(error.text)
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Scene/main_menu_manager.tscn")
	else :
		error.text = response_body.error.message
