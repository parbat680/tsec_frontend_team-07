import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tsec_app/models/apartment.dart';
import 'package:tsec_app/network/api/fetch_apartments.dart';
import 'package:tsec_app/views/widgets/item_card_main.dart';

class ApartmentScreen extends StatefulWidget {
  const ApartmentScreen({Key? key}) : super(key: key);

  @override
  State<ApartmentScreen> createState() => _ApartmentScreenState();
}

class _ApartmentScreenState extends State<ApartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchApartments.get(),
        builder: ((BuildContext c, AsyncSnapshot<List<Apartment>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return ItemCardMain(
                    apartment: snapshot.data![index],
                  );
                }));
          }

          return Text(snapshot.data.toString());
        }));
  }
}
