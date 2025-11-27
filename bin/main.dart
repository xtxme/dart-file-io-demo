import 'dart:io';

import '../lib/txt_io.dart';
import '../lib/json_io.dart';
import '../lib/csv_io.dart';

void main() async {
  print('=== Dart File I/O Demo ===');
  print('1. Demo TXT');
  print('2. Demo JSON');
  print('3. Demo CSV');
  stdout.write('เลือกเมนู (1-3): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      print('\n');
      await demoTxt();
      break;
    case '2':
      print('\n');
      await demoJson();
      break;
    case '3':
      print('\n');
      await demoCsv();
      break;
    default:
      print('เมนูไม่ถูกต้อง');
  }
}
