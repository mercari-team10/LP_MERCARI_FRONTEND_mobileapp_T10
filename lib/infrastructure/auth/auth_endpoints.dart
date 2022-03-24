class AuthEndpoints{
	static const String urlInitials = "https://lp-mercari-team10.tk/api/nhid/patient/";
	static String get login => 'login'.addInitialUrl;
	static String get register => "register".addInitialUrl;
	static String get signout => "signout".addInitialUrl;
}


extension AddStringOnURL on String{
	String get addInitialUrl => AuthEndpoints.urlInitials + this;

  String appendAtLast(String value) => this + value;

  String appendAtFront(String value) => value + this;
}