import '../Screens/Category_Trips_Screen.dart';
import 'package:flutter/material.dart';

class CategertCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategertCard(
      {Key? key, required this.title, required this.imageUrl, required this.id})
      : super(key: key);

  void slectCateger(context) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) =>  CategoryTripsScreen(),a),);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (c) => CategoryTripsScreen(id, title)),
    // );
    Navigator.of(context).pushNamed(CategoryTripsScreen.screenRouts,arguments:{
      'id':id,
      'title':title
    } );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => slectCateger(context),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: NetworkImage(imageUrl),
                height: 250,
                fit: BoxFit.cover,
              )),
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ))
        ],
      ),
    );
  }
}
