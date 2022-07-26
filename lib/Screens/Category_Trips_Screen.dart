import '../Widgets/trip_item.dart';

import '../data.dart';
import 'package:flutter/material.dart';
class CategoryTripsScreen extends StatelessWidget {
  static const screenRouts='/category-trips';
  //   final String categoryid;
  //   final String categorytitle;

  // const CategoryTripsScreen({ required this.categoryid,required this.categorytitle}); 


  @override
  Widget build(BuildContext context) {
    final routArg=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final categoryid=routArg['id'];
    final categorytitle=routArg['title'];
    final filterdTrips=trips_data.where((trip){
        return trip.categories.contains(categoryid);
    }).toList();

    return Scaffold(appBar: AppBar(title:Text('$categorytitle') ,),
      body: ListView.builder(itemBuilder: (context,index){
          return TripItem(
            id:filterdTrips[index].id,
            title:filterdTrips[index].title,
            duration: filterdTrips[index].duration,
            imageUrl: filterdTrips[index].imageUrl,
            season: filterdTrips[index].season,
            tripType: filterdTrips[index].tripType,
            );
      },
      itemCount:filterdTrips.length ,
      ),
      
    );
  }
}