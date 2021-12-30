import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';

void main(){
  //MaterialApp material standartlarında bir çalışma ortamı kurar ve ona göre sistemin konfigürasyonunu gerçekleştirir
  runApp(MaterialApp(
    //home çalışacak olan kod bloğu
    home:MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj="Öğrenci Takip Sistemi";

  String seciliOgrenci="";

  List<Student> students=[Student("Hermonie", "Granger", 100,"https://i.stack.imgur.com/7w3YO.jpg?s=192&g=1"),Student("Harry", "Potter", 20,"https://upload.wikimedia.org/wikipedia/tr/6/61/HarryPotterOotP.jpg"),Student("Ron", "Weasley", 70,"https://i.stack.imgur.com/7w3YO.jpg?s=192&g=1")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  String sinavHesapla(int puan){
    String mesaj="";
    if(puan>=50){
      mesaj="Geçti";
    }else if(puan>=40){
      mesaj="Bütünlemeye kaldı";
    }else{
      mesaj="Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj){
    var alert= AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context)=>alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          //elimizdeki veriye göre dinamik list view oluşturur
            child: ListView.builder(
                itemCount: students.length,
                //eleman sayısı kadar itemBuilder fonksiyonu çalıştırılır
                itemBuilder: (BuildContext context, int index){
                  //listenin içerisinde hangi elemanın nereye yerleştirileceğini söylediğimiz kısım
                  return ListTile(
                    //leading en başa tekabul eder ... resim için
                    //NETWORK İMAGE İNTERNET ÜZERİNDEKİ BİR RESMİ ADRES OLARAK VERİP KULLANABİLMEMİZİ SAĞLAR
                    leading: CircleAvatar(backgroundImage:NetworkImage(students[index].image) ,),
                    title: Text(students[index].firstName+" "+ students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " + students[index].grade.toString()+ " ["+ students[index].getStatus+"]"),
                    //icon koymak için trailing en sona tekabul eder
                    trailing: buildStatusIcon(students[index].grade),
                    //elemente tıklamak onTab
                    onTap: (){
                      //state e değer atamak
                      setState(() {
                        seciliOgrenci=students[index].firstName+" "+ students[index].lastName;
                      });
                    },
                  );
                })
        ),
        Text("Seçili öğrenci: "+ seciliOgrenci),
        Center(
          child:RaisedButton(
            child:Text("Button"),
            onPressed: (){
              var mesaj= sinavHesapla(55);
              //Widget ağacından düşen context'i paremetre olarak göndeririz
              mesajGoster(context, mesaj);
            },
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade>=50){
      return Icon(Icons.done);
    }else if(grade>=40){
      return Icon(Icons.album);
    }else{
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


