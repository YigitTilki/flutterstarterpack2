import 'package:flutter/material.dart';

class OtherFormElements extends StatefulWidget {
  const OtherFormElements({super.key});

  @override
  State<OtherFormElements> createState() => _OtherFormElementsState();
}

class _OtherFormElementsState extends State<OtherFormElements> {
  bool checkBoxState = false;
  String city = "";
  String selectedColor = "Red";
  List<String> cityList = ["Ankara", "Istanbul", "Tekirdag", "Kocaeli"];
  // ignore: non_constant_identifier_names
  String SelectedCity = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Form Elements"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
              title: const Text("Ankara"),
            ),
            RadioListTile(
              value: "Istanbul",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                });
              },
              title: const Text("Istanbul"),
            ),
            RadioListTile(
              value: "Tekirdag",
              groupValue: city,
              onChanged: (value) {
                setState(() {
                  city = value!;
                });
              },
              title: const Text("Tekirdag"),
            ),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem(
                  value: "Red",
                  child: Text("Red"),
                ),
                DropdownMenuItem(
                  value: "Yellow",
                  child: Text("Yellow"),
                ),
                DropdownMenuItem(
                  value: "Blue",
                  child: Text("Blue"),
                ),
              ],
              onChanged: (String? selected) {
                setState(() {
                  selectedColor = selected!;
                });
              },
              hint: const Text("Select"),
              value: selectedColor,
            ),
            DropdownButton(
              items: cityList.map(
                (currentCity) {
                  return DropdownMenuItem<String>(
                    value: currentCity,
                    child: Text(currentCity),
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
