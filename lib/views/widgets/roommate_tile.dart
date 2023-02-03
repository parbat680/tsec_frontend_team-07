import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tsec_app/models/roommate.dart';

class RoomMateTile extends StatelessWidget {
  const RoomMateTile({Key? key, required this.roomMate}) : super(key: key);

  final RoomMate roomMate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 118,
      decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/ladki2.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    roomMate.user1Phone.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Shyam Nagar, Mumbai",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "₹ 10,000",
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
                ],
              ),
            ]),
          ),
          Positioned(
              bottom: -5,
              right: -5,
              child: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Text(
                  roomMate.percentage.toString() + ' %',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
