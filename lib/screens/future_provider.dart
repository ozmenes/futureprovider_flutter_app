import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/job.dart';

class MyFutureBuilder extends StatefulWidget {
  final String title;
  MyFutureBuilder({required this.title, Key? key}):super();
  @override
  _MyFutureBuilderState createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  //var order = CheeseBurger();
  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyJobModel>(
      initialData: MyJobModel(jobIs: 'not done yet!!'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title),centerTitle: true,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(35),
                child: Consumer<MyJobModel>(
                  builder: (context,myModel,child){
                    return Text('Job is ${myModel.jobIs}.',style: TextStyle(fontSize: 24));
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.red[200],
                child: Consumer<MyJobModel>(
                  builder: (context,myModel,child){
                    return RaisedButton(
                      child: Text('Check the Job'),
                      onPressed: (){
                        myModel.doJobIsDone();
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text('Job is still ${myModel.jobIs}.')));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<MyJobModel> someAsyncFunctionToGetMyModel()async{
  await Future.delayed(Duration(seconds: 2));
  return MyJobModel(jobIs: 'Done.');
}