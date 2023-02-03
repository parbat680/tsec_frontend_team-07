import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsec_app/models/apartment.dart';
import 'package:tsec_app/views/home/detail_apartment.dart';

class ItemCardMain extends StatelessWidget {
  ItemCardMain({Key? key, required this.apartment}) : super(key: key);

  Apartment apartment;
  List<IconData> chipIcons = [
    Icons.bed,
    Icons.bathtub,
    Icons.square_foot,
    Icons.wifi
  ];

  List<String> ameneties = [];

  @override
  Widget build(BuildContext context) {
    ameneties.addAll(
        [apartment.bhk.toString(), "1", apartment.area.toString(), "1"]);
    return Container(
      height: 370,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailApartmentScreen(
                apartment: apartment,
              ));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      apartment.images![0],
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2BHK Apartment with Parking",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "₹ ${apartment.rent}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          " / month",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${apartment.address!.addressLine1},${apartment.address!.addressLine2}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: chipIcons
                          .map(
                            (e) => Chip(
                              label: Text(ameneties[chipIcons.indexOf(e)]),
                              avatar: InkWell(
                                onTap: () {},
                                child: Icon(
                                  e,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
