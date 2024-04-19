import 'package:checks/checks.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:source_map_stack_trace/source_map_stack_trace.dart' as source_map_stack_trace;
import 'package:stack_trace/stack_trace.dart';
import 'package:path/path.dart' as path;
import 'package:source_maps/source_maps.dart' as source_map;

// TODO 解析js trace
void main() {
  group("parseStackGetJsMapUri", () {
    test("release mode web stack", () async {
      var mapUri = getJsMapByWebReleaseMode("""
Exception: my throw
    at Object.f (http://localhost:8080/you/flutter_web/main.dart.js:4119:19)
    at Object.bbo (http://localhost:8080/you/flutter_web/main.dart.js_24.part.js:19:15)
    at Ub.b7W (http://localhost:8080/you/flutter_web/main.dart.js_24.part.js:10:7)
    at ak.afW (http://localhost:8080/you/flutter_web/main.dart.js:82908:7)
""");
      check(mapUri.toString()).equals("http://localhost:8080/you/flutter_web/main.dart.js_24.part.js.map");

      try {
        getJsMapByWebReleaseMode("""
Exception: my throw
    at Object.f (http://localhost:8080/you/flutter_web/main.dart.js:4119:19)
    at ak.afW (http://localhost:8080/you/flutter_web/main.dart.js:82908:7)
""");
        fail("not here");
      } catch (e) {
        check(
          e.toString(),
          because: "not found deferred import page,like this: main.dart.js_24.part.js",
        ).contains("current only support deferred import page");
      }
    });

    test("source map parse", () async {
      getLineFromStackTraceString(
          """
Exception: my throw
    at Object.f (http://localhost:8080/you/flutter_web/main.dart.js:4119:19)
    at Object.bbo (http://localhost:8080/you/flutter_web/main.dart.js_24.part.js:19:15)
    at Ub.b7W (http://localhost:8080/you/flutter_web/main.dart.js_24.part.js:10:7)
    at ak.afW (http://localhost:8080/you/flutter_web/main.dart.js:82908:7)
    at Ze.awq (http://localhost:8080/you/flutter_web/main.dart.js:83013:3)
    at Ze.K (http://localhost:8080/you/flutter_web/main.dart.js:83020:34)
    at hH.cq (http://localhost:8080/you/flutter_web/main.dart.js:68069:21)
    at hH.jA (http://localhost:8080/you/flutter_web/main.dart.js:68041:9)
    at hH.jA (http://localhost:8080/you/flutter_web/main.dart.js:68075:11)
    at hH.IA (http://localhost:8080/you/flutter_web/main.dart.js:67992:10)
          """,
          """
{
  "version": 3,
  "engine": "v2",
  "file": "main.dart.js_24.part.js",
  "sourceRoot": "",
  "sources": ["../../../lib/notes/pure_dart/execption/note.dart","../../../../../packages/you_note_dart/lib/src/note_core.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/http-1.2.1/lib/src/client.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/path-1.9.0/lib/path.dart","org-dartlang-sdk:///dart-sdk/lib/internal/iterable.dart","org-dartlang-sdk:///dart-sdk/lib/_internal/js_runtime/lib/js_array.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/stack_trace-1.11.1/lib/src/chain.dart","org-dartlang-sdk:///dart-sdk/lib/_internal/js_runtime/lib/js_string.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/stack_trace-1.11.1/lib/src/frame.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/stack_trace-1.11.1/lib/src/unparsed_frame.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/stack_trace-1.11.1/lib/src/trace.dart","org-dartlang-sdk:///dart-sdk/lib/core/iterable.dart","org-dartlang-sdk:///dart-sdk/lib/_internal/js_shared/lib/rti.dart","org-dartlang-sdk:///dart-sdk/lib/core/uri.dart","org-dartlang-sdk:///dart-sdk/lib/_internal/js_runtime/lib/core_patch.dart","org-dartlang-sdk:///dart-sdk/lib/_internal/js_runtime/lib/instantiation.dart","org-dartlang-sdk:///dart-sdk/lib/_internal/js_runtime/lib/js_helper.dart","org-dartlang-sdk:///dart-sdk/lib/_internal/js_runtime/lib/regexp_helper.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/path-1.9.0/lib/src/context.dart","../../../../../../../../.pub-cache/hosted/pub.flutter-io.cn/stack_trace-1.11.1/lib/src/utils.dart"],
  "names": ["build","Pen.call","Client","JSArray.map","throwException","Chain.parse","WhereIterable.map","JSArray.where","Frame._#parseVM#tearOff","Frame.parseVM","Frame._#parseV8#tearOff","Frame.parseV8","Frame._parseFirefoxEval","Frame._#parseFirefox#tearOff","Frame.parseFirefox","Frame._#parseFriendly#tearOff","Frame.parseFriendly","Frame._uriOrPathToUri","Frame._catchFormatException","UnparsedFrame","Trace.parse","Trace._#parseVM#tearOff","Trace.parseVM","Trace._parseVM","Trace.parseV8","Trace.parseJSCore","Trace.parseFirefox","Trace._#parseFriendly#tearOff","Trace.parseFriendly","Trace","instantiatedGenericFunctionType","Rti._getInterfaceTypeArguments","Uri.dataFromString","UriData.fromString","UriData._writeUri","StringBuffer.write","UriData._validateMimeType","UriData._uriEncodeBytes","StringBuffer.writeCharCode","Instantiation.==","Instantiation.hashCode","Instantiation.toString","Chain.toTrace","JSArray.expand","Chain.toString","Frame.isCore","Frame.library","Frame.package","Frame.location","Frame.toString","Trace.toString","UnparsedFrame.toString","build.<anonymous function>","Chain.parse.<anonymous function>","JSString.isNotEmpty","Chain.toTrace.<anonymous function>","Chain.toString.<anonymous function>","Chain.toString.<anonymous function>.<anonymous function>","Frame.parseVM.<anonymous function>","_MatchImplementation.[]","Frame.parseV8.<anonymous function>","Frame.parseV8.<anonymous function>.parseLocation","Frame._parseFirefoxEval.<anonymous function>","Frame.parseFirefox.<anonymous function>","Frame.parseFriendly.<anonymous function>","fromUri","Trace._parseVM.<anonymous function>","Trace.parseV8.<anonymous function>","Trace.parseJSCore.<anonymous function>","Trace.parseFirefox.<anonymous function>","Trace.parseFriendly.<anonymous function>","Trace.toString.<anonymous function>","windows","_vmFrame","_v8Frame","_v8UrlLocation","_v8EvalLocation","_firefoxEvalLocation","_firefoxSafariFrame","_friendlyFrame","_asyncBody","_initialDot","Frame._uriRegExp","Frame._windowsRegExp","_v8Trace","_v8TraceLine","_firefoxEvalTrace","_firefoxSafariTrace","_friendlyTrace","vmChainGap","Pen.markdown","","[]","_","_getBindCache","_getInterfaceTypeArguments","_getRest","_setBindCache","_types","_writeString","call","currentCell","dirname","expand","fromCharCode","fromString","group","isEmpty","isNotEmpty","length","map","markdown","prettyUri","print","replaceAll","runtimeType","skip","skipWhile","take","toList","toString","toUri","uri","where","write","writeCharCode","zoneClient"],
  "mappings": "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",
  "x_org_dartlang_dart2js": {
    "minified_names": {
      "global": "",
      "instance": ""
    },
    "frames": "mSAME+GiI;sFAAAAACiWEXAAZACgB,AAAAYQ,A,A;ADnUkBtBAEiBAmCW,A;+GFfmCxB4B;KAAvDFACiUEaC,AAAAZqB,A;ADzTFUiJ;4WAeiBDAK6QJnBW,A;YL7QImBQK6QJnBc,A;0PL5RboBACqUEXAAZAaC,AAAAZQ,A,A;iHK3K0BVI;AAAhBgBY;gBAAgBhBK;yDAGnBgCU;OADEhCc;AAEFmBAFmQLjBS,A;AEpQK8BADwFIhCW,A;YCxFJgCADwFIhCc,A;QCvFJmBAFmQLjBsB,A;uBEhQoCFc;iCAE/BAc;AAAYmBADqIRnBS,A;uwBGgBFASCnUK+B6B,A;iSC+GFfa;yaAsBgBhBW;8EAQvBgCALmHMhCS,A;IKrHNuBa;gCAKKPiB;mBAIGWU;UAAAAY;AAAMRS;QAAAAqB;AAAuBS6B;mEAc7BHW;mCACACM;mBAHT1BO;AAOSmBO;QAAAAqB;4BAMTnBW;AAGSmBAN4PXjBS,A;AM7PW8BALiFFhCS,A;sFKpEPAW;AAISmBAN4OXjBS,A;AM7OW8BALiEFhCS,A;8HKpCGgBwB;AAMGGAN0MfjBS,A;AM5Me8BALgCNhCS,A;6DKrCPAc;8VEoVIIAAtR8BCM,A;AAyRxBFG;cAGVGgB;+FClKmBQAAq6FDd8B,uCAcHkBoB,yBASJhBG,AAAE2BG,A;kFAqEfIAChwFFzBY,A;+GDwwFEyBACxwFFzBS,A;gSD8sGI0BACzsGarBkB,A;AD2sGbqBAC3sGarBc,A;AD4sGbqBAC5sGarBU,A;qBD6sGbqBAC7sGarBU,A;4RCzoBVWc;AAAqBAQ;4BAEmBAoF;sBAM/BjBwB;6RTgNOKAD4BZZW,A;YC5BYYQD4BZZoB,A;QCvBGmBU;oBAQPAAD8DInBW,A;UCtEGmBADsEHnBW,A;YCtEGmBADsEHnBgB,A;kBC9DJmBAD8DInBgB,A;0IGtNCqBa;8XEiORFU;oBAGGAALdInBW,A;UKWPmBALXOnBW,A;YKWPmBALXOnBgB,A;kBKcJmBALdInBgB,A;6aLvS0BSACoUrCCgB,AAAAYU,A;0RKvK4BLACgONDW,A;+ED3JIGADqEfnBO,A;iCCrEemBQDqEfnBc,A;2GC7DemBAD6DfnBO,A;uCC7DemBQD6DfnBc,A;qLGlLEAS;+DAIiBASCrIhB+B6B,A;IDyIG9BASkDecW,A;oBTlDPQsB;AAChBA0C;AAEKtBAS+CkBcS,A;mITtCrBfiB;sHAMmBASC3JhB+B6B,A;mBDqLN9BASMwBcU,A;6CTAdQ0B;AACHAiC;cACAAiC;4IA3BItBASyBacO,A;2CTpBjBfS;wDAIoBASC3KrB+B+B,A;OD6KoB9BAScFcW,A;mDTVnBfG;8IAsCiBASCvNhB+B6B,A;IDwNG9BAS7BecW,A;UT6BPQ0B;0DAMdvBgB;AAHIgBsC;sGASehBSCpOhB+B6B,A;IDsON9BAS3CwBce,A;6NT+DjBdAS/DiBcc,A;uCTiExBdASjEwBcuB,A;2CTkErBfiB;gLAwBGCAS1FkBc4B,A;2DTgGUzCS;AAAzBwDO;MAAyBxDAL8IfAsB,A;AK3IZ2BASnGiBce,A;uCToGfdASpGece,A;2CTqGrBfoB;2CElJeiBAH2PJDW,A;wJGzMYCAHyMZDgC,A;"
  }
}
""");
      // check(mapUri.toString()).equals("http://localhost:8080/you/flutter_web/main.dart.js_24.part.js.map");
    });


  });
}


// int getCallerLineOnWebReleaseMode(String stack,String jsMap){
//
// }

Uri getJsMapByWebReleaseMode(String stack) {
  var parsed = Trace.parse(stack);
  for (var frame in parsed.frames) {
    // 如果遇到解析不了的行(可能发生在测试中或其他情况)
    if (frame.line == null || frame.uri.path == "unparsed") {
      continue;
    }
    if (path.basename(frame.uri.path) != "main.dart.js") {
      return frame.uri.replace(path: "${frame.uri.path}.map");
    }
  }
  throw AssertionError("current only support deferred import page, that uri looks like: http://localhost:8080/you/flutter_web/main.dart.js_24.part.js, but your stack: $stack  ");
}
// typedef GetSourceMap=Future<String>  Function  (Uri uri);
int getLine( StackTrace stackTrace,String sourceMap) {
  source_map.parse(sourceMap);
  var dartTrace = source_map_stack_trace.mapStackTrace( source_map.parse(sourceMap),stackTrace);
  var trace = Trace.from(dartTrace);
  for(var frame in trace.frames){
    debugPrint("sssss$frame");
  }
  return 1;
}
int getLineFromStackTraceString( String stackTrace,String sourceMap) {
  return getLine(Trace.parse(stackTrace),sourceMap);
}
