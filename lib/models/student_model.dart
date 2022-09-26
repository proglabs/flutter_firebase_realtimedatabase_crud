class Student{
  String? key;
  StudentData? studentData;

  Student({this.key,this.studentData});
}

class StudentData{
  String? name;
  String? age;
  String? subject;

  StudentData({this.name,this.age,this.subject});

  StudentData.fromJson(Map<dynamic,dynamic> json){
    name = json["name"];
    age = json["age"];
    subject = json["subject"];
  }
}