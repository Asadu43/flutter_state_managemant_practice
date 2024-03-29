import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_managemant_practice/api_response/GetDataApiResponse.dart';
import 'package:flutter_state_managemant_practice/providers/data_provider.dart';
import 'package:provider/provider.dart';

class GetListPage extends StatefulWidget {
  const GetListPage({Key? key}) : super(key: key);

  @override
  State<GetListPage> createState() => _GetListPageState();
}

class _GetListPageState extends State<GetListPage> {

  late final getDataFuture;
  @override
  void initState() {
    getDataFuture = context.read<DataProvider>().getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: InkWell(
          onTap: (){

            context.read<DataProvider>().data = [Data(name: "name", phone: "phone", address: "address"), ...context.read<DataProvider>().data];
          },
          child: Icon(Icons.add)),
      body: SizedBox(
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
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ),
    );
  }
}
