
flutter_generate:
	flutter packages pub run build_runner build --verbose --delete-conflicting-outputs

flutter_build_runner:
	flutter packages get && \
    flutter packages pub run build_runner build --delete-conflicting-outputs


futter_gen_activate:
	dart pub global activate flutter_gen

flutter_gen_run:
	fluttergen


flutter_coverage:
	flutter test --coverage

flutter_coverage_files:
	genhtml coverage/lcov.info -o coverage/html

flutter_open_coverage_html:
	open coverage/html/index.html


flutter_native_splash:
	flutter pub run flutter_native_splash:create
	