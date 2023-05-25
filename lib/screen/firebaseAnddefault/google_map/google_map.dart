import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  GoogleMapController? controller;

  final CameraPosition initialPosition =
      const CameraPosition(target: LatLng(19.060617, 72.848791));
  var typemap = MapType.normal;
  var cordinate1 = 'cordinate';
  var lat = 19.060617;
  var long = 72.848791;
  var address = '';
  var options = [
    MapType.normal,
    MapType.hybrid,
    MapType.terrain,
    MapType.satellite,
  ];

  var _currentItemSelected = MapType.normal;

  Future<void> getAddress(latt, longg) async {
    List<Placemark> placemark = await placemarkFromCoordinates(latt, longg);
    print(
        '-----------------------------------------------------------------------------------------');
    //here you can see your all the relevent information based on latitude and logitude no.
    print(placemark);
    print(
        '-----------------------------------------------------------------------------------------');
    Placemark place = placemark[0];
    setState(() {
      address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Map App'),
        actions: [
          DropdownButton<MapType>(
            dropdownColor: Colors.blue[900],
            isDense: true,
            isExpanded: false,
            iconEnabledColor: Colors.white,
            focusColor: Colors.white,
            items: options.map((MapType dropDownStringItem) {
              return DropdownMenuItem<MapType>(
                value: dropDownStringItem,
                child: Text(
                  dropDownStringItem.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              );
            }).toList(),
            onChanged: (newValueSelected) {
              setState(() {
                _currentItemSelected = newValueSelected!;
                typemap = newValueSelected;
              });
            },
            value: _currentItemSelected,
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialPosition,
            mapType: typemap,
            onMapCreated: (controller) {
              setState(() {
                controller = controller;
              });
            },
            onTap: (cordinate) {
              setState(() {
                lat = cordinate.latitude;
                long = cordinate.longitude;
                getAddress(lat, long);

                cordinate1 = cordinate.toString();
              });
            },
          ),
          Positioned(
            left: 5,
            bottom: 150,
            child: Text(
              cordinate1,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 100,
            child: SizedBox(
              width: 200,
              child: Text(
                address,
                softWrap: true,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}