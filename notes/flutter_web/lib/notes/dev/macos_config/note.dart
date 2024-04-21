import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, CellPrint print) {
  print.markdown(r'''
# macos_config

## macOS 沙箱

ref: [Protecting user data with App Sandbox](https://developer.apple.com/documentation/security/app_sandbox/protecting_user_data_with_app_sandbox)

沙箱机制是macos的安全机制，用以减少恶意应用对用户系统的破坏。
如果不打算发apple appstore，可以把关掉的权限，否则访问沙箱外的文件等资源都会被拒绝。

可在flutter项目中将其关掉：

- macos_config/Runner/DebugProfile.entitlements
- macos_config/Runner/Release.entitlements

```xml
	<key>com.apple.security.app-sandbox</key>
	<false/>
```

  ''');
}
