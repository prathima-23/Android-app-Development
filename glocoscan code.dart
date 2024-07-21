import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glucoscan',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterBluePlus flutterBlue = FlutterBluePlus();
  List<ScanResult> scanResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glucoscan'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            _showBluetoothDevicesDialog();
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.bluetooth),
        ),
      ),
    );
  }

  Future<void> _showBluetoothDevicesDialog() async {
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        scanResults = results;
      });
    });

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nearby Bluetooth Devices'),
          content: SingleChildScrollView(
            child: Column(
              children: scanResults.map((result) {
                return ListTile(
                  title: Text(result.device.name),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      await result.device.connect();
                      // Data transfer logic here
                      // ...
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Connected to ${result.device.name}'),
                        ),
                      );
                    },
                    child: Text('Connect'),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}