import 'package:flutter/material.dart';

void main(){
  //MaterialApp material standartlarında bir çalışma ortamı kurar ve ona göre sistemin konfigürasyonunu gerçekleştirir
  runApp(MaterialApp(
    //home çalışacak olan kod bloğu
    home:MyApp()
  ));
}

class MyApp extends StatelessWidget {
  String mesaj="mesajjjj";
  @override
  Widget build(BuildContext context) {
    var ogrenciler=["Gülsen Keskin","Nihal Hızal","Eda Eyüboğlu","Tuğçe Emir"];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: [
          Expanded(
            //elimizdeki veriye göre dinamik list view oluşturur
            child: ListView.builder(
                itemCount: ogrenciler.length,
                //eleman sayısı kadar itemBuilder fonksiyonu çalıştırılır
                itemBuilder: (BuildContext context, int index){
                return Text(ogrenciler[index]);
                })
          ),
          Center(
            child:RaisedButton(
              child:Text("Gövde kısım"),
              onPressed: (){
                int puan=40;
                String mesaj="";
                if(puan>=50){
                  mesaj="Geçti";
                }else if(puan>=40){
                  mesaj="Bütünlemeye kaldı";
                }else{
                  mesaj="Kaldı";
                }

                var alert= AlertDialog(
                  title: Text("Sınav Sonucu"),
                  content: Text(mesaj),
                );
                showDialog(context: context, builder: (BuildContext context)=>alert);
              },
            ),
          ),
        ],
      ),
    );
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

