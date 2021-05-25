import 'package:flutter/material.dart';
import 'package:sql_flite/DBHelper.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({Key key}) : super(key: key);

  @override
  _AllCoursesState createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  DBHelper dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DBHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Courses"),),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: dbHelper.allCourses(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }else{
              List courses=snapshot.data;
              return ListView.builder(
                itemCount: courses.length,
                  itemBuilder: (context, index) {
                  String title="${courses[index]["title"]}";
                  String content="${courses[index]["content"]}";
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text("${courses[index]["hours"]}"),
                      ),
                      title: Text(title),
                      subtitle: Text(content.length>40?content.substring(0,40):content),
                      trailing: IconButton(icon: Icon(Icons.delete_forever_outlined), onPressed: () {
                        setState(() {
                          dbHelper.delete(courses[index]["id"]);

                        });
                      },

                      ),
                    );
                  },
              );
            }
          },
        ),
      ),
    );
  }
}
