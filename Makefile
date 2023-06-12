.ONESHELL:

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

unit test domain_user:
	flutter test test/unit_test/bloc_test/bloc_test.dart
	flutter test test/unit_test/model_test/model_test.dart

check_coverage:
	flutter test test/unit_test/unit_test.dart --coverage
	lcov --remove coverage/lcov.info '*/config/*' '*/utils/*' '*/common/*' -o coverage/lcov.info 
	genhtml coverage/lcov.info --output=coverage

open_coverage:
	open coverage/index.html

release local:
	flutter run --release --dart-define=ENVIRONMENT=LOCAL --flavor=dev

run dev:
	flutter run --dart-define=ENVIRONMENT=DEV

release dev:
	flutter run --release --dart-define=ENVIRONMENT=DEV

clone submodule:
	git submodule update --init --recursive 

clone submodule remote:
	git submodule update --init --remote 

clone submodule update:
	git submodule update --init --update 

gen localization:
	flutter pub run intl_utils:generate 
