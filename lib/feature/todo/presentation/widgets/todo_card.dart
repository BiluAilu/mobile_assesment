import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String? title;
  final String? desc;
  final String? date;
  final bool? isDone;
  const TodoCard(
      {super.key,
      required this.title,
       this.date="July 14, 2023",
      required this.desc,
       this.isDone=false});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    bool ischeck=widget.isDone!;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        // width: MediaQuery.of(context).size.width * 0.8,
        height: 120,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
             Container(
              color: const Color(0xFF3F51F3),
              width: 20,
            ),
            Expanded(
                child: Dismissible(
              background: Container(
                color: Colors.red, // Change background color here
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              key: const ObjectKey("d"),
              child: Container(
                  height: 120, color: Colors.white, child:  Column(
                    children: [
                     Center(
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text("${widget.title}"),
                        Text("${widget.desc}")
                          ],
                        ),
                        Checkbox(value: ischeck, onChanged: (value)
                        {

                          setState(() {
                            ischeck!=value;
                          });
                        })
                       ],),
                     )
                    ],
                  )),
            ))
          ],
        ));
  }
}
