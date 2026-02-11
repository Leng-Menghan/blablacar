import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../theme/theme.dart';

class MonthlyCalendar extends StatelessWidget {
  const MonthlyCalendar({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.selectedDate,
  });

  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat(firstDay.year == DateTime.now().year ? "MMMM":"MMMM yyyy").format(firstDay),
            style: BlaTextStyles.heading.copyWith(color: BlaColors.neutralDark),
          ),
          TableCalendar(
            firstDay: firstDay,
            lastDay: lastDay,
            focusedDay: firstDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: false,
            availableGestures: AvailableGestures.none,
            daysOfWeekVisible: false,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              selectedDecoration: BoxDecoration(
                color: BlaColors.primary,  
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: BlaColors.neutralLight,
                  width: 2
                )
              ),
              todayTextStyle: BlaTextStyles.body
            ),
            selectedDayPredicate: (day){
              return isSameDay(day, selectedDate);
            },
            enabledDayPredicate: (day) {
              DateTime now = DateTime.now();
              DateTime today = DateTime(now.year, now.month, now.day);
              return day.isAfter(today);
            },
            onDaySelected: (selectedDay, focusedDay){
              Navigator.pop<DateTime>(context, selectedDay);
            },
          )
        ],
      ),
    );
  }
}