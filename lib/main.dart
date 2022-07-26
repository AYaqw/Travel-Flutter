import 'package:app3/Screens/trip_detail_screen.dart';

import './Screens/Categories_Screen.dart';
import './Screens/Category_Trips_Screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Demo',
      localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales:const [
      Locale('ar', 'AE'),
    // Locale('en', ''), // English, no country code
    // Locale('es', ''), // Spanish, no country code
  ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        // fontFamily: 
        textTheme: ThemeData.light()
        .textTheme.copyWith(
          headline5:const TextStyle(
            color: Colors.blue,
            fontSize: 24,
            // fontFamily: 
            fontWeight: FontWeight.bold,
          ),
          headline6:const TextStyle(
            color: Colors.white,
            fontSize: 26,
            // fontFamily: 
            fontWeight: FontWeight.bold,
          )
        )
      ),
      // home:const CategriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(ctx)=>const CategriesScreen(),
        CategoryTripsScreen.screenRouts:(ctx)=>  CategoryTripsScreen(),
        TripDetailScreen.screenRouts:(ctx)=> TripDetailScreen(),
      }
    );
  }
}

//!------------------------------ 
/*import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo, //color
          title: const Text("App Bar"), //title
          /*bottom: const TabBar(
            tabs: [
              Tab(text: "1>>statas"),
              Tab(text: "2>>chats"),
              Tab(text: "3>>statas"),
              Tab(text: "4>>chats"),
            ], //tabs
          ),*/ //TabBar
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.east_sharp),
                    onPressed: () {
                      // ignore: avoid_print
                      print("Search");
                    },
                  ), //sreach
                ), //Expanded
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      print("Search");
                    },
                  ), //sreach
                ), //Expanded
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // ignore: avoid_print
                      print("Search");
                    },
                  ), //sreach
                ), //Expanded
              ],
            ), //Container
          ), // bottom -referredSize

          leading: IconButton(
            icon: const Icon(Icons.menu),
            // ignore: avoid_print
            onPressed: () {
              print("on press");
            }, //menu to open drower ???
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('This is a snackbar')));
          ), //leading
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search");
              },
            ), //sreach
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {
                print("notifications");
              },
            ), //notion
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  // value: MenuItem.item1,
                  child: Text('Item-1'),
                  // >>> https://www.youtube.com/watch?v=kL5WrxyexzA&list=PL1WkZqhlAdC_MPQBXUFwAHviZ3XkWPDBG&index=2
                ),
                PopupMenuItem(child: Text('Item-2')),
                PopupMenuItem(child: Text('Item-3')),
                PopupMenuItem(child: Text('Item-4')),
              ],
            ), //PopupMenuButton
          ], //actions
        ),
        /*body: const TabBarView(
          children: [
            Center(child: Text("Tab1")), //widgit
            Center(child: Text("Tab1")), //widgit
            Center(child: Text("Tab1")), //widgit
            Center(child: Text("Tab1")), //widgit
            Container(
              child: Text("Container"),
            )
          ],
        ),*/ //TabBarView,
        drawer: const NavigationDrawer(), //Drawer
      ),
    );
  }
}

//>>>>>>>>>>>NavigationDrawer
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(),
              buildMenuItems(),
            ],
          ), //Column
        ), // SingleChildScrollView
      ); //Drawer
}

//>>>>>>>>>>>buildHeader
// ignore: camel_case_types
class buildHeader extends StatelessWidget {
  const buildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.blue.shade700,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          ), //CircleAvatar
          SizedBox(height: 12),
          Text("sarah Abs",
              style: TextStyle(fontSize: 28, color: Colors.white)),
          Text(
            "sarah@.com",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          )
        ],
      ) //Column
      );
}

//>>>>>>>>>>>buildMenuItems
class buildMenuItems extends StatelessWidget {
  const buildMenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () {
                // ignore: avoid_print
                print("Home");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyApp(), //const HomePage(),
                ));
              },
            ), //ListTile-1
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favorite"),
              onTap: () {
                // ignore: avoid_print
                print("favorite");
                Navigator.pop(context);
              },
            ), //ListTile-2
            ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text("Workflow"),
              onTap: () {
                // ignore: avoid_print
                print("Workflow");
              },
            ), //ListTile-3
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text("Update"),
              onTap: () {
                // ignore: avoid_print
                print("update");
              },
            ), //ListTile-4
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: const Text("Plugins"),
              onTap: () {
                // ignore: avoid_print
                print("Plugins");
              },
            ), //ListTile-5
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text("Home"),
              onTap: () {
                // ignore: avoid_print
                print("Home");
              },
            ), //ListTile-6
          ],
        ), //Column>>wrap
      ); //container

}*/
