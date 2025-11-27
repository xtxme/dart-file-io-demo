import 'dart:io';
import 'dart:convert';

Future<void> demoJson() async {
  final file = File('data/students.json');

  // สร้างไฟล์ตัวอย่างถ้ายังไม่มี
  if (!await file.exists()) {
    await file.create(recursive: true);
    await file.writeAsString(jsonEncode([
      {"name": "Alice", "score": 90},
      {"name": "Bob", "score": 75},
      {"name": "Charlie", "score": 85},
    ]));
  }

  // อ่านไฟล์ JSON
  final jsonString = await file.readAsString();
  final List<dynamic> students = jsonDecode(jsonString);

  // เพิ่มนักเรียนใหม่และแสดงผลลัพธ์ที่อัปเดต
  final newStudent = {"name": "I-tim", "score": 57};
  students.add(newStudent);

  print('👩 Students in JSON (updated):');
  for (var student in students) {
    print('${student["name"]} - Score: ${student["score"]}');
  }
  print('\n➕ Added student: ${newStudent["name"]} - Score: ${newStudent["score"]}');

  // เขียนกลับลงไฟล์
  await file.writeAsString(jsonEncode(students));
  print('\n📁 Updated JSON file saved successfully!');
}
