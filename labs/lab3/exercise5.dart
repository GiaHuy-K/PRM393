// ==========================================
// 1. ĐỊNH NGHĨA CLASS SETTINGS (SINGLETON PATTERN)
// ==========================================
class Settings {
  // Thuộc tính mô phỏng các cài đặt trong ứng dụng
  String theme = 'Light';
  bool notificationsEnabled = true;

  // Bước A: Tạo một biến static private để lưu trữ thực thể duy nhất của lớp này (Cache)
  static final Settings _instance = Settings._internal();

  // Bước B: Định nghĩa một Private Constructor (Hàm khởi tạo nội bộ)
  // Ký tự dấu gạch dưới `._` ngăn không cho code từ bên ngoài gọi 'new Settings()' một cách vô tội vạ
  Settings._internal() {
    print('--> [Internal Constructor] Khởi tạo thực thể Settings lần đầu tiên và duy nhất!');
  }

  // Bước C: Định nghĩa Factory Constructor
  // Từ khóa 'factory' cho phép chúng ta tự quyết định đối tượng trả về (thay vì luôn tạo mới như constructor thường)
  factory Settings() {
    print('[Factory Constructor] Được gọi! Trả về thực thể đang nằm trong bộ nhớ đệm (Cache).');
    return _instance; // Luôn trả về đúng một thực thể duy nhất đã tạo ở Bước A
  }
}

// ==========================================
// 2. HÀM MAIN CHẠY THỬ NGHIỆM
// ==========================================
void main() {
  print('=== BẮT ĐẦU BÀI TẬP 5 (FACTORY CONSTRUCTORS & CACHE) ===\n');

  print('--- Khởi tạo thực thể thứ nhất (biến a) ---');
  final a = Settings(); 
  
  print('\n--- Khởi tạo thực thể thứ hai (biến b) ---');
  final b = Settings();

  print('\n--------------------------------------------------');
  print('--- TIẾN HÀNH KIỂM TRA ĐỒNG NHẤT ---');

  // Bước D: Xác thực xem hai biến a và b có thực sự trỏ chung vào một vùng nhớ hay không
  final isIdentical = identical(a, b);
  print('Kết quả của hàm identical(a, b): $isIdentical'); // Sẽ trả về true

  if (isIdentical) {
    print('==> XÁC NHẬN: Cả "a" và "b" đều tham chiếu tới CÙNG MỘT ĐỐI TƯỢNG duy nhất.');
  } else {
    print('==> THẤT BẠI: Hai đối tượng đang nằm ở hai vùng nhớ khác nhau.');
  }

  print('\n--- THỬ NGHIỆM THAY ĐỔI DỮ LIỆU ĐỂ CHỨNG MINH ---');
  // Thay đổi thuộc tính trên biến a
  print('Thay đổi giao diện trên biến "a" thành "Dark Mode"...');
  a.theme = 'Dark';

  // Kiểm tra thuộc tính trên biến b xem có tự cập nhật theo không
  print('Giao diện hiển thị kiểm tra từ biến "b": ${b.theme}'); 
  print('(Vì a và b là một, nên sửa a thì dữ liệu của b cũng thay đổi tương ứng!)');

  print('\n=== KẾT THÚC BÀI TẬP 5 ===');
}