import 'package:chronicle/core/branding/config.dart';
import 'package:chronicle/core/firebase/firebase_options.dart';
import 'package:chronicle/features/authentication/presentation/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

const clientId = 'YOUR_CLIENT_ID';
const marcaId = 'client_a';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get the device's locale and set the language code dynamically
  final locale = WidgetsBinding.instance.platformDispatcher.locale;
  FirebaseAuth.instance.setLanguageCode(locale.languageCode);
  //FirebaseAuth.instance.setLanguageCode('es');

  final marca = BrandingConfig.getConfig(marcaId);

  runApp(PaginaPrincipal(marca: marca));
}
/*
class MyApp extends StatelessWidget {
  final BrandingConfig marca;
  const MyApp({super.key, required this.marca});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chronicle',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(title: marca.appName, marca: marca),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.marca});
  final String title;
  final BrandingConfig marca;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            
            widget.marca.logoMarca,

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/