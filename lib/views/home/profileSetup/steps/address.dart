import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Enter your Address (Optional)",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        showText('', 'Apartment, suite, etc.', Icons.home),
        SizedBox(
          height: 20,
        ),
        showText('', 'Street Address', Icons.signpost),
        SizedBox(
          height: 20,
        ),
        showText('', 'City', Icons.location_city),
        SizedBox(
          height: 20,
        ),
        showText('', 'State', Icons.home),
        SizedBox(
          height: 20,
        ),
        showText('', 'Zip Code', Icons.home),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  showText(label, hintText, IconData icon,
      {TextInputType? keyboardType, TextEditingController? controller}) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        label: null,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon),
      ),
      validator: (value) {},
    );
  }
}
