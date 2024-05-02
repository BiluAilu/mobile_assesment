import 'package:assessment/feature/todo/presentation/bloc/bloc.dart';
import 'package:assessment/injection_container.dart';
import 'package:assessment/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const MyApp());
// }


void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TodoBloc>(
        create: (_) => sq <TodoBloc>(),
      ),
    ],
    child:  MyApp(),
  ));
 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage());
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      
    );
  }
}