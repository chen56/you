// // Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// // for details. All rights reserved. Use of this source code is governed by a
// // BSD-style license that can be found in the LICENSE file.
// // library augment  '4.1.ListenableBuilder.dart';
//
// augment
//
// class Class {
//   augment Class() {
//     print("new augment Class1");
//     // augment super();//UnimplementedError: DeclaredSourceConstructorBuilder.augmentSuperTarget}
//
//   }
//
//   augment
//
//   void augmentedMethod() {
//     print("1");
//     augment super();
//     print("2");
//   }
// }
