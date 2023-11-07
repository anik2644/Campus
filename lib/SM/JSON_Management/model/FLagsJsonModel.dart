class FlagsJsonModel {

  final String? login;

  FlagsJsonModel(this.login);

  FlagsJsonModel.fromJson(Map<String, dynamic> json)
      : login = json['login']
  ;

  Map<String, dynamic> toJson() => {

    'login': login,
  };
}

