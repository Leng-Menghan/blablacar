import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class BackBlaButton extends StatelessWidget {
  const BackBlaButton({super.key});

  void onBack(BuildContext context){
    Navigator.pop(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onBack(context), 
      child: Icon(Icons.clear, color: BlaColors.primary)
    );
  }
}