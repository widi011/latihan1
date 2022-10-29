import 'package:flutter/material.dart';
import 'package:petani/Model/petani.dart';
import 'package:petani/Services/apiStatic.dart';
import 'package:petani/UI/detailPetaniPage.dart';
import 'package:petani/UI/homePage.dart';

class PetaniPage extends StatefulWidget {
  @override
  _PetaniPageState createState() => _PetaniPageState();
}

class _PetaniPageState extends State<PetaniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("daftar petani"),
      ),
      body: FutureBuilder<List<Petani>>(
        future: ApiStatic.getPetani(),
        builder: (context, snapshot){
          if (snapshot.connectionState==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            List<Petani> listPetani=snapshot.data!;
            return Container(
              padding: EdgeInsets.all(5),
              child:ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index)=>Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext contect) => DetailPetaniPage(petani: listPetani[index],)
                  ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.lightGreenAccent)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(listPetani[index].foto, width: 30,),
                            Column(
                              children: [
                                Text(listPetani[index].nama),
                                Text(listPetani[index].namaKelompok,style: TextStyle(fontSize: 8),),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ) ,
      
       bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        backgroundColor: Colors.purpleAccent,
        onTap: (i) {
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext contect) => HomePage()));
              break;
            case 1:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext contect) => PetaniPage()));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), title: Text("Petani")),
        ],
      ),
    );
  }
}