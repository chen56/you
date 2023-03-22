// // ignore_for_file: unnecessary_type_check
//
// import 'package:flutter/widgets.dart';
// import 'package:note/mate2.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:note/mate_api_experiment.dart';
//
// void main() {
//   late ObjectBuilder obj;
//
//   setUp(() {
//     obj = ObjectBuilder(builder: (m) => Container());
//   });
//   group("范型", () {
//     test('print', () {});
//   });
//   group("put(value)", () {
//     test('put(value)', () {
//       Param<double> p = obj.put("width", 1);
//       expect(p, obj.get("width"));
//       expect(1, p.build());
//       expect(true, !p.isNullable);
//       expect(true, p.isValue);
//     });
//     test('put(value? )', () {
//       Param<double?> p = obj.put("width", 1);
//
//       expect(1, obj.get("width").build());
//       expect(1, p.build());
//       expect(true, p.isNullable);
//       expect(true, p.isValue);
//     });
//     test('put(null)', () {
//       Param<double?> p = obj.put<double?>("width", null);
//       expect(null, obj.get("width").build());
//       expect(null, p.build());
//       expect(true, p.isNullable);
//       expect(true, p.isValue);
//     });
//   });
//
//   group("put(Meta)", () {
//     test('put(Meta)', () {
//       Param<Container> p = obj.put("mate", ContainerMate(width: 100));
//       Param<Container> getP = obj.get("mate");
//       expect(p, getP);
//
//       expect(true, p.build() is ContainerMate);
//       expect(true, !p.isNullable);
//       expect(true, p.isObject);
//     });
//
//     test('put(Meta?)', () {
//       Param<Container?> p = obj.put<Container?>("mate", ContainerMate(width: 100));
//       Param<Container?> getP = obj.get("mate");
//       expect(p, getP);
//
//       expect(true, p.build() is ContainerMate);
//       expect(true, p.isNullable);
//       expect(true, p.isObject);
//     });
//
//     test('put(null)', () {
//       // null值无法识别其是否是Mate，所以只能作为ValueParam处理
//       Param<Container?> p = obj.put<Container?>("mate", null);
//       Param<Container?> getP = obj.get("mate");
//       expect(p, getP);
//
//       expect(true, p.build() == null);
//       expect(true, p.isNullable);
//       expect(true, p.isValue);
//     });
//   });
//
//   group("putList(List)", () {
//     test('putList(List)', () {
//       Param<List<int>> p = obj.put("list", [1, 2]);
//       Param<List<int>> getP = obj.get("list");
//       expect(p, getP);
//
//       // expect([1, 2], list.toValueList());
//       expect(true, p.build() is List);
//       expect(true, !p.isNullable);
//       expect(true, p.isList);
//     });
//
//     test('putList(List?)', () {
//       Param<List<int>?> p = obj.put("list", [1, 2]);
//       Param<List<int>?> getP = obj.get("list");
//       expect(p, getP);
//
//       expect(true, p.build() is List);
//       expect(true, p.isNullable);
//       expect(true, p.isList);
//     });
//
//     test('putList(null)', () {
//       Param<List<int>?> p = obj.put("list", null);
//       Param<List<int>?> getP = obj.get("list");
//       expect(p, getP);
//
//       expect(true, p.build() == null);
//       expect(true, p.isNullable);
//       expect(true, p.isList);
//     });
//   });
//
//   group("toList()", () {
//     test('print', () {
//       var x = ColumnMate(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ContainerMate(
//             width: 100,
//             child: CenterMate(
//               widthFactor: 100,
//             ),
//           ),
//           ContainerMate(
//             width: 100,
//             child: CenterMate(
//               widthFactor: 100,
//             ),
//           ),
//         ],
//       );
//       x.mateParams.toList(test: (e) => e.param.init != null).forEach((e) {
//         // ignore: avoid_print
//         print("${"  " * e.level} ${e.name}");
//       });
//     });
//   });
// }
