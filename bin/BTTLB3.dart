import 'dart:io';
import 'dart:math';

void main() {
  // --- BÀI TẬP 3: XỬ LÝ DANH SÁCH NHẬP TỪ BÀN PHÍM ---
  List<int> numbers = [];

  // 1. Nhập số lượng phần tử
  int n = 0;
  while (true) {
    stdout.write('Nhập số lượng phần tử của danh sách (>0): ');
    String? inputN = stdin.readLineSync();
    if (inputN != null && int.tryParse(inputN) != null) {
      n = int.parse(inputN);
      if (n > 0) break;
    }
    print('Vui lòng nhập số nguyên dương hợp lệ!');
  }

  // 2. Nhập từng phần tử
  for (int i = 0; i < n; i++) {
    while (true) {
      stdout.write('Nhập phần tử thứ ${i + 1}: ');
      String? inputVal = stdin.readLineSync();
      if (inputVal != null && int.tryParse(inputVal) != null) {
        numbers.add(int.parse(inputVal));
        break; // Nhập đúng thì qua số tiếp theo
      }
      print('Lỗi: Phải nhập số nguyên!');
    }
  }

  // a. Xuất danh sách vừa nhập
  print('\na. Danh sách vừa nhập: $numbers');

  // b. Tính tổng các phần tử
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  print('b. Tổng các phần tử trong danh sách: $sum');

  // c. Xuất các số nguyên tố
  // Hàm kiểm tra số nguyên tố (Viết gọn dạng logic)
  bool isPrime(int k) {
    if (k < 2) return false;
    for (int i = 2; i <= sqrt(k); i++) {
      if (k % i == 0) return false;
    }
    return true;
  }

  List<int> primes = numbers.where((num) => isPrime(num)).toList();
  if (primes.isEmpty) {
    print('c. Danh sách không có số nguyên tố nào.');
  } else {
    print('c. Các số nguyên tố có trong danh sách: $primes');
  }

  // d. Tìm kiếm và Thêm vào đầu
  stdout.write('\nd. Nhập một giá trị bất kỳ để tìm kiếm: ');
  String? searchInput = stdin.readLineSync();

  if (searchInput != null && int.tryParse(searchInput) != null) {
    int valueToFind = int.parse(searchInput);
    
    // Kiểm tra có trong danh sách không
    int index = numbers.indexOf(valueToFind);

    if (index != -1) {
      // Nếu CÓ: In ra vị trí (Lưu ý: vị trí máy tính đếm từ 0)
      print('   -> Tìm thấy số $valueToFind tại vị trí index: $index (Phần tử thứ ${index + 1})');
    } else {
      // Nếu KHÔNG: Thêm vào đầu danh sách
      numbers.insert(0, valueToFind);
      print('   -> Không tìm thấy số $valueToFind.');
      print('   -> Đã thêm vào đầu danh sách. Danh sách mới: $numbers');
    }
  } else {
    print('   -> Lỗi: Giá trị nhập vào không hợp lệ.');
  }
}