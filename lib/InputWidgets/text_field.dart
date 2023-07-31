import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  const TextFieldWidget({super.key, required this.title});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController _emailController;
  @override
  void initState() {
    //ilk değer atama
    super.initState();
    _emailController = TextEditingController(text: 'bestnemesis1234@gmail.com');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              maxLength: 50,
              decoration: InputDecoration(
                  labelText: "Label Text",
                  hintText: " +90 Phone Number",
                  prefixIcon: const Icon(Icons.phone),
                  suffixIcon: const Icon(Icons.ac_unit_rounded),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.blue[200]),
              cursorColor: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (String value) {
                debugPrint("Submit $value");
              },
              onChanged: (String value) {
                debugPrint(value);
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              autofocus:
                  true, //sayfa açıldığı gibi bu fielda gelir ve klavyeyi açar
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
