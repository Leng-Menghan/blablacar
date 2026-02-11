import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class BlaButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData? icon;
  final String label;
  final bool isPrimary;

  const BlaButton({
    super.key, 
    required this.onPress,
    this.icon,
    required this.label,
    required this.isPrimary
  });

  Color get backgroundColor => isPrimary ? BlaColors.primary : BlaColors.white;
  Color get foregroundColor => isPrimary ? BlaColors.white : BlaColors.primary;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: BlaColors.disabled,
            width: 1
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: foregroundColor, size: 18,),
            SizedBox(width: 7),
            Text(
              label, 
              style: BlaTextStyles.button.copyWith(color: foregroundColor),
            )
          ],
        )
      ),
    );
  }
}