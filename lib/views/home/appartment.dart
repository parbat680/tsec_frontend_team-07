import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tsec_app/views/widgets/item_card_main.dart';

class ApartmentScreen extends StatelessWidget {
  const ApartmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [ItemCardMain(), ItemCardMain()],
      ),
    );
  }
}
