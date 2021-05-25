
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_flite/Courses.dart';

class DBHelper{
  static final DBHelper _instance=DBHelper.internal();
  DBHelper.internal();
  factory DBHelper()=>_instance;
  static Database _db ;
 Future<Database> createDB() async{
    if(_db !=null){
      return _db;
    }
    //Path ,name of DB data/database/courses.db
    String path=join(await getDatabasesPath(),"courses.db");
    _db =await openDatabase(path,version: 1,onCreate:(Database db,int version) {
        db.execute("create table course(id integer primary key autoincrement ,title varchar(60),content varchar(200),hours integer)");
         }, );
    return _db;
  }

  Future<int> insertCourse(Course course)async{
   Database db=await createDB();
//   db.rawInsert(sql);
   return db.insert("course", course.toMap());
 }

 Future<List> allCourses()async{
   Database db=await createDB();
   return db.query("course" );
 }

  Future<int>  delete(int id)async{
   Database db=await createDB();
   return db.delete("course",where: 'id = ?',whereArgs: [id]);
 }

}

