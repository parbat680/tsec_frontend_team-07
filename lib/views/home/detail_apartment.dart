import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';
import 'package:tsec_app/models/apartment.dart';
import 'package:tsec_app/views/home/panorama.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailApartmentScreen extends StatelessWidget {
  DetailApartmentScreen({Key? key, required this.apartment}) : super(key: key);

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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            //2
            SliverAppBar(
              expandedHeight: 250.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  apartment.images![0],
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //3
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2BHK Apartment with Parking",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              spreadRadius: 3,
                              blurRadius: 10,
                            )
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                String url =
                                    "https://www.google.com/maps/search/?api=1&query='${apartment.address!.addressLine1}, ${apartment.address!.addressLine2}, ${apartment.address!.city} - ${apartment.address!.pincode}";
                                launchUrl(
                                  Uri.parse(url),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              child:
                                  showIconColumn(Icons.location_on, "Map View"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => PanoramaScreen());
                              },
                              child: showIconColumn(
                                  Icons.panorama_photosphere, "Panorama"),
                            ),
                            showIconColumn(Icons.category, "Nearby"),
                          ]),
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${apartment.address!.addressLine1}, ${apartment.address!.addressLine2}, ${apartment.address!.city} - ${apartment.address!.pincode}",
                      style: TextStyle(
                        color: Color(0xff6f6f6f),
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '''Are you looking for family friendly neighborhood with great neighbors, large lot with a creek that runs through the back.''',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Owner Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user.png'),
                          radius: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Parbatsingh ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.orangeAccent, width: 1.6),
                          ),
                          child: Icon(
                            Icons.chat,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                              Uri(scheme: 'tel', path: apartment.phone),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.green, width: 1.6),
                            ),
                            child: Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showIconColumn(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
