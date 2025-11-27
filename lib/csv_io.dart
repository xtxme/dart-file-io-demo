import 'dart:io';

Future<void> demoCsv() async {
  final file = File('data/scores.csv');
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
