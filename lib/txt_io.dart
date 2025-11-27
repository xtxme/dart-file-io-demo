import 'dart:io';

Future<void> demoTxt() async {
  final file = File('data/notes.txt');

  // เขียนข้อมูลเริ่มต้น (เขียนทับ)
  await file.writeAsString('Hello Dart File I/O!\n');

  // เพิ่มข้อความต่อท้ายไฟล์
  await file.writeAsString('Append line 1\n', mode: FileMode.append);
  await file.writeAsString('Append line 2\n', mode: FileMode.append);

  // อ่านไฟล์กลับมา
  final content = await file.readAsString();
  print('📄 TXT content:');
  print(content);
}
