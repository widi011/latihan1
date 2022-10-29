import 'package:petani/Model/petani.dart';

class ApiStatic{
  static Future<List<Petani>> getPetani() async{
    List<Petani> petani=[];
    for (var i = 0; i < 10; i++) {
      petani.add(
        Petani(
          idPenjual: i, nama: "Nama Petani"+i.toString(), nik: "123"+i.toString(), alamat: "Alamat", telp: "0362", foto: "https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2022/03/31/950962144.jpg", idKelompokTani: 1, status: "Y", namaKelompok: "Jaya Mula", createAt: "", updateAt: ""
          )
      );
      
    }
    return petani;
  }
}