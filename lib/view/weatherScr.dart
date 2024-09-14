import 'package:firebasedemo/StorageHelper/storage_helper.dart';
import 'package:firebasedemo/view/WLoginScreen.dart';
import 'package:firebasedemo/viewModel/currentWeatherVM.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  const WeatherScreen(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    print('latt ${widget.latitude}\n longgg ${widget.longitude}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Weather"),
      //   backgroundColor: Colors.blue,
      //   centerTitle: true,
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         StorageHelper().cleandata();
      //         Get.to(() => WLoginScreen());
      //       },
      //       child: Icon(
      //         Icons.logout,
      //         size: 35,
      //         color: Colors.white,
      //       ),
      //     ),
      //     SizedBox(
      //       width: 20,
      //     ),
      //   ],
      // ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) =>
            WeatherProvider()..getweatherVM(widget.latitude, widget.longitude),
        child: Consumer<WeatherProvider>(
            builder: (BuildContext context, currweatherprov, Widget? child) {
          return currweatherprov.isloading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Stack(children: [
                  // Positioned.fill(
                  //   child: Container(
                  //     child: Image.asset(
                  //       "assest/image/w7.png",
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120, top: 50),
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "Weather ",
                            style: TextStyle(
                                fontSize: 35,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              StorageHelper().cleandata();
                              Get.to(() => WLoginScreen());
                            },
                            child: Icon(
                              Icons.logout,
                              size: 35,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            currweatherprov.cityName,
                            style: TextStyle(
                                fontSize: 35,
                                color: const Color.fromARGB(255, 27, 2, 255),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            Jiffy.now().yMMMMEEEEdjm,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("assest/image/wwwww.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${currweatherprov.weatherModelList.data?.currentWeather?.temperature.toString() ?? ""}, ${currweatherprov.weatherModelList.data?.currentWeatherUnits?.temperature.toString() ?? ""}",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: const Color.fromARGB(255, 1, 47, 252),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Center(
                          child: Text(
                            "Wind Speed: ${currweatherprov.weatherModelList.data?.currentWeather?.windspeed.toString() ?? ""}, ${currweatherprov.weatherModelList.data?.currentWeatherUnits?.windspeed.toString() ?? ""}",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
        }),
      ),
    );
  }
}
