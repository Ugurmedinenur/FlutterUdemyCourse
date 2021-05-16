import 'package:films_app_with_sqlite/FilmsPage.dart';
import 'package:films_app_with_sqlite/Kategoriler.dart';
import 'package:films_app_with_sqlite/KategorilerDao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
      ),
      body: FutureBuilder<List<Kategoriler>>(
        future:getCategories() ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            var categoryList = snapshot.data;
            return ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context,index){
                var category = categoryList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmsPage(category: category,)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.kategori_ad,),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else{
            return Center();
          }
        },
      ),
    );
  }

  Future<List<Kategoriler>> getCategories() async{
    var categoryList = await KategorilerDao().allCategories();
    return categoryList;
  }
}
