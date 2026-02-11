import 'package:flutter/material.dart';
import 'widgets/location_picker_tile.dart';
import '../../../model/ride/locations.dart';
import '../../../dummy_data/dummy_data.dart';
import '../../theme/theme.dart';

class LocationPickerScreen extends StatefulWidget {
  final Location? location;
  const LocationPickerScreen({super.key, required this.location});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  TextEditingController searchController = TextEditingController();
  List<Location> resultLocation = [];

  @override
  void initState(){
    super.initState();
    if(widget.location != null){
      searchController.text = "${widget.location!.name}, ${widget.location!.country.name}";
      resultLocation = fakeLocations.where((l) => 
        l.name.toLowerCase().contains(widget.location!.name.toLowerCase()) || 
        l.country.name.toLowerCase().contains(widget.location!.country.name.toLowerCase())
      ).toList();
    }
  }

  void onTyping(String search){
    String keyword = search.toLowerCase();
    setState(() {
      resultLocation = search.isEmpty ? 
        [] 
        : 
        fakeLocations.where((l) => 
          l.name.toLowerCase().contains(keyword) || 
          l.country.name.toLowerCase().contains(keyword)
        ).toList();
    });
  }

  void onBack(){
    Navigator.pop(context);
  }

  void onClear(){
    searchController.clear();
    setState(() {
      resultLocation = [];
    });
  }

  void onTapLocation(Location location){
    Navigator.pop<Location>(context, location);
  }

  @override
  void dispose(){
    super.dispose();
    searchController.dispose();
  }

  bool get isShowClear => searchController.text.isEmpty ? false : true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: onTyping,
              textAlignVertical: TextAlignVertical.center,
              style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                filled: true,
                fillColor: BlaColors.disabled,
                hintText: "Station Road or The  Bridge Cafe",
                hintStyle: BlaTextStyles.body.copyWith(color: BlaColors.textLight),
                prefixIcon: GestureDetector(
                  onTap: onBack,
                  child: Icon(Icons.arrow_back_ios_new , color: BlaColors.textLight, size: 16,)
                ),
                suffixIcon: isShowClear ? GestureDetector(
                  onTap: onClear,
                  child: Icon(Icons.clear, color: BlaColors.textLight, size: 20,)
                ) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: BlaSpacings.m),
            Expanded(
              child: ListView.builder(
                itemCount: resultLocation.length,
                itemBuilder: (context, index) {
                  Location location = resultLocation[index];
                  return LocationPickerTile(
                    location: location,
                    onTap: () => onTapLocation(location),
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
