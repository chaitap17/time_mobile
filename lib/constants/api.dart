const String DOMAIN = "localhost";
const int PORT = 8080;
const String BASE_URL = "http://$DOMAIN:$PORT";

const String SEVICE_AUTH = "auth";
const String SEVICE_USERS = "users";

const VERSION = "api/v1";

const API_AUTH = "$BASE_URL/$SEVICE_AUTH/$VERSION";
const API_USERS = "$BASE_URL/$SEVICE_USERS/$VERSION";

class MyApi {
////  AUTH
  static get auth => "$API_AUTH/login";
  static get register => "$API_AUTH/register";
////  USERS
  static get me => "$API_USERS/me";
}
