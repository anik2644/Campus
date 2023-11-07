class LoginFlagsJsonModel {

  final String? islogin;

  LoginFlagsJsonModel(this.islogin);

  LoginFlagsJsonModel.fromJson(Map<String, dynamic> json)
      : islogin = json['islogin']
  ;

  Map<String, dynamic> toJson() => {

    'islogin': islogin,
  };
}