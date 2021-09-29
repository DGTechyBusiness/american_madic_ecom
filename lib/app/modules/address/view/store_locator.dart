import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreLocator extends StatefulWidget {
  const StoreLocator({Key key}) : super(key: key);

  @override
  _StoreLocatorState createState() => _StoreLocatorState();
}

class _StoreLocatorState extends State<StoreLocator> {
  Set<Marker> markers = {};
  void onMapCreated(GoogleMapController controller){
    setState(() {
      markers.add(Marker(markerId: MarkerId("id-0"),
        position: LatLng(22.5448131, 88.3403691),
        infoWindow: InfoWindow(
          title: 'Ameriacamedic',
          snippet: 'Americamedic store'

        )
       ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Store Locator'),),
      body: GoogleMap(
        markers: markers,
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          //target: LatLng(51.50500286265417, -0.1877117156982422),
            target: LatLng(22.5448131, 88.3403691),
            zoom: 15,
        ),
      ),
    );
  }
}

