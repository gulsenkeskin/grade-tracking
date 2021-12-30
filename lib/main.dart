import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';

void main() {
  //MaterialApp material standartlarında bir çalışma ortamı kurar ve ona göre sistemin konfigürasyonunu gerçekleştirir
  runApp(MaterialApp(
      //home çalışacak olan kod bloğu
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent=Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1,"Gülsen", "Keskin", 100,
        "https://i.stack.imgur.com/7w3YO.jpg?s=192&g=1"),
    Student.withId(2,"Mümin", "Zehir", 100,
        "https://fts.tvoip.turkcell.com.tr/scontent/avatar/p2p/529/fed7ef98d2a048d2de5ec0848bde1827_tmb.jpg?v=1640859797673"),
    Student.withId(
        3,"Nihal", "Hizal", 100, "https://instagram.fist13-1.fna.fbcdn.net/v/t51.2885-19/s320x320/250136504_1758171721043759_9102911073553762406_n.jpg?_nc_ht=instagram.fist13-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=VojJ03FMWIwAX_Y4QVa&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT88UPyVqes5oZ6FJsVDBCS7zmj5RxkokIjO-BIt05IzpA&oe=61D56CB6&_nc_sid=7bff83"),
    Student.withId(4,"Eda", "Yıldız", 20,
        "https://lh3.googleusercontent.com/proxy/Y2fXn7Xcp_ODSJAPMYHW5G_BrCT6WOCLmNaAM9CS7HczzsoGkTzRxHdP3T2rgeRWD12IVXpgzBNMfT8AwnMFHq-F-DZJh-n5bFBPs_pMIk3yDmoXbomieYr9oLPcZmC3qVfsTZNyp_G83IXhs4nb-1Um"),
    Student.withId(1,"Buse", "Yıldız", 70,
        "https://lh3.googleusercontent.com/proxy/Y2fXn7Xcp_ODSJAPMYHW5G_BrCT6WOCLmNaAM9CS7HczzsoGkTzRxHdP3T2rgeRWD12IVXpgzBNMfT8AwnMFHq-F-DZJh-n5bFBPs_pMIk3yDmoXbomieYr9oLPcZmC3qVfsTZNyp_G83IXhs4nb-1Um"),
    Student.withId(1,"Elif", "Yıldız", 40,
        "https://lh3.googleusercontent.com/proxy/Y2fXn7Xcp_ODSJAPMYHW5G_BrCT6WOCLmNaAM9CS7HczzsoGkTzRxHdP3T2rgeRWD12IVXpgzBNMfT8AwnMFHq-F-DZJh-n5bFBPs_pMIk3yDmoXbomieYr9oLPcZmC3qVfsTZNyp_G83IXhs4nb-1Um"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }



  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("işlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            //elimizdeki veriye göre dinamik list view oluşturur
            child: ListView.builder(
                itemCount: students.length,
                //eleman sayısı kadar itemBuilder fonksiyonu çalıştırılır
                itemBuilder: (BuildContext context, int index) {
                  //listenin içerisinde hangi elemanın nereye yerleştirileceğini söylediğimiz kısım
                  return ListTile(
                    //leading en başa tekabul eder ... resim için
                    //NETWORK İMAGE İNTERNET ÜZERİNDEKİ BİR RESMİ ADRES OLARAK VERİP KULLANABİLMEMİZİ SAĞLAR
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].image),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    //icon koymak için trailing en sona tekabul eder
                    trailing: buildStatusIcon(students[index].grade),
                    //elemente tıklamak onTab
                    onTap: () {
                      //state e değer atamak
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                })),
        Text("Seçili öğrenci: " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            //flexible satırın tamamını kaplar
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 1.0,
                    ),
                    //sized box ile araya görünmez bir kutu ekleyerek boşluk verdik
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                 //student_add.dart sayfasına yönlendirmek
                  //route tanımlarken MaterialPageRoute fonksiyonunu kullanırız
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd()));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              //row u flexlerin toplamı kadar parçaya böler ve flex değerine göre dağıt 2 versek diğerleri 1 olduğu için 4 parçaya bölüp ilk iki parçasına birinci butonu yerleştirecekri
              //flex o satırda ne kadarlık değer alacağını belirtir hepsine bir verdiğimiz için eşit dağıtır
              flex: 1,
              child: RaisedButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  var mesaj=selectedStudent.firstName+" Öğrencisi Güncellendi";
                  //Widget ağacından düşen context'i paremetre olarak göndeririz
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amber,
                textColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj=selectedStudent.firstName+" Öğrencisi Silindi";
                  //Widget ağacından düşen context'i paremetre olarak göndeririz
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}

//flutterda herşey widget mimarisine göre kurulur
//olay tamamen bir widgetten başlayıp iç içe widget ağacıyla devam eder
//text bir yere bir text vermek için kullanılan vidget
//Scaffold

//hot reload uygulamayı kaydettiğimiz anda direkt olarak değişen kısma bakar ve değişen kısmı uygulamaya ekler ancak hot reload her zaman çalışmaz
//özellikle widget yapısını bozduğumuz zaman çalışmaz

//hot restart apk yı yeniden oluşturmaz aama o widget ağacını yeniden çizer
//bazen bu da işe yaramaz o zaman yeniden run ederiz
