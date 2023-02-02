import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tsec_app/views/widgets/roommate_tile.dart';

class RoomMateScreen extends StatelessWidget {
  const RoomMateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [RoomMateTile(), RoomMateTile()],
      ),
    );
  }
}
