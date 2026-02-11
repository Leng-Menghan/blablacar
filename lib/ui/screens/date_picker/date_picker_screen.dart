import 'package:flutter/material.dart';
import '../../../ui/widgets/display/bla_divider.dart';
import '../../theme/theme.dart';
import '../../widgets/actions/back_bla_button.dart';
import 'widgets/monthly_calendar.dart';

class DatePickerScreen extends StatelessWidget {
  final DateTime date;
  const DatePickerScreen({super.key, required this.date});

  Widget dayOfTheWeek(){
    List<String> customWeekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: 
          customWeekDays.map((d) => Expanded(
            child: Text(
              d,
              style: BlaTextStyles.body.copyWith(color: BlaColors.neutralDark),
              textAlign: TextAlign.center,
            )
          )).toList()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackBlaButton(),
            const SizedBox(height: BlaSpacings.s,),
            Text(
              "When are you going",
              style: BlaTextStyles.heading.copyWith(color: BlaColors.neutralDark),
            ),
            dayOfTheWeek(),
            BlaDivider(),
            Expanded(
              child: ListView.builder(
                itemCount: 13,
                shrinkWrap: true, 
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  DateTime firstDay = DateTime(DateTime.now().year, DateTime.now().month + index, 1);
                  DateTime lastDay = DateTime(DateTime.now().year, DateTime.now().month + index + 1, 0);
                  return MonthlyCalendar(firstDay: firstDay, lastDay: lastDay, selectedDate: date);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

