import 'package:firebasedemo/model/placeModel.dart';
import 'package:firebasedemo/utils/loadingIndecator.dart';
import 'package:firebasedemo/view/weatherScr.dart';
import 'package:firebasedemo/viewModel/currenct_locator.dart';
import 'package:firebasedemo/viewModel/placeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> locationNames = [
    "Delhi",
    'Lucknow',
    'Mumbai',
    'Kolkata',
    'Bihar',
    "Delhi",
    'Lucknow',
    'Mumbai',
    'Kolkata',
    'Bihar',
    "Delhi",
    'Lucknow',
    'Mumbai',
    'Kolkata',
    'Bihar'
  ];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Location"),
      //   backgroundColor: Colors.blue,
      //   centerTitle: true,
      // ),
      body: Stack(children: [
        Container(
          child: Positioned.fill(
            child: Image.asset(
              "assest/image/w6.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 0),
        //   child: Center(
        //     child: Container(
        //       child: Image.asset(
        //         height: 300,
        //         "assest/image/locationicon.png",
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Consumer<PlaceProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: TextFormField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Place',
                              hintStyle: TextStyle(
                                fontSize: 25,
                                fontWeight:
                                    FontWeight.bold, // Make hint text bold
                                color: Colors.black,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .black, // Color of the underline when focused
                                  width:
                                      2.0, // Thickness of the underline when focused
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight:
                                  FontWeight.bold, // Make input text bold
                              color: Colors.black,
                            ),
                            onChanged: (String placeName) {
                              print(placeName);
                              value.placeVM(placeName);
                            },
                          ),
                        ),
                      ),
                      Consumer<CurrectLocationProvider>(
                        builder: (BuildContext context, currentLocationProvider,
                            child) {
                          return GestureDetector(
                            onTap: () {
                              currentLocationProvider.getLanLong();
                            },
                            child: Container(
                              child: currentLocationProvider.isloading
                                  ? const CircularProgressIndicator(
                                      color: Colors.amber)
                                  : const Icon(
                                      Icons.my_location,
                                      size: 45,
                                      color: Colors.black,
                                    ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          value.placeModelList.data?.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        var place = value.placeModelList.data?.results?[index];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => WeatherScreen(
                                    latitude: value.placeModelList.data
                                            ?.results?[index].latitude ??
                                        0.0,
                                    longitude: value.placeModelList.data
                                            ?.results?[index].longitude ??
                                        0.0,
                                  ));
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                "assest/image/locationicon.png",
                                height: 50,
                                width: 40,
                              ),
                            ),
                            title: Text(
                              value.placeModelList.data?.results?[index].name ??
                                  locationNames[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              value.placeModelList.data?.results?[index]
                                      .country ??
                                  "",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
