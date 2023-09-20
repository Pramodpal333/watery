import 'package:flutter/foundation.dart';

println(msg){
  if (kDebugMode) {
    print(">>>>>>>>>>>>>>>>>>>>>\n");
    print(msg.toString());
    print("\n<<<<<<<<<<<<<<<<<<<<<<<");
  }
}