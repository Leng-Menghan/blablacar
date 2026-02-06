import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/services/rides_service.dart';

void main() {
  List<Ride> rides = RidesService.filterBy(    
    departure: Location(name: "Dijon", country: Country.france),
    seatRequested :2
  );
  print(rides.length);
}
