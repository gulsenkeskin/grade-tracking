import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

//with ile StudentValidationMixin class ındaki methodlara erişebiliriz
class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withoutInfo();
  //formdaki değerlere erişebilmek için global key ekliyoruz
  //form durumu için bi taneformun key özelliğine bu oluşturduğumuz key değerini veririz anahtar üret
  var formKey=GlobalKey<FormState>(); //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni öğrenci ekle"),
        ),
        //container widget ekranda sağdan soldan boşluk koymayı sağlar
        body: Container(
          //her taraftan 20 boşluk bırak
          margin: EdgeInsets.all(20.0),
          //örn only kullanarak sadece belirli bir alandan boşluk bırakabiliriz
          //margin: EdgeInsets.only(top:20.0, right:20.0),
          child: Form(
            key:formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeNameField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    //input
    return TextFormField(
      //tasarım işlemleri için
      //hint text kullanıcıya hangi formatta veri girebileceğini göstermek için kullanılır
      decoration: InputDecoration(labelText: "Öğrenci adı: ", hintText: "Gülsen"),
      //validator ile bu form alanına ait validayon gerçekleştiririz
      //validasyon ilgili alana girilecek verinin formatının uygunluğudur
      validator: validateFirstName,
      //formda kaydet butonuna basıldığında onSaved evente tetiklenir
      onSaved: (String value) {
        //student.firstname kullanıcının girdiği değerdir
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      //tasarım işlemleri için
      //hint text kullanıcıya hangi formatta veri girebileceğini göstermek için kullanılır
      decoration:
          InputDecoration(labelText: "Öğrenci soyadı: ", hintText: "Keskin"),
      //validator ile bu form alanına ait validayon gerçekleştiririz
      //validasyon ilgili alana girilecek verinin formatının uygunluğudur
      validator: validateLastName,
      //formda kaydet butonuna basıldığında onSaved evente tetiklenir
      onSaved: (String value) {
        //student.firstname kullanıcının girdiği değerdir
        student.lastName = value;
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      //tasarım işlemleri için
      //hint text kullanıcıya hangi formatta veri girebileceğini göstermek için kullanılır
      decoration:
          InputDecoration(labelText: "Aldığı not: ", hintText: "100"),
      //validator ile bu form alanına ait validayon gerçekleştiririz
      //validasyon ilgili alana girilecek verinin formatının uygunluğudur
      validator: validateGradeName,
      //formda kaydet butonuna basıldığında onSaved evente tetiklenir
      onSaved: (String value) {
        //student.firstname kullanıcının girdiği değerdir
        student.grade =int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
        onPressed: (){
        //onSavedları burada harekete geçiririz
          //formdaki alanlar validate işlemini geçerse formKey.currentState.validate() true döner
          //Bu Formun soyundan gelen her Form Alanını doğrular ve hata yoksa true değerini döndürür.
          // Sonuçları bildirmek için form yeniden oluşturulur
          if(formKey.currentState.validate()){
            //form içerisindeki onSaved alanlarını çalıştırır
            //Bu Formun soyundan gelen her Form Alanını kaydeder.
            formKey.currentState.save();
            saveStudent();
          }

      }
    );

  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
