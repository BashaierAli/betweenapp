import 'package:betweenapp/Home/notifiction.dart';
import 'package:betweenapp/Home/page1.dart';
import 'package:betweenapp/Home/page3.dart';
import 'package:betweenapp/Home/page4.dart';
import 'package:flutter/material.dart';
import 'Home/notifiction.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
  }




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Between ',

      theme: ThemeData(

        primaryColor: Colors.black,
      ),


      home:HomePage(),

    );
  }
}
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}



//مضمون  كلاس _HomePageState يتضمن فيه ايقونه البحث التي قمنا بااستدعاء الدالة المخصصة لها وايضا يتضمن ايقونة الاشعارات وصفحتها وايضا يحتوي على عناصر ال App Bar كما يتضمن شريط التنقل لايقونة للمحادثات والاعدادات والمفضلة والصفحة الرئسيسية التي بااسفل الصفحة
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  String title="Between";

  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
  }
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer:Drawer(
        child: ListView(
          children: [

            UserAccountsDrawerHeader(

               currentAccountPicture: CircleAvatar(child: Icon( Icons.account_box_outlined ),
      ),
              accountName:Text("Ahmed Ali") ,accountEmail: Text("Google@google.com"),
            ),


            ListTile(
              leading: Icon(Icons.info),
              title: Text("About us"),

            ),

            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),

            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[

          IconButton(icon: Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: DataSearch());


          },),

          IconButton(icon: Icon(Icons.notifications), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotifictionPage())
            );
          },
          ),


        ],

        elevation: 0.0,
      ),
      body:

      Center(
        child: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children:<Widget> [
            Page1(),
          Page3(),
          Page4(),
        ],
        ),
        ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.white,
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0.0),
          ),
          labelColor: Colors.pinkAccent,
          labelStyle: TextStyle(fontSize: 14.0),
          tabs:<Widget> [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),


            Tab(
              icon: Icon(Icons.chat),
              text: "Orders",
            ),
            Tab(
              icon: Icon(Icons.supervised_user_circle_outlined),
              text: "Account",
            ),

          ],
        ),
      ),

    );
  }
}



//   هذه الدالة الخاصة بالبحث بحيث قمت باانشاء عدة عناصر للبحث ومن ثم قمت بااستدعاءها في دالة _HomePageState في ابقونة البحث
class DataSearch extends SearchDelegate<String>{

  final categories=[
    "Pharmacy",
    "Beauty",
    "Medical",
    "Furniture",
    "School",
    "Builiding",
    "Food"
  ];
  final RecentsCategories =[
    "Medical",
    "Furniture",
    "School",
    "Builiding"
  ];




  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(icon: Icon(Icons.clear),onPressed:(){
        query="";
      } ,)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon:AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress:transitionAnimation,
        ) ,
        onPressed: (){
          close(context, "null");
        });

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // throw UnimplementedError();
    final suggetionsList =query.isEmpty?RecentsCategories:categories.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context, index) => ListTile(

      leading: Icon(Icons.location_city),
      title: RichText(text: TextSpan(
          text: suggetionsList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          children: [TextSpan(
              text: suggetionsList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
          )]
      )),
    ),
      itemCount: suggetionsList.length,
    );


  }
}

