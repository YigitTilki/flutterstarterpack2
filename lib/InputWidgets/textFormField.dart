import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/Utilities/Validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  String _email = "", _password = "", _username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFormField"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  //initialValue: "Yiğit Tilki",
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _username = value!;
                  },
                  validator: (value) {
                    if (value!.length < 4) {
                      return "Username must be longer than 4 character";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _email = value!;
                  },
                  validator: (value) {
                    if (!EmailValidator.validate(value!)) {
                      return "Email is wrong. Please check it";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "☻",
                  controller: controller,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                FlutterPwValidator(
                    onSuccess: () {
                      print("matched");
                    },
                    key: validatorKey,
                    width: 400,
                    height: 150,
                    minLength: 8,
                    controller: controller,
                    numericCharCount: 1,
                    uppercaseCharCount: 1,
                    lowercaseCharCount: 1,
                    specialCharCount: 1),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                      String result =
                          "Username: $_username\nEmail: $_email\nPassword: $_password";

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result),
                        ),
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
