class Student{
int id=0;
String firstName="";
String lastName="";
int grade=0;
String image="";
String _status="";

Student.withId(int id,String firstName,String lastName,int grade,String image){
this.id=id;
this.firstName=firstName;
this.lastName=lastName;
this.grade=grade;
this.image=image;
}
Student(String firstName,String lastName,int grade,String image){
this.firstName=firstName;
this.lastName=lastName;
this.grade=grade;
this.image=image;
}

//getter setter

String get getFirstName{
return "OGR - "+ this.firstName;
}

void set setFirstName(String value){
this.firstName=value;
}

String get getStatus{
String message="";
    if(this.grade>=50){
      message="Geçti";
    }else if(this.grade>=40){
      message="Bütünlemeye kaldı";
    }else{
      message="Kaldı";
    }
    return message;
}

}