import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _activeStep = 0;
  String? name, mail, password;
  List<Step>? allSteps;
  bool error = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    allSteps = _allSteps();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Example"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: allSteps!,
          currentStep: _activeStep,
          onStepContinue: () {
            setState(() {
              _continueButtonController();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_activeStep > 0) {
                _activeStep--;
              } else {
                _activeStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step>? _allSteps() {
    List<Step> steps = [
      Step(
        title: const Text("Enter Username"),
        subtitle: const Text("UsernameSubtitle"),
        state: _setUpStates(0)!,
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "UsernameLabel",
              hintText: "UsernameHint"),
          validator: (enteredValue) {
            if (enteredValue!.length < 6) {
              return "Enter at least 6 characters";
            }
            return null;
          },
          onSaved: (enteredValue) {
            name = enteredValue;
          },
        ),
      ),
      Step(
        title: const Text("Enter Mail Adress"),
        subtitle: const Text("MailSubtitle"),
        state: _setUpStates(1)!,
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "MailLabel",
              hintText: "MailHint"),
          validator: (enteredValue) {
            if (enteredValue!.length < 6 || !enteredValue.contains("@")) {
              return "Enter valid e-mail adress";
            }
            return null;
          },
          onSaved: (enteredValue) {
            mail = enteredValue;
          },
        ),
      ),
      Step(
        title: const Text("Enter Password"),
        subtitle: const Text("PasswordSubtitle"),
        state: _setUpStates(2)!,
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "PasswordLabel",
              hintText: "PasswordHint"),
          validator: (enteredValue) {
            if (enteredValue!.length < 6) {
              return "Enter at least 6 characters";
            }
            return null;
          },
          onSaved: (enteredValue) {
            password = enteredValue;
          },
        ),
      ),
    ];
    return steps;
  }

  StepState? _setUpStates(int currentState) {
    if (_activeStep == currentState) {
      if (error) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _continueButtonController() {
    switch (_activeStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          error = false;
          _activeStep += 1;
        } else {
          error = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          error = false;
          _activeStep += 1;
        } else {
          error = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          error = false;
          formCompleted();
        } else {
          error = true;
        }
        break;
    }

    // Check if the current step is the last step
    if (_activeStep >= allSteps!.length) {
      _activeStep = allSteps!.length - 1;
    }
  }

  void formCompleted() {
    debugPrint("Values = {$name---$mail---$password}");
  }
}
