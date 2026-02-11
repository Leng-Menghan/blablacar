import 'package:flutter/material.dart';
import '../../../../model/ride/locations.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/bla_divider.dart';

class LocationPickerTile extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;
  const LocationPickerTile({
    super.key,
    required this.location,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          onTap: onTap,
          title: Text(
            location.name,
            style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
          ),
          subtitle: Text(
            location.country.name,
            style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: BlaColors.iconLight, size: 16,),
        ),
        BlaDivider()
      ],
    );
  }
}