import 'dart:convert';
import 'dart:io'; // Sử dụng HttpClient có sẵn trong SDK thuần của Dart

// ==========================================
// 1. ĐỊNH NGHĨA STUDENT MODEL 
// ==========================================
class Student {
  final String id;
  final String fullname;
  final String age;
  final bool sex;

  Student({
    required this.id, 
    required this.fullname, 
    required this.age, 
    required this.sex,
  });

  // Factory constructor
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as String? ?? '', 
      fullname: json['Fullname'] as String? ?? 'Không có tên', 
      age: json['age'] as String? ?? '0',
      sex: json['sex'] as bool? ?? false,
    );
  }

  // Hàm helper chuyển đổi bool sang chuỗi hiển thị giới tính
  String get genderString => sex ? 'Nam' : 'Nữ';

  @override
  String toString() => 'Sinh Viên [ID: $id] - Tên: $fullname | Tuổi: $age | Giới tính: $genderString';
}

// ==========================================
// 2. TRIỂN KHAI STUDENT REPOSITORY (DART:IO PURE)
// ==========================================
class StudentRepository {
  // Đường link MockAPI lấy danh sách Students (đã được tạo sẵn với dữ liệu mẫu)
  final String _apiUrl = 'https://690925142d902d0651b2ccc8.mockapi.io/Students';

  // Hàm fetchStudents() trả về một Future chứa danh sách Sinh viên
  Future<List<Student>> fetchStudents() async {
    print('--> [Repository] Đang kết nối mạng và gọi MockAPI bằng HttpClient...');

    final uri = Uri.parse(_apiUrl);
    final client = HttpClient();
    
    try {
      // Khởi tạo request GET
      final request = await client.getUrl(uri);
      // Đóng request và chờ phản hồi từ server
      final httpResponse = await request.close();

      // Kiểm tra nếu trạng thái trả về là 200 (Thành công)
      if (httpResponse.statusCode == 200) {
        print('--> [Repository] Tải dữ liệu từ MockAPI thành công!');
        
        // Giải mã chuỗi JSON nhận được từ response body bằng UTF-8 decoder
        final responseBody = await httpResponse.transform(utf8.decoder).join();
        final decodedData = jsonDecode(responseBody);

        if (decodedData is List) {
          // Duyệt qua danh sách JSON và ép kiểu thành các đối tượng Student
          return decodedData.map<Student>((jsonItem) => Student.fromJson(jsonItem)).toList();
        } else {
          throw Exception('Định dạng dữ liệu trả về từ API không phải là một danh sách (List).');
        }
      } else {
        // Xử lý khi server báo lỗi (ví dụ mã 404, 500,...)
        throw Exception('Không thể tải dữ liệu. Mã phản hồi từ Server: ${httpResponse.statusCode}');
      }
    } finally {
      // Đóng client để giải phóng tài nguyên hệ thống
      client.close();
    }
  }
}

// ==========================================
// 3. HÀM MAIN CHẠY THỬ NGHIỆM
// ==========================================
void main() async {
  print('=== BẮT ĐẦU BÀI TẬP 2 (MOCKAPI PURE DART) ===\n');

  final repository = StudentRepository();

  try {
    print('Đang kích hoạt lấy danh sách sinh viên...');
    
    // Chờ đợi dữ liệu tải về từ internet bằng 'await'
    final List<Student> students = await repository.fetchStudents();

    print('\n [KẾT QUẢ] Đã parse thành công danh sách đối tượng Student!');
    print('Tổng số lượng sinh viên hiện có: ${students.length}');
    print('--------------------------------------------------');
    
    // Vòng lặp in danh sách sinh viên thực tế ra màn hình
    if (students.isEmpty) {
      print(' (Hiện tại danh sách trên MockAPI đang trống.)');
    } else {
      for (var student in students) {
        print('  • $student');
      }
    }

  } catch (error) {
    // Bắt các lỗi ngoại lệ như: Máy tính mất kết nối mạng, sai đường link url, v.v.
    print(' Đã xảy ra lỗi hệ thống: $error');
  }

  print('\n=== KẾT THÚC BÀI TẬP 2 ===');
}