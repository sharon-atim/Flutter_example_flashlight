import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashlight App',
      theme: ThemeData(primarySwatch: Colors.lime),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashlight App'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () async {
            _turnOnFlash(context);
          },
          child: const Text('Turn on torch'),
        ),
        ElevatedButton(
          onPressed: () async {
            _turnOffFlash(context);
          },
          child: const Text('Turn off torch'),
        )
      ])),
    );
  }
}

Future<void> _turnOnFlash(BuildContext context) async {
  try {
    await TorchLight.enableTorch();
  } on Exception catch (_) {
    showErrorMessage('Unable to turn on torch', context);
  }
}

Future<void> _turnOffFlash(BuildContext context) async {
  try {
    await TorchLight.disableTorch();
  } on Exception catch (_) {
    showErrorMessage('Unable to disable torch', context);
  }
}

void showErrorMessage(String mes, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mes)));
}
