import 'package:flutter/material.dart';

class InstragramPage extends StatefulWidget {
  const InstragramPage({super.key});

  @override
  State<InstragramPage> createState() => _InstragramPageState();
}

class _InstragramPageState extends State<InstragramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.camera_alt_outlined,
          size: 35,
        ),
        title: const Text(
          'Instragram',
          style: TextStyle(fontFamily: "Billabong", fontSize: 45),
        ),
        centerTitle: true,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 20),
          //   child: Icon(
          //     Icons.send,
          //     size: 35,

          //   ),
          // )

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assest/image/send-removebg-preview.png",
              height: 35,
              width: 35,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Stories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      color: const Color.fromARGB(255, 33, 243, 79),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            height: 80,
                            width: 80,
                            "assest/image/ggg.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.blue,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Your Story",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
