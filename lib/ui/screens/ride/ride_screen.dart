import 'package:flutter/material.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../services/rides_service.dart';
import '../../../utils/date_time_util.dart';
import '../../theme/theme.dart';

class RideScreen extends StatelessWidget {
  final RidePref ridePref;
  const RideScreen({super.key, required this.ridePref});

  String get title => "${ridePref.departure.name} → ${ridePref.arrival.name}";
  String get subtitle => "${DateTimeUtils.formatDateTime(ridePref.departureDate)}, ${ridePref.requestedSeats} passenger${ridePref.requestedSeats>1? "s" : ""}";
  List<Ride> get rides => RidesService.filterBy(departure: ridePref.departure, seatRequested: ridePref.requestedSeats);

  void onBack(BuildContext context){
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                color: BlaColors.disabled,
                borderRadius: BorderRadius.circular(16)
              ),
              child: ListTile(
                onTap: (){},
                leading: GestureDetector(
                  onTap: () => onBack(context),
                  child: Icon(Icons.arrow_back_ios_new , color: BlaColors.textLight, size: 16,)
                ),
                title: Text(
                  title,
                  style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
                ),
                subtitle: Text(
                  subtitle,
                  style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
                ),
              ),
            ),
            const SizedBox(height: BlaSpacings.m,),
            Expanded(
              child: ListView.builder(
                itemCount: rides.length,
                itemBuilder: (context, index){
                  Ride ride = rides[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Location: ${ride.departureLocation.name} → ${ride.arrivalLocation.name}"),
                          Text("Date: ${DateTimeUtils.formatDateTime(ride.departureDate)}"),
                          Text("Time: ${DateTimeUtils.formatTime(ride.departureDate)} → ${DateTimeUtils.formatTime(ride.arrivalDateTime)}"),
                          Text("Driver: ${ride.driver.firstName} ${ride.driver.lastName}"),
                          Text("Availables Seats: ${ride.availableSeats}"),
                          Text("Price per Seat: ${ride.pricePerSeat}"),
                          Text("Status: ${ride.status.name}"),
                          Text("Passengers: ${ride.passengers.length}"),
                        ],
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}