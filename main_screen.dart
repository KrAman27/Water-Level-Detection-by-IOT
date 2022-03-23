import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('level');
  double maxVal = 0.0;
  @override
  Widget build(BuildContext context) {
    final mediaQueryObject = MediaQuery.of(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Water level measure',
            ),
          ),
          body: StreamBuilder<DatabaseEvent>(
            stream: ref.onValue,
            builder: (context, event) {
              if (event.connectionState == ConnectionState.active) {
                double percentFilled =
                    (double.parse(event.data!.snapshot.value.toString()) /
                        1023)*100;
                return Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: mediaQueryObject.size.width * 0.05),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.shade200,
                          Colors.green.shade200,
                          const Color(0xFFD9EAE4),
                          const Color(0xFFD9EAE4),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.0,
                          double.parse(event.data!.snapshot.value.toString()) /
                              1023.0,
                          double.parse(event.data!.snapshot.value.toString()) /
                              1023.0,
                          1.0
                        ],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        percentFilled.toStringAsPrecision(2),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mukta',
                          fontWeight: FontWeight.w500,
                          fontSize: mediaQueryObject.size.width * 0.1,
                        ),
                      ),
                    ),
                    width: mediaQueryObject.size.width * 0.6,
                    height: mediaQueryObject.size.height * 0.67,
                  ),
                );
              } else {
                return Center(
                  child: Text(event.connectionState.name),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}