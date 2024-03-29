import 'package:flutter/material.dart';
import 'package:flutter_state_managemant_practice/providers/data_provider.dart';
import 'package:flutter_state_managemant_practice/services/add_data_api.dart';
import 'package:flutter_state_managemant_practice/services/get_data_api.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late final getDataFuture;
  @override
  void initState() {
    getDataFuture = context.read<DataProvider>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Practice"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SizedBox(
                            width: double.maxFinite,
                            child: FutureBuilder(
                                future: getDataFuture,
                                builder: (context, snapshot) {
                                  print(snapshot.connectionState);
                                  if(snapshot.hasError){
                                    return Text("Error");
                                  } else if(snapshot.connectionState == ConnectionState.done){
                                    return Consumer<DataProvider>(
                                        builder: (context, dataProv, child) {
                                          return ListView.builder(

                                            itemBuilder: (context, index) {
                                              return  Card(
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text("${dataProv.data[index].name}"),
                                                ),
                                              );
                                            },
                                            itemCount: dataProv.data.length,
                                            shrinkWrap: true,
                                          );
                                        }
                                    );

                                  }else{
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.menu_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(hintText: "Address"),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(hintText: "Phone Number"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await context.read<DataProvider>().addData(name: nameController.text, phoneNumber: phoneController.text, address: addressController.text);
                    nameController.clear();
                    phoneController.clear();
                    addressController.clear();
                  },
                  child: const Text("Add Data"))
            ],
          ),
        ),
      ),
    );
  }
}
