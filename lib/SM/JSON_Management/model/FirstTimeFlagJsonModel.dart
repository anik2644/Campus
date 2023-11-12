class FirstTimeFlagsJsonModel {

  final String? isFirstTime;

  FirstTimeFlagsJsonModel(this.isFirstTime);

  FirstTimeFlagsJsonModel.fromJson(Map<String, dynamic> json)
      : isFirstTime = json['isFirstTime']
  ;

  Map<String, dynamic> toJson() => {

    'isFirstTime': isFirstTime,
  };
}