import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime threeMonthsAgo = DateTime(now.year, now.month - 3);
    DateTime twentyDaysLater = DateTime(now.year, now.month, now.day + 20);

    TimeOfDay currentTime = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Date/Time Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: threeMonthsAgo,
                  lastDate: twentyDaysLater,
                );

                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Select Date"),
            ),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                    context: context, initialTime: currentTime);

                if (pickedTime != null && pickedTime != selectedTime) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Select Time"),
            ),
            if (selectedDate != null)
              Text("Selected Date: ${selectedDate.toString()}"),
            if (selectedTime != null)
              Text("Selected Time: ${selectedTime.toString()}")
          ],
        ),
      ),
    );
  }
}
