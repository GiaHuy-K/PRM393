import 'dart:async';

void main() {
  print('=== BẮT ĐẦU BÀI TẬP 3 (DEBUGGING ASYNC + MICROTASK) ===\n');

  // 1. Dòng code đồng bộ (Synchronous) chạy bình thường
  print('1. [Main] Bắt đầu chạy các dòng lệnh đồng bộ...');

  // 2. Thêm một tác vụ vào Event Queue bằng Future thông thường
  Future(() {
    print('5. [Event Queue] Đây là Future số 1 (Event Callback) được thực thi.');
  });

  // 3. Thêm một tác vụ vào Microtask Queue bằng scheduleMicrotask
  scheduleMicrotask(() {
    print('3. [Microtask Queue] Đây là Microtask số 1 được thực thi.');
  });

  // 4. Thêm một Future số 2 kèm theo một Microtask lồng bên trong nó
  Future(() {
    print('6. [Event Queue] Đây là Future số 2 (Event Callback) được thực thi.');
    
    // Microtask được lên lịch ngay trong khi Event đang chạy
    scheduleMicrotask(() {
      print('7. [Microtask Queue] Microtask số 3 (lồng trong Future 2) chạy ngay sau Future 2.');
    });
  });

  // 5. Thêm một Microtask số 2
  scheduleMicrotask(() {
    print('4. [Microtask Queue] Đây là Microtask số 2 được thực thi.');
  });

  // 6. Dòng code đồng bộ cuối cùng trong hàm main
  print('2. [Main] Kết thúc các dòng lệnh đồng bộ trong hàm main.');
  print('\n--- THỨ TỰ IN RA THỰC TẾ TRÊN CONSOLE SẼ LÀ: ---');
}