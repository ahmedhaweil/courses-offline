
class Course{
  int _id;
  String _title;
  String _content;
  int _hours;

  Course(Map<String,dynamic> data){
    _id=data["id"];
    _title=data["title"];
    _content=data["content"];
    _hours=data["hours"];
  }

  Course.fromMap(Map<String,dynamic> data){
    _id=data["id"];
    _title=data["title"];
    _content=data["content"];
    _hours=data["hours"];
  }

  Map<String,dynamic> toMap()=>{"id":_id,"title":_title,"content":_content, "hours":_hours};

  int get hours =>  _hours;

  String get content => _content;

  String get title => _title;

  int get id => _id;

}