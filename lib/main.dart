import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:speed_dial/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(),


      // helps to  specify intial routes
      initialRoute: "/next",

      routes: {
        "/" : (context)=>MyHomePage(),
        "/next" :(context) => Home()

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void getData()async{

    // username response
 await    Future.delayed(Duration(seconds: 4),(){
      print("done");
    });

    // bio 
  await   Future.delayed(Duration(seconds: 2),(){
      print("founder");
    });
  }

  Map student = {"name" : "alok", "age": "21"};

  var controller = PageController();
  int currentPage = 0;
  final List ImageList = [
    "assets/1st.png",
    "assets/2.png",
    "assets/3rd.png",
    "assets/1024.png",
    "assets/bookmark.png",
    "assets/comment.png",
    "assets/download.png",
    "assets/google.png",
    "assets/hello.png",
    "assets/logo.png",
    // "assets/1024.png",
    // "assets/1024.png",
    ];
    @override
    void initState() {
      super.initState();
      print(student["name"]);
      getData();
      controller.addListener(() { 
        setState(() {
          
        currentPage=controller.page!.toInt();
          
        });
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tinder"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/next");
          }, icon: Icon(Icons.next_plan))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
      
              child: Container(
                height: 50,
                width: 100,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("${currentPage+1}/${ImageList.length}", style: TextStyle(color: Colors.black38,fontSize: 16, fontWeight: FontWeight.w400),)),
                ))),
            Expanded(child: PageView.builder(
              controller: controller,
              itemCount: ImageList.length,
              itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 160),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.amber,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(80),
                    child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageList[index]),))),
                  ),
                  ),
              )))),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        curve: Curves.bounceInOut,
        icon: Icons.menu,

        overlayColor: Colors.white10,
        children: [
          SpeedDialChild(
            label: "Call",
            backgroundColor: Colors.blue,
            onTap: () {
              print("call");
            },
            child: Icon(Icons.call)),
          SpeedDialChild(
            label: "Tweet",
            backgroundColor: Colors.blue,
            onTap: () {
              print("tweet");
            },
            child: Icon(Icons.add)),
          SpeedDialChild(
            label: "post",
            backgroundColor: Colors.blue,
            onTap: () {
              print("post");
            },
            child: Icon(Icons.post_add)),
        ],
        // animatedIcon: AnimatedIcons.close_menu
        ),
    );
  }
}



