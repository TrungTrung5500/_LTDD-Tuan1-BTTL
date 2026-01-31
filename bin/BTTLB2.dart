import 'dart:io';

void main() {
  // --- BÀI TẬP 2: XỬ LÝ SỐ NGUYÊN ---

  int number = 0;

  // 1. Nhập liệu và Kiểm tra điều kiện (Phải > 10)
  while (true) {
    stdout.write('Nhập vào một số nguyên dương (> 10): ');
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      number = int.parse(input);
      if (number > 10) {
        break; // Số hợp lệ thì thoát khỏi vòng lặp nhập
      } else {
        print('Lỗi: Số nhập vào phải lớn hơn 10. Vui lòng nhập lại!');
      }
    } else {
      print('Lỗi: Vui lòng nhập số nguyên hợp lệ!');
    }
  }

  // Chuyển số thành chuỗi để dễ xử lý từng ký tự
  String numberStr = number.toString();

  // a. Cho biết số có bao nhiêu chữ số
  int soLuongChuSo = numberStr.length;
  print('a. Số $number có $soLuongChuSo chữ số.');

  // b. Tính tổng các chữ số
  int tongCacChuSo = 0;
  // c. Kiểm tra có chữ số lẻ hay không
  bool coSoLe = false;
  List<String> danhSachSoLe = []; // Lưu lại để in ra cho đẹp (nếu muốn)

  // Duyệt qua từng ký tự trong chuỗi số
  for (int i = 0; i < numberStr.length; i++) {
    // Lấy ký tự tại vị trí i và chuyển ngược lại thành số
    int digit = int.parse(numberStr[i]);

    // Cộng vào tổng (Câu b)
    tongCacChuSo += digit;

    // Kiểm tra lẻ (Câu c)
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