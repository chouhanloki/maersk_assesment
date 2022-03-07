import 'package:assesment/base/base_bloc.dart';
import 'package:assesment/core/injection_container/feed_injection_container.dart' as fIC;
import 'package:assesment/core/injection_container/post_injection_container.dart' as pIC;
import 'package:assesment/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await fIC.init();
  await pIC.init();
  Bloc.observer=BaseBloc();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
onGenerateRoute: Routes.generatedRoutes,
    );
  }
}
