import 'package:assessment/core/constants/app_colors.dart';
import 'package:assessment/feature/todo/presentation/bloc/bloc.dart';
import 'package:assessment/feature/todo/presentation/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is TodoInitial) {
          BlocProvider.of<TodoBloc>(context).add(const FetchTodosEvent());
        } else if (state is TodoInserted) {
          //Show snacbar
        } else if (state is TodoUpdated) {
          //Show snacbar
        } else if (state is TodoDeleted) {
          //Show snacbar
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400],
              ),
              height: 80,
              width: 30,
              child: Container(),
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apr 23, 2023",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text("Hello, "),
                      Text(
                        "Yohannese",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tody's Task",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(24)),
                          child: const Row(
                            children: [Icon(Icons.add), Text("New Task")],
                          ),
                        ),
                        onTap: () {
                          showBottomSheet;
                        }),
            
                  ]),
                    BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
                      if (state is TodoLoading || state is TodoInitial) {
                        BlocProvider.of<TodoBloc>(context).add(const FetchTodosEvent());
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primary,
                          ),
                        );
                      } 
                      else if (state is TodoListLoaded) {
                       return Expanded(
                          child: ListView.builder(
                              itemCount: state.todos.length,
                              itemBuilder: (context, index) {
                                final todo = state.todos[index];
                                // final todo = todoList[index];
                                return TodoCard(
                                  title: todo.title,
                                  isDone: todo.completed,
                                  desc: todo.title,
                                );
                              }),
                        );
                      } else if(state is TodoError){
                        return Text("Error has occured${state.message}");
                      }
                      
                      else {
                        print(state);
                          BlocProvider.of<TodoBloc>(context).add(const FetchTodosEvent());
                      
                        return const CircularProgressIndicator(
                          color: primary,
                        );
                      }
                    })
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
