import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PreferencesScreen extends StatefulWidget {
  PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  Map<String, List<String>> RoomMate = {
    'Gender': ['Male', 'Female'],
    'Rate': ['below 10K', '10K - 15K', '15K - 20K', '20K and above'],
    'Age': ['18 - 24', '25 - 30', '30 -40 ', '40 and above'],
    'Food Preference': ['Veg', 'Non-Veg', 'Jain'],
  };

  Map<String, List<String>> appartment = {
    'BHK': ['1BHK', '2BHK', '3BHK', '3BHK +'],
    'Bathroom': ['1', '2'],
    'Internet': ['Free', 'Paid'],
    'Near By': [
      'School',
      'Hospital',
      'Metro',
      'Highway',
      'Railway Station',
      'Bus Stand',
      'Restaurant'
    ],
  };

  RxMap<String, List<dynamic>> appartmentPrefs = {
    'BHK': [],
    'Bathroom': [],
    'Internet': [],
    'Near By': [],
  }.obs;

  RxMap<String, List<dynamic>> roomMatePrefs = {
    'Gender': [],
    'Rate': [],
    'Age': [],
    'Food Preference': [],
  }.obs;

  RxInt appt = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Choose your preferences",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Roommate",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Obx(
          () => Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: roomMatePrefs.value.entries.map((entry) {
              log(entry.toString());
              return Container(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: entry.value.map((value) {
                    return Chip(
                      label: Text(value),
                      backgroundColor: Colors.grey[100],
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () {
            showRoommateDialog(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Text('Add Preference'),
            ],
          ),
          style: OutlinedButton.styleFrom(shape: StadiumBorder()),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Appartment",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Obx(
          () => Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: roomMatePrefs.value.entries.map((entry) {
              log(entry.toString());
              return Container(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: entry.value.map((value) {
                    return Chip(
                      label: Text(value),
                      backgroundColor: Colors.grey[100],
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () {
            showApartmentDialog(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Text('Add Preference'),
            ],
          ),
          style: OutlinedButton.styleFrom(shape: StadiumBorder()),
        )
      ],
    );
  }

  showRoommateDialog(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: SimpleDialog(
                titlePadding: EdgeInsets.all(10),
                contentPadding: EdgeInsets.all(10),
                insetPadding: EdgeInsets.all(10),
                title: const Text('Choose Preferences'),
                children: <Widget>[
                  showRoomPrefTile(0, "Gender"),
                  showRoomPrefTile(1, "Rate"),
                  showRoomPrefTile(2, "Age"),
                  showRoomPrefTile(3, "Food Preference")
                ]),
          );
        });
  }

  showApartmentDialog(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: SimpleDialog(
                titlePadding: EdgeInsets.all(10),
                contentPadding: EdgeInsets.all(10),
                insetPadding: EdgeInsets.all(10),
                title: const Text('Choose Preferences'),
                children: <Widget>[
                  showApartmentPrefTile(0, "BHK"),
                  showApartmentPrefTile(1, "Bathroom"),
                  showApartmentPrefTile(2, "Internet"),
                  showApartmentPrefTile(3, "Near By"),
                ]),
          );
        });
  }

  showRoomPrefTile(int index, String name) {
    return StatefulBuilder(
        builder: (BuildContext context, setState) => SimpleDialogOption(
              onPressed: () {},
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(name),
                children: RoomMate.entries
                    .elementAt(index)
                    .value
                    .map((e) => CheckboxListTile(
                          title: Text(e),
                          value: roomMatePrefs.value.entries
                              .elementAt(index)
                              .value
                              .contains(e),
                          onChanged: (newValue) {
                            if (newValue!) {
                              setState(
                                () {
                                  roomMatePrefs.value.entries
                                      .elementAt(index)
                                      .value
                                      .add(e);
                                },
                              );
                            } else if (!newValue) {
                              setState(
                                () {
                                  roomMatePrefs.value.entries
                                      .elementAt(index)
                                      .value
                                      .remove(e);
                                },
                              );
                            }
                            log(roomMatePrefs.toString());
                            log(newValue.toString());
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ))
                    .toList(),
              ),
            ));
  }

  showApartmentPrefTile(int index, String name) {
    return StatefulBuilder(
        builder: (BuildContext context, setState) => SimpleDialogOption(
              onPressed: () {},
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(name),
                children: appartment.entries
                    .elementAt(index)
                    .value
                    .map((e) => CheckboxListTile(
                          title: Text(e),
                          value: appartmentPrefs.value.entries
                              .elementAt(index)
                              .value
                              .contains(e),
                          onChanged: (newValue) {
                            if (newValue!) {
                              setState(
                                () {
                                  appartmentPrefs.value.entries
                                      .elementAt(index)
                                      .value
                                      .add(e);
                                },
                              );
                            } else if (!newValue) {
                              setState(
                                () {
                                  appartmentPrefs.value.entries
                                      .elementAt(index)
                                      .value
                                      .remove(e);
                                },
                              );
                            }
                            log(appartmentPrefs.toString());
                            log(newValue.toString());
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ))
                    .toList(),
              ),
            ));
  }
}
