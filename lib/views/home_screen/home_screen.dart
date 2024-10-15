import 'package:flutter/material.dart';
import 'package:shared_prefs_sample_june/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController namecontroller = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await HomeScreenController.initSharedPrefs();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            HomeScreenController.getData();
            setState(() {});
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                    hintText: "Enter data", border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await HomeScreenController.addData(namecontroller.text);
                  },
                  child: Text("Store data")),
              Expanded(
                  child: Center(
                child: Text(HomeScreenController.data.toString()),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
