import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:socially/styles/colors.dart';
import '../components/AppIcons.dart';

class MyMap extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold( 
    appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text("Map",
      style: TextStyle(  
        fontWeight: FontWeight.bold,
      ),
      ),
    ),
      body: FlutterMap(  
        options: MapOptions(  
          center: const LatLng(33.626750, 73.011041),
          zoom: 10,
        ),
        children: [ 
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.ces.flutter',
        ),
        MarkerLayer(  
          markers: [  
             Marker(
                 point: const  LatLng(33.626750, 73.011041),
                  height: 50,
                  width: 100,
              builder: (context) {
                return Column(
                  children: [
                    Container(  
                      padding: const EdgeInsets.symmetric( 
                        horizontal: 8, vertical:4
                      ),
                      decoration: BoxDecoration( 
                        color: Colors.white,
                        borderRadius: 
                          BorderRadius.all(Radius.circular(14))),
                          child: Text(
                            "Username",
                            style: TextStyle(color: Colors.black)
                          )),
                      SvgPicture.asset( 
                        AppIcons.ic_location,
                        colorFilter: 
                         ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      )
                  ],
                );
              }
              )
          ],
        )
        ],
      )

  );
}
}