import 'dart:io';

Future<void> demoCsv() async {
  final file = File('data/scores.csv');

  // สร้างไฟล์ CSV เริ่มต้นถ้ายังไม่มีหรือว่างเปล่า
  if (!await file.exists() || await file.length() == 0) {
    await file.create(recursive: true);
    await file.writeAsString(
      'name,math,science\nAlice,90,88\nBob,75,82\nCharlie,85,91\n',
    );
  }

  final lines = await file.readAsLines();

  // บรรทัดแรกคือ header
  final header = lines.first.split(',');
  print('📊 Header: $header');

  // ข้อมูลแต่ละแถว
  for (var i = 1; i < lines.length; i++) {
    final columns = lines[i].split(',');
    final name = columns[0];
    final math = int.parse(columns[1]);
    final science = int.parse(columns[2]);

    print('$name → math: $math, science: $science');
  }
}
