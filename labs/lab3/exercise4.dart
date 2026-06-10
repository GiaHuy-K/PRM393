import 'dart:async';

void main() async {
  print('=== BẮT ĐẦU BÀI TẬP 4 (STREAM TRANSFORMATION) ===\n');

  // 1. Tạo một Stream phát ra các số từ 1 đến 5 (Sử dụng Stream.fromIterable)
  final Stream<int> numberStream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
  print('-> Đã tạo luồng dữ liệu gốc (Stream): [1, 2, 3, 4, 5]\n');

  // 2. BIẾN ĐỔI LUỒNG DỮ LIỆU (STREAM TRANSFORMATION)
  final Stream<int> transformedStream = numberStream
      // Bước A: Dùng map() để biến đổi từng giá trị thành bình phương của nó
      .map((number) {
        final square = number * number;
        print('[Toán tử map] Biến đổi: $number -> $square (Bình phương)');
        return square;
      })
      // Bước B: Dùng where() để lọc, chỉ giữ lại các số chẵn (chia hết cho 2)
      .where((squareNumber) {
        final isEven = squareNumber % 2 == 0;
        print('[Toán tử where] Kiểm tra số chẵn: $squareNumber -> ${isEven ? "HỢP LỆ" : "LOẠI"}');
        return isEven;
      });

  print('--------------------------------------------------');
  print('Bắt đầu lắng nghe (listen) luồng dữ liệu sau khi lọc:\n');

  // 3. LẮNG NGHE VÀ IN KẾT QUẢ ĐẦU RA
  // Sử dụng await for để duyệt qua từng phần tử của Stream khi nó được phát ra
  await for (final value in transformedStream) {
    print(' ==> [Console Đầu ra] Nhận được giá trị chẵn: $value');
  }

  print('\n=== KẾT THÚC BÀI TẬP 4 ===');
}