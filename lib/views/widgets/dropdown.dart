import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown(
      {Key? key,
      required this.items,
      required this.updateVal,
      required this.hintText})
      : super(key: key);

  List<String> items;
  String hintText;
  RxString val = 'male'.obs;
  final Function(String val) updateVal;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1.0, color: Colors.grey)),
        child: Obx(
          () => DropdownButton(
            hint: Text('gender'),
            isExpanded: true,
            value: val.value,
            underline: Divider(
              height: 0,
              color: Colors.transparent,
            ),
            alignment: Alignment.bottomRight,
            icon: const Icon(Icons.keyboard_arrow_down),
            menuMaxHeight: 200,
            items: items.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            onChanged: (value) {
              updateVal(value.toString());
            },
          ),
        ));
  }
}
