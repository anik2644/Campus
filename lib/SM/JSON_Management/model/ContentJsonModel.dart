class ContentJsonModel {


  final List<String> AllImagesList;
  final List<String> ContentImageSequence;
  final List<String> ContentSegments;
  final String Location;
  final String Title;

  ContentJsonModel(this.AllImagesList, this.ContentImageSequence, this.ContentSegments, this.Location, this.Title);

  ContentJsonModel.fromJson(Map<String, dynamic> json)
      : AllImagesList = json['AllImagesList'],
        ContentImageSequence = json['ContentImageSequence'],
        ContentSegments = json['ContentSegments'],
        Location = json['Location'],
        Title = json['Title']

  ;


  Map<String, dynamic> toJson() => {

    'AllImagesList': AllImagesList,
    'ContentImageSequence':ContentImageSequence,
    'ContentSegments':ContentSegments,
    'Location':Location,
    'Title':Title,
  };
}