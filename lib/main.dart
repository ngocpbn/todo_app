import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/add_edit_task.dart';
import 'package:todo_app/screens/controllers/init_controllers/init_dependency.dart';
import 'package:todo_app/screens/general_task_listview.dart';
import 'package:todo_app/screens/my_home_page.dart';

Future<void> main() async {
  // use SQFlite as the db
  WidgetsFlutterBinding.ensureInitialized();
  // await DBHelper.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(
            name: "/inQueue",
            page: () => const GeneralTaskListview(),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: "/inProgress",
            page: () => const GeneralTaskListview(),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: "/finished",
            page: () => const GeneralTaskListview(),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: "/editAdd",
            page: () => const AddEditTask(),
            transition: Transition.leftToRightWithFade),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
