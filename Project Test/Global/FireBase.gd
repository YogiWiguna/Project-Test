extends Node

const API_KEY := "AIzaSyBRJ7i424Z8cFu0pTh4NCpPLhncc-x14xA"
const REGISTER_KEY := "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=%s" % API_KEY
const LOGIN_KEY := "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=%s" % API_KEY

var current_token := ""

func _get_token_id_from_result(result : Array) -> String:
	print(result[3].get_string_from_ascii())
	var result_body = JSON.parse_string(result[3].get_string_from_ascii()) as Dictionary
	return result_body["idToken"]

func register(email: String, password: String, http: HTTPRequest) -> void :
	var body = JSON.stringify({'email': email, 'password': password})
	http.request(REGISTER_KEY, [], HTTPClient.METHOD_POST, body)
	var result = await http.request_completed as Array
	print(result)
	if result[1] == 200:
		current_token = _get_token_id_from_result(result)

func login(email: String, password: String, http: HTTPRequest) -> void :
	var body = JSON.stringify({'email': email, 'password': password})
	http.request(LOGIN_KEY, [], HTTPClient.METHOD_POST, body)
	var result = await http.request_completed as Array
	if result[1] == 200:
		current_token = _get_token_id_from_result(result)
		get_tree().change_scene_to_file("res://Scene/main_menu_manager.tscn")
