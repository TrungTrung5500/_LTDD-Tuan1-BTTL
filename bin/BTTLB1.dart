import 'dart:io';

void main() {

  // 1. Nhập số lượng
  stdout.write('Nhập số lượng que kem cần mua (>0): ');
  String? nhapSoLuong = stdin.readLineSync();

  // 2. Nhập đơn giá
  stdout.write('Nhập giá tiền một que kem: ');
  String? nhapGia = stdin.readLineSync();

  if (nhapSoLuong != null && nhapGia != null) {
    try {
      int soLuong = int.parse(nhapSoLuong);
      double donGia = double.parse(nhapGia);

      if (soLuong <= 0) {
        print('Vui lòng nhập số lượng lớn hơn 0!');
        return;
      }

      // 3. Tính tổng tiền gốc
      double tongTien = soLuong * donGia;
      double thanhTien = tongTien; // Mặc định là không giảm

      // 4. Xét điều kiện giảm giá
      if (soLuong > 10) {
        // Giảm 10%
        thanhTien = tongTien * 0.9;
        print('=> Bạn mua trên 10 que, được giảm 10%.');
      } else if (soLuong >= 5) {
        // Giảm 5%
        thanhTien = tongTien * 0.95;
        print('=> Bạn mua từ 5-10 que, được giảm 5%.');
      } else {
        print('=> Mua dưới 5 que nên không được giảm giá.');
      }

      // 5. In kết quả 
      print('--- HÓA ĐƠN ---');
      print('Số lượng: $soLuong que');
      print('Đơn giá: ${donGia.toStringAsFixed(0)} đ');
      print('Tổng tiền gốc: ${tongTien.toStringAsFixed(0)} đ');
      print('-----------------');
      print('THÀNH TIỀN PHẢI TRẢ: ${thanhTien.toStringAsFixed(0)} đ');

    } catch (e) {
      print('Lỗi: Dữ liệu nhập vào không phải là số hợp lệ!');
    }
  }
}
