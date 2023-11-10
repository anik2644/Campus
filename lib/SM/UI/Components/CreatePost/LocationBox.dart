import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class LocationBox extends StatefulWidget {
  final Function(String) onLocationChanged;

  const LocationBox({Key? key, required this.onLocationChanged}) : super(key: key);

  @override
  State<LocationBox> createState() => _LocationBoxState();
}

class _LocationBoxState extends State<LocationBox> {
  late String loc;



  //Variables
  bool loading = false;
  String? location;
  Position? position;
  Placemark? placemark;




  TextEditingController locationTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Text(
          'Location'.toUpperCase(),
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0.0),
          title: Container(
            width: 250.0,
            child: TextFormField(
              controller: locationTEC ,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                hintText: 'United States, Los Angeles!',
                focusedBorder: UnderlineInputBorder(),
              ),
              maxLines: null,
              onChanged: (val) {
                loc = val;
                widget.onLocationChanged(loc);
              },
            ),
          ),
          trailing: IconButton(
            tooltip: "Use your current location",
            icon: Icon(
              CupertinoIcons.map_pin_ellipse,
              size: 25.0,
            ),
            iconSize: 30.0,
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
                getLocation();

            }, // Handle getting current location
          ),
        ),
      ],
    );
  }


  getLocation() async {
    loading = true;
  //  notifyListeners();
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission rPermission = await Geolocator.requestPermission();
      print(rPermission);
      await getLocation();
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);
      placemark = placemarks[0];
      location = " ${placemarks[0].locality}, ${placemarks[0].country}";
      locationTEC.text = location!;
      print(location);
      widget.onLocationChanged(location!);
    }

    loading = false;
   // notifyListeners();
  }
}
