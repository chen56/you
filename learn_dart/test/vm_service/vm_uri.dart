// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library service_tester;

import 'dart:developer';
import 'dart:io';

import 'package:vm_service/vm_service.dart' show VmService;

final String host = 'localhost';
final int port = 7575;

late VmService serviceClient;

// ❯ dart run --enable-vm-service  test/vm_service/vm_uri.dart
// The Dart VM service is listening on http://127.0.0.1:8181/EYZIWPLPgAE=/
// The Dart DevTools debugger and profiler is available at: http://127.0.0.1:8181/EYZIWPLPgAE=/devtools?uri=ws://127.0.0.1:8181/EYZIWPLPgAE=/ws
// find vm service uri : http://127.0.0.1:8181/EYZIWPLPgAE=/
//
// dart run --enable-vm-service  --disable-service-auth-codes test/vm_service/vm_uri.dart
void main() async{
  while(true){
    print("find vm service uri : ${(await Service.getInfo()).serverUri}");
    print("press y to exit");
    String? line = stdin.readLineSync();
    if(line==null||line=="y"){
      return;
    }
  }
}
