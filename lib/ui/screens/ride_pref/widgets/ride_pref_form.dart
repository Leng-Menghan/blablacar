import 'package:flutter/material.dart';
 
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/date_time_util.dart';
import '../../../../ui/theme/theme.dart';
import '../../../../ui/widgets/actions/bla_button.dart';
import '../../../../ui/widgets/display/bla_divider.dart';
 
///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;



  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO 
    departure = Location(name: "London", country: Country.uk);
    arrival = Location(name: "Paris", country: Country.france);
    departureDate = DateTime.now();
    requestedSeats = 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onSwitch(){
    Location? tmpA = arrival;
    setState(() {
      arrival = departure;
      departure = tmpA;
    });
  }

  void onTapDeparture() {

  }

  void onTapArrival() {

  }

  void onTapDepartureDate() {

  }

  void onTapRequestedSeats() {

  }

  void onSearch() {

  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  String get departureDisplay => departure != null ? "${departure!.name}, ${departure!.country.name}" : "Leaving from";
  String get arrivalDisplay => arrival != null ? "${arrival!.name}, ${arrival!.country.name}" : "Going to";
  String get departureDateDisplay => DateTimeUtils.formatDateTime(departureDate);
  String get requestedSeatsDisplay => requestedSeats.toString();
  bool get showSwitcher => departure != null || arrival != null ? true : false;

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  Widget _inputField({
    required IconData icon, 
    required String text,
    required VoidCallback onTap,
    bool isActive = true,
    bool isSwitchable = false
  }){
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: BlaColors.textLight,),
            const SizedBox(width: 7),
            Text(
              text,
              style: BlaTextStyles.body.copyWith(color: isActive ? BlaColors.textNormal : BlaColors.textLight),
            ),
            Spacer(),
            Visibility(
              visible: isSwitchable,
              child: IconButton(onPressed: onSwitch, icon: Icon(Icons.swap_vert, color: BlaColors.primary)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: BlaColors.disabled,
          width: 1
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
          bottom: Radius.circular(30)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _inputField(onTap: onTapDeparture, icon: Icons.location_on, text: departureDisplay, isActive: departure != null, isSwitchable: showSwitcher),
                BlaDivider(),
                _inputField(onTap: onTapArrival, icon: Icons.location_on, text: arrivalDisplay, isActive: arrival != null),
                BlaDivider(),
                _inputField(onTap: onTapDepartureDate, icon: Icons.calendar_month, text: departureDateDisplay),
                BlaDivider(),
                _inputField(onTap: onTapRequestedSeats, icon: Icons.person, text: requestedSeatsDisplay),   
              ],
            ),
          ),
          BlaButton(onPress: onSearch, label: "Search", isPrimary: true)  
        ]
      ),
    );
  }
}
