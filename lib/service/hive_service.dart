import 'package:hive/hive.dart';

class OrganicoService {
  static Box? box; 
  static openBox()async{
     box = await Hive.openBox("box");
  }
  static putData(item){
    box!.add(item);
  }
}