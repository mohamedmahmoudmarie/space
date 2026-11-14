# Space App — Route Mobile Diploma (Task Four)

## التشغيل (VS Code)

افتح الفولدر في VS Code ونفّذ في الـ Terminal:

```bash
flutter create . --project-name space_app   # بيعمل فولدرات android / ios بس، مش هيمسح lib
flutter pub get
flutter run
```

## إعدادات الـ 3D (flutter_3d_controller)

**Android** — في `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>

<application
    android:usesCleartextTraffic="true"
    ... >
```

**iOS** — في `ios/Runner/Info.plist`:

```xml
<key>io.flutter.embedded_views_preview</key>
<true/>
```

## الموديلات الـ 3D

حط ملفات الـ `.glb` اللي في assets المشروع جوه `assets/models/` بالأسماء دي:

`sun.glb, mercury.glb, venus.glb, earth.glb, mars.glb, jupiter.glb, saturn.glb, uranus.glb, neptune.glb`

لو ملف ناقص، شاشة التفاصيل بتعرض صورة الكوكب بدل الـ 3D تلقائيًا، فالتطبيق مش هيقع.

## هيكل المشروع

```
lib/
  core/        app_colors.dart, app_theme.dart
  models/      planet.dart
  data/        planets_data.dart        ← بيانات الكواكب (Details Sheet)
  widgets/     header_banner.dart (Image + Gradient + Titles)
               primary_button.dart, action_button.dart
  screens/     onboarding_screen.dart   (Screen Zero)
               home_screen.dart         (Screen One - PageView + arrows)
               details_screen.dart      (Screen Two - 3D + About)
```
