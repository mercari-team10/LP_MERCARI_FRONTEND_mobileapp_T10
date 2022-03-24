class ApiEndpoints{
	static const String urlInitials = "https://lp-mercari-team10.tk/api/";
	static String get docAppnt => 'doc_appnt'.addInitialUrl;
	static String get labAppnt => "lab_appnt".addInitialUrl;
	static String get getDoctors => "hospitals/doctor_specialisation".addInitialUrl;
	static String get getHospitals => "hospitals/hospital_specialisation".addInitialUrl;
	static String get getSpecialisation => "hospitals/filter_hospitals".addInitialUrl;
	static String get getBills => "bills".addInitialUrl;
	static String get checkAvailable => "checkAvailable".addInitialUrl;
	static String get getReports => "checkAvailable".addInitialUrl;
}


extension AddStringOnURL on String{
	String get addInitialUrl => ApiEndpoints.urlInitials + this;

  String appendAtLast(String value) => this + value;

  String appendAtFront(String value) => value + this;
}