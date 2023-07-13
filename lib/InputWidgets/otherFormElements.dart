import 'package:flutter/material.dart';

class OtherFormElements extends StatefulWidget {
  OtherFormElements({super.key});

  @override
  State<OtherFormElements> createState() => _OtherFormElementsState();
}

class _OtherFormElementsState extends State<OtherFormElements> {
  bool checkBoxState = false;
  String city = "";
  String selectedColor = "Red";
  List<String> cityList = ["Ankara", "Istanbul", "Tekirdag", "Kocaeli"];
  String SelectedCity = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Form Elements"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (selected) {
                setState(() {
                  checkBoxState = selected!;
                });
              },
            ),
            RadioListTile(
              value: "Ankara",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                });
              },
              title: Text("Ankara"),
            ),
            RadioListTile(
              value: "Istanbul",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                });
              },
              title: Text("Istanbul"),
            ),
            RadioListTile(
              value: "Tekirdag",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                });
              },
              title: Text("Tekirdag"),
            ),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  child: Text("Red"),
                  value: "Red",
                ),
                DropdownMenuItem(
                  child: Text("Yellow"),
                  value: "Yellow",
                ),
                DropdownMenuItem(
                  child: Text("Blue"),
                  value: "Blue",
                ),
              ],
              onChanged: (String? selected) {
                setState(() {
                  selectedColor = selected!;
                });
              },
              hint: Text("Select"),
              value: selectedColor,
            ),
            DropdownButton(
              items: cityList.map(
                (currentCity) {
                  return DropdownMenuItem<String>(
                    child: Text(currentCity),
                    value: currentCity,
                  );
                },
              ).toList(),
              onChanged: (city) {
                setState(() {
                  SelectedCity = city!;
                });
              },
              value: SelectedCity,
            ),
          ],
        ),
      ),
    );
  }
}
