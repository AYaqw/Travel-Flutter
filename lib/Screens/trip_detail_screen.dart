import '../data.dart';
import 'package:flutter/material.dart';
class TripDetailScreen extends StatelessWidget {
  static const screenRouts="/details";
  const TripDetailScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final tripId=ModalRoute.of(context)!.settings.arguments as String ;
    final selectedTrip=trips_data.firstWhere((trip)=> tripId==trip.id);
    return Scaffold(
      appBar: AppBar(title: Text(selectedTrip.title)),
      body:  SingleChildScrollView(
        child: Column(
          children: [          
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedTrip.imageUrl,fit: BoxFit.cover,),
              ),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 15,vertical:10),
              alignment: Alignment.topRight,
              child: Text("الانشطة",style: Theme.of(context).textTheme.headline5,),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,border: Border.all(color:Colors.grey), borderRadius: BorderRadius.circular(10)),
              height: 200,
              padding:const EdgeInsets.all(10),
              margin:const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation:0.3 ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical:5),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 15,vertical:10),
              alignment: Alignment.topRight,
              child: Text("البرنامج اليومي",style: Theme.of(context).textTheme.headline5,),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,border: Border.all(color:Colors.grey), borderRadius: BorderRadius.circular(10)),
              height: 200,
              padding:const EdgeInsets.all(10),
              margin:const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => Card(
                  elevation:0.3 ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical:5),
                    child: Text(selectedTrip.program[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100,)
      
        ],),
      )
      );
  }
}