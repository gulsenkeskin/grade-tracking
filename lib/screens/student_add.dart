import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students =[];
  StudentAdd(List<Student> students){
    this.students=students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State {
  List<Student> students = [];
  var student = Student.withoutInfo();
  //formdaki değerlere erişebilmek için global key ekliyoruz
  //form durumu için bi taneformun key özelliğine bu oluşturduğumuz key değerini veririz anahtar üret
  var formKey = GlobalKey<FormState>(); //
  _StudentAddState(List<Student> students){
    this.students=students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni öğrenci ekle"),
        ),
        //container widget ekranda sağdan soldan boşluk koymayı sağlar
        body: Container(
          //her taraftan 20 boşluk bırak
          margin:const EdgeInsets.all(20.0),
          //örn only kullanarak sadece belirli bir alandan boşluk bırakabiliriz
          //margin: EdgeInsets.only(top:20.0, right:20.0),
          child: Form(
            key: formKey,
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
      decoration:const
          InputDecoration(labelText: "Öğrenci adı: ", hintText: "Gülsen"),
      //validator ile bu form alanına ait validayon gerçekleştiririz
      //validasyon ilgili alana girilecek verinin formatının uygunluğudur
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ad boş olamaz';
        }
        return null;
      },
      //formda kaydet butonuna basıldığında onSaved evente tetiklenir
      onSaved: (value) {
        //student.firstname kullanıcının girdiği değerdir
        student.firstName = value.toString();
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      //tasarım işlemleri için
      //hint text kullanıcıya hangi formatta veri girebileceğini göstermek için kullanılır
      decoration:
      const InputDecoration(labelText: "Öğrenci soyadı: ", hintText: "Keskin"),
      //validator ile bu form alanına ait validayon gerçekleştiririz
      //validasyon ilgili alana girilecek verinin formatının uygunluğudur
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Soyad boş olamaz';
        }
        return null;
      },
      //formda kaydet butonuna basıldığında onSaved evente tetiklenir
      onSaved: (value) {
        //student.firstname kullanıcının girdiği değerdir
        student.lastName = value.toString();
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      //tasarım işlemleri için
      //hint text kullanıcıya hangi formatta veri girebileceğini göstermek için kullanılır
      decoration:const InputDecoration(labelText: "Aldığı not: ", hintText: "100"),
      //validator ile bu form alanına ait validayon gerçekleştiririz
      //validasyon ilgili alana girilecek verinin formatının uygunluğudur
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Not alanı boş olamaz';
        }else if (int.parse(value) < 0 || int.parse(value) > 100) {
          return "Not 0-100 arasında olmalıdır";
        }
        return null;
      },
      //formda kaydet butonuna basıldığında onSaved evente tetiklenir
      onSaved: (value) {
        //student.firstname kullanıcının girdiği değerdir
        student.grade = int.parse(value.toString());
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        child: const Text("Kaydet"),
        onPressed: () {
          //onSavedları burada harekete geçiririz
          //formdaki alanlar validate işlemini geçerse formKey.currentState.validate() true döner
          //Bu Formun soyundan gelen her Form Alanını doğrular ve hata yoksa true değerini döndürür.
          // Sonuçları bildirmek için form yeniden oluşturulur
          if (formKey.currentState!.validate()) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //  const SnackBar(content: Text('Processing Data')),
            //);
            //form içerisindeki onSaved alanlarını çalıştırır
            //Bu Formun soyundan gelen her Form Alanını kaydeder.
            formKey.currentState!.save();
            setState(() {
              students.add(student);
            });
            saveStudent();
            //bi önceki sayfaya döner
            Navigator.pop(context);
          }
        });
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
