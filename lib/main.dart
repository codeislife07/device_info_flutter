import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Device Information'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Map<String, dynamic> data={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(var i in data.entries)
              Column(
                children: [
                  Text("${i.key}=${i.value}"),
                  Divider()
                ],
              ),
            SizedBox(height: 20,),
           FilledButton(onPressed: (){
             getDeviceInfo();
           }, child: Text("Get Data"))
          ],
        ),
      ),
    );
  }

  getDeviceInfo() async{
   var informatin=Platform.isAndroid?await deviceInfo.androidInfo:await deviceInfo.iosInfo;
   print(informatin.data);
   data=informatin.data;
   setState(() {

   });
  }
}
