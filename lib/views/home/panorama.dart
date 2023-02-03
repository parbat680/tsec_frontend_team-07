import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:panorama/panorama.dart';

class PanoramaScreen extends StatelessWidget {
  const PanoramaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    panorama = Panorama(
      animSpeed: 0.01,
      sensorControl: SensorControl.AbsoluteOrientation,
      croppedArea: Rect.fromLTWH(2533.0, 1265.0, 5065.0, 2533.0),
      croppedFullWidth: 5066.0,
      croppedFullHeight: 5066.0,
      child: Image.asset('assets/images/panorama.jpg'),
    );
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: panorama,
        ));
  }
}
