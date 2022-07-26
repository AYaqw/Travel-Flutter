import 'package:app3/Widgets/CategreyCard.dart';
import '../data.dart';
import 'package:flutter/material.dart';

class CategriesScreen extends StatelessWidget {
  const CategriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CategriesScreen"),centerTitle: true,),
      body:GridView(
        padding:const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,
        childAspectRatio: 7/8,
        mainAxisSpacing: 10),
        children: categoriesData.map((e) => CategertCard(imageUrl: e.imageUrl,title: e.title,id:e.id)).toList()
        ),
  );
  }
}