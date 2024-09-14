import 'package:firebasedemo/Routers/routersName.dart';
import 'package:firebasedemo/Routers/routess.dart';
import 'package:firebasedemo/StorageHelper/storage_helper.dart';
import 'package:firebasedemo/viewModel/currenct_locator.dart';

import 'package:firebasedemo/viewModel/login_viewModel.dart';
import 'package:firebasedemo/viewModel/placeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'viewModel/currentWeatherVM.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlaceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrectLocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: PhotoView(),
        initialRoute: RoutersName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
