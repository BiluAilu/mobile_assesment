import 'package:assessment/core/constants/app_colors.dart';
import 'package:assessment/feature/todo/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



 void showBottomSheet(BuildContext context) {
  TextEditingController titletextEditingController=TextEditingController();
  // TextEditingController titletextEditingController=TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return  Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
          child:  Column(
            children: [

              Text("Add New Todos"),
              Text("Title"),
              TextField(),
              Text("Description"),
              TextField(),
              Row(children: [

               GestureDetector(
                
                child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8)
                ),
               child: Text("Save")
               
               ,
               ),
               
               ),
               GestureDetector(
                onTap: () =>   BlocProvider.of<TodoBloc>(context).add( InsertTodosEvent(title: titletextEditingController.text)),
                child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(8)
                ),
               child: Text("Save"),
               ),
               
               )


               
               
              ],)

            ],
          ),
        );
      },
    );
  }