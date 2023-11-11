import 'package:image_picker/image_picker.dart';


Future<String> pickImagee() async {

  ImagePicker imagePicker = ImagePicker();
  XFile? filee = await imagePicker.pickImage(source: ImageSource.gallery);
  String path =filee!.path;
  print('${path}');

  if (filee == null) return "";

return path;

/*  setState(() {
    pathh =filee!.path;
    flag =1;
  });*/
}