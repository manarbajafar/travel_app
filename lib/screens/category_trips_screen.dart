import 'package:flutter/material.dart';
import 'package:travel/app_data.dart';
import 'package:travel/models/trip.dart';
import 'package:travel/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const String screenRoute = '/category-trips';

  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String categoryTitle;
  List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

// We used it because  initState() did not work because it had a "context"
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArugment =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArugment['id'];
    categoryTitle = routeArugment['title'];
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            id: displayTrips[index].id,
            //removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
