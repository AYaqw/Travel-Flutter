import 'package:app3/Screens/trip_detail_screen.dart';
import 'package:flutter/material.dart';

import '../Models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
  });
// Winter,Spring,Summer,Autumn,
  //Exploration,Recovery,Activities,Therapy,
  String get SeasonText {
    switch (season) {
      case Season.Autumn:
        return 'خريف';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Winter:
        return 'شتاء';
        break;
      default:
        return "غير معرف";
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشافية';
        break;
      case TripType.Recovery:
        return 'ُثقافية';
        break;
      case TripType.Activities:
        return 'انشطة';
        break;
      case TripType.Therapy:
        return 'معالجه';
        break;
      default:
        return "غير معرف";
    }
  }

  void selectTrip(context) {
    Navigator.of(context).pushNamed(TripDetailScreen.screenRouts,arguments:id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(imageUrl,
                  width: double.infinity, height: 250, fit: BoxFit.cover),
            ),
            Container(
                height: 250,
                alignment: Alignment.bottomRight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [0.6, 1],
                )),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.fade,
                ))
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: Theme.of(context).accentColor,
                    ),
                    Text("$duration ايام"),
                  ],
                ),
                const SizedBox(width: 6),
                Row(
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Theme.of(context).accentColor,
                    ),
                    Text("$SeasonText"),
                  ],
                ),
                const SizedBox(width: 6),
                Row(
                  children: [
                    Icon(
                      Icons.family_restroom,
                      color: Theme.of(context).accentColor,
                    ),
                    Text("$tripTypeText"),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
