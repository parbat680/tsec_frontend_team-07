import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tsec_app/views/auth/login_screen.dart';
import 'package:tsec_app/views/home/appartment.dart';
import 'package:tsec_app/views/home/profileSetup/steps/preferances.dart';
import 'package:tsec_app/views/home/roommate.dart';
import 'package:tsec_app/views/home/search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _currentpage = 0.obs;

  var pages = [
    ApartmentScreen(),
    RoomMateScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 25,
                  ),
                  Expanded(
                    child: Text(
                      "Roommate App",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchRoomDelegate());
                },
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerRight,
                    shape: StadiumBorder(),
                    minimumSize: Size(double.infinity, 50),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    primary: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 40),
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: TabBar(
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        tabs: const [
                          Tab(
                            text: "Appartment",
                          ),
                          Tab(
                            text: "Roommate",
                          )
                        ],
                        onTap: (index) {
                          _currentpage.value = index;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(child: pages[_currentpage.value])
                  ],
                ),
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
