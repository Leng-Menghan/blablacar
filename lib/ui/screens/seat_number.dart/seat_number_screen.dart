import '../../widgets/actions/back_bla_button.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class SeatNumberScreen extends StatefulWidget {
  final int preSeat;
  const SeatNumberScreen({super.key, required this.preSeat});

  @override
  State<SeatNumberScreen> createState() => _SeatNumberScreenState();
}

class _SeatNumberScreenState extends State<SeatNumberScreen> {
  late int seat;
  
  @override
  void initState(){
    super.initState();
    seat = widget.preSeat;
  }

  void onAdd(){
    setState(() {
      seat++;
    });
  }
  
  void onMinus(){
    setState(() {
      seat--;
    });
  }

  void onNext(){
    Navigator.pop<int>(context, seat);
  }

  Function()? get isMinusActive => seat == 1 ? null : onMinus;
  Color get disableColor => seat == 1 ? BlaColors.disabled : BlaColors.primary;

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
              "Number of seats to book",
              style: BlaTextStyles.heading.copyWith(color: BlaColors.neutralDark),
            ),
            const SizedBox(height: BlaSpacings.s,),
            Row(
              children: [
                GestureDetector(
                  onTap: isMinusActive,
                  child: Icon(Icons.remove_circle_outline, color: disableColor, size: 28,),
                ),
                Spacer(),
                Text(
                  seat.toString(),
                  style: BlaTextStyles.heading.copyWith(color: BlaColors.neutralDark),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: Icon(Icons.add_circle_outline, color: BlaColors.primary, size: 28,),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: onNext,
        backgroundColor: BlaColors.primary,
        shape: CircleBorder(),
        child: Icon(Icons.arrow_forward, color: BlaColors.white, size: 20,),
      ),
    );
  }
}