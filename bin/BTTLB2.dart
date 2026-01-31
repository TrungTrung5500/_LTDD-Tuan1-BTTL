import 'dart:io';

void main() {

  int number = 0;

  // 1. Nhập liệu và Kiểm tra điều kiện (Phải > 10)
  while (true) {
    stdout.write('Nhập vào một số nguyên dương (> 10): ');
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      number = int.parse(input);
      if (number > 10) {
        break; 
      } else {
        print('Lỗi: Số nhập vào phải lớn hơn 10. Vui lòng nhập lại!');
      }
    } else {
      print('Lỗi: Vui lòng nhập số nguyên hợp lệ!');
    }
  }

  String numberStr = number.toString();

  int soLuongChuSo = numberStr.length;
  print('a. Số $number có $soLuongChuSo chữ số.');

  int tongCacChuSo = 0;
  bool coSoLe = false;
  List<String> danhSachSoLe = []; 

  for (int i = 0; i < numberStr.length; i++) {
    int digit = int.parse(numberStr[i]);

    tongCacChuSo += digit;

    if (digit % 2 != 0) {
      coSoLe = true;
      danhSachSoLe.add(digit.toString());
    }
  }

  print('b. Tổng các chữ số là: $tongCacChuSo');

  if (coSoLe) {
    print('c. Số này CÓ chứa chữ số lẻ (Các số: ${danhSachSoLe.join(", ")}).');
  } else {
    print('c. Số này KHÔNG chứa chữ số lẻ nào (Toàn số chẵn).');
  }
}