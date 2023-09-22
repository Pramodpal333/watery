import 'package:get_storage/get_storage.dart';

class CustomStorage {
  GetStorage box = GetStorage();

  saveData(String key, value) async {
    await box.write(key, value);
  }

  readData(String key){
    return box.read(key);
  }

  deleteAllData(){

  }
}