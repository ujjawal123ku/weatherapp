import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo/cubit/app_cubits.dart';




class wlcome_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     backgroundColor: Colors.deepPurple.shade300,
      body: Container(
        margin: EdgeInsets.only(top: 500),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Text('Welcome to your app!'),


              ),
              SizedBox(height: 30,),
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    BlocProvider.of<AppCubits>(context).getData();

                  },
                  child: Text("Start"),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
