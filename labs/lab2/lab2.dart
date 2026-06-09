import 'dart:async';

void main() async {
  print('====================================================');
  print('   LAB 2 REPORT - DART ESSENTIALS PRACTICE LAB      ');
  print('====================================================\n');

  // Chạy lần lượt từng bài tập từ 1 đến 5
  runExercise1();
  runExercise2();
  runExercise3();
  runExercise4();
  
  // Vì bài 5 có chứa xử lý bất đồng bộ (Async/Stream) nên ta dùng await để đợi nó chạy xong
  await runExercise5();
}

/// ========================================================
/// EXERCISE 1: BASIC SYNTAX & DATA TYPES
/// ========================================================
void runExercise1() {
  print('--- Exercise 1: Basic Syntax & Data Types ---');

  // Khai báo các biến với các kiểu dữ liệu cốt lõi 
  int age = 21;                             // Kiểu số nguyên (Integer)
  double gpa = 3.85;                        // Kiểu số thực (Double)
  String name = 'Khổng Trần Gia Huy';       // Kiểu chuỗi văn bản (String)
  bool isStudent = true;                    // Kiểu logic Đúng/Sai (Boolean)

  // Sử dụng print() và String Interpolation ($var) để hiển thị giá trị biến đơn giản 
  print('Xin chào, mình tên là $name.');
  print('Năm nay mình $age tuổi.');

  // Sử dụng ${expr} để thực hiện biểu thức logic/tính toán ngay trong chuỗi 
  print('Trạng thái sinh viên: ${isStudent ? "Đang đi học" : "Đã tốt nghiệp"}.');
  print('Điểm GPA hiện tại: $gpa (Làm tròn: ${gpa.round()}).');
  print('Tuổi của $name sau 5 năm nữa: ${age + 5} tuổi.');
  
  print('----------------------------------------------------\n');
}

/// ========================================================
/// EXERCISE 2: COLLECTIONS & OPERATORS
/// ========================================================
void runExercise2() {
  print('--- Exercise 2: Collections & Operators ---');

  // 1. Tạo một List chứa các số nguyên 
  List<int> numbers = [10, 25, 30, 45, 50];
  print('List số nguyên ban đầu: $numbers');

  // Sử dụng toán tử số học (+) và toán tử so sánh (==, &&)  86]
  int sum = numbers[0] + numbers[1]; // 10 + 25 = 35
  bool isLargeSum = (sum > 30) && (sum == 35); 
  print('Tổng của 2 phần tử đầu: $sum -> Thỏa điều kiện (>30 và ==35): $isLargeSum');

  // 2. Tạo một Set (chứa các giá trị duy nhất, không trùng lặp) 
  Set<String> uniqueTags = {'Flutter', 'Dart', 'Mobile'};
  uniqueTags.add('Flutter'); // Thử add trùng một giá trị xem sao 
  uniqueTags.add('Web');     // Thêm một giá trị mới 
  print('Set sau khi thêm phần tử (không trùng lặp): $uniqueTags');

  // 3. Tạo một Map (quản lý theo cặp Key-Value) 
  Map<String, dynamic> courseInfo = {
    'id': 'PRM393',
    'title': 'Mobile Programming',
    'duration': '15 weeks'
  };
  
  // Thực hành map access (truy cập), add (thêm), và remove (xóa) 
  print('Môn học hiện tại: ${courseInfo['title']}'); // Truy cập bằng Key 
  courseInfo['platform'] = 'Flutter';               // Thêm một cặp Key-Value mới 
  courseInfo.remove('duration');                     // Xóa một cặp Key-Value theo Key 
  print('Map sau khi chỉnh sửa: $courseInfo');

  print('----------------------------------------------------\n');
}

/// ========================================================
/// EXERCISE 3: CONTROL FLOW & FUNCTIONS
/// ========================================================
// Hàm viết bằng cú pháp thông thường (Normal Syntax) 
String checkGrade(double score) {
  // Sử dụng khối lệnh if/else để phân loại điểm số 
  if (score >= 9.0) {
    return 'Xuất sắc (Excellent)';
  } else if (score >= 7.0) {
    return 'Khá/Giỏi (Good)';
  } else if (score >= 5.0) {
    return 'Trung bình (Passed)';
  } else {
    return 'Cần cố gắng (Failed)';
  }
}

// Hàm viết bằng cú pháp rút gọn/mũi tên (Arrow Syntax =>) 
bool isWeekend(String day) => day == 'Saturday' || day == 'Sunday';

void runExercise3() {
  print('--- Exercise 3: Control Flow & Functions ---');

  // 1. Kiểm tra điểm số bằng hàm dùng if/else đã viết ở trên
  double myScore = 8.5;
  print('Điểm số: $myScore -> Kết quả xếp loại: ${checkGrade(myScore)}');

  // 2. Sử dụng cấu trúc Switch Case để kiểm tra ngày trong tuần 
  String currentDay = 'Monday';
  switch (currentDay) {
    case 'Monday':
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
    case 'Friday':
      print('$currentDay là ngày trong tuần (Weekday), cố gắng học tập nhé!');
      break;
    case 'Saturday':
    case 'Sunday':
      print('$currentDay là ngày cuối tuần (Weekend), xả hơi thôi!');
      break;
    default:
      print('Ngày không hợp lệ!');
  }

  // 3. Duyệt qua bộ sưu tập bằng for, for-in, và forEach() 
  List<String> frameworkList = ['Flutter', 'React Native', 'Native Android'];

  // Cách A: Sử dụng vòng lặp for truyền thống 
  print('A. Duyệt bằng vòng lặp for:');
  for (int i = 0; i < frameworkList.length; i++) {
    print('   - Vị trí $i: ${frameworkList[i]}');
  }

  // Cách B: Sử dụng vòng lặp for-in (Ngắn gọn hơn) 
  print('B. Duyệt bằng vòng lặp for-in:');
  for (var framework in frameworkList) {
    print('   - Tên: $framework');
  }

  // Cách C: Sử dụng hàm forEach() kết hợp Arrow function 
  print('C. Duyệt bằng hàm forEach():');
  frameworkList.forEach((item) => print('   - Item: $item'));

  print('----------------------------------------------------\n');
}

/// ========================================================
/// EXERCISE 4: INTRO TO OOP
/// ========================================================
// 1. Định nghĩa lớp cha mang tên Car 
class Car {
  String brand; // Thuộc tính (Property) 

  // Hàm khởi tạo mặc định (Default Constructor)
  Car(this.brand);

  // 2. Định nghĩa một Hàm khởi tạo có đặt tên (Named Constructor) 
  Car.anonymous() : brand = 'Unknown Brand';

  // Phương thức hiển thị thông tin (Method) 
  void drive() {
    print('Xe hơi hiệu $brand đang bon bon chạy trên đường.');
  }
}

// 3. Tạo lớp con ElectricCar kế thừa từ lớp Car ]
class ElectricCar extends Car {
  int batteryCapacity; // Thuộc tính riêng của lớp con

  // Hàm khởi tạo của lớp con, gọi super để truyền dữ liệu cho lớp cha
  ElectricCar(String brand, this.batteryCapacity) : super(brand);

  // Ghi đè phương thức (@override) của lớp cha ]
  @override
  void drive() {
    print('Xe điện hiệu $brand đang chạy cực êm. Dung lượng pin hiện tại: $batteryCapacity%');
  }
}

void runExercise4() {
  print('--- Exercise 4: Intro to OOP ---');

  // Khởi tạo các đối tượng và in kết quả ra màn hình ]
  Car myNormalCar = Car('Toyota');
  myNormalCar.drive(); // Chạy phương thức của lớp cha ]

  Car mysteryCar = Car.anonymous();
  print('Xe bí ẩn dùng Named Constructor có thương hiệu là: ${mysteryCar.brand}');

  ElectricCar myTesla = ElectricCar('Tesla Model Y', 85);
  myTesla.drive(); // Chạy phương thức đã được ghi đè ở lớp con ]

  print('----------------------------------------------------\n');
}

/// ========================================================
/// EXERCISE 5: ASYNC, FUTURE, NULL SAFETY & STREAMS
/// ========================================================
// 1. Tạo hàm bất đồng bộ mô phỏng việc tải dữ liệu bằng Future + await ]
Future<String> fetchUserData() async {
  // Sử dụng Future.delayed() để giả lập thời gian chờ 2 giây ]
  await Future.delayed(const Duration(seconds: 2));
  return 'Dữ liệu của Khổng Trần Gia Huy';
}

// 4. Hàm tạo ra một luồng Stream phát số nguyên từ 1 đến 3 một cách bất đồng bộ 
Stream<int> countStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(const Duration(milliseconds: 500)); // Cứ nửa giây phát một số
    yield i; // Từ khóa yield dùng để phát giá trị vào dòng Stream
  }
}

Future<void> runExercise5() async {
  print('--- Exercise 5: Async, Future, Null Safety & Streams ---');

  // Kiểm tra xử lý bất đồng bộ Future ]
  print('Bắt đầu tải dữ liệu người dùng...');
  String data = await fetchUserData(); // Đợi hàm async hoàn thành nhiệm vụ ]
  print('Kết quả nhận được: $data');

  // 2. Thực hành các toán tử an toàn dữ liệu Null-safety (?, ??, !) ]
  String? nullableName; // Dấu '?' cho phép biến này có thể bị gán bằng null ]
  
  // Toán tử '??': Nếu biến bên trái bị null thì lập tức lấy giá trị mặc định bên phải ]
  String displayName = nullableName ?? 'Tên mặc định (Anonymous)';
  print('Tên hiển thị (Sử dụng toán tử ??): $displayName');

  nullableName = 'Gia Huy Flutter';
  // Toán tử '!': Khẳng định chắc chắn với Dart rằng biến này không thể bị null tại thời điểm này ]
  print('Độ dài của tên (Sử dụng toán tử !): ${nullableName!.length}');

  // 3. Thực hành lắng nghe (listen) dữ liệu từ luồng Stream 
  print('Bắt đầu lắng nghe tín hiệu từ dòng Stream số nguyên:');
  
  // Sử dụng await for để lắng nghe từng phần tử được phát ra từ luồng Stream 
  await for (int value in countStream()) {
    print('   -> Stream vừa phát ra số: $value');
  }

  print('Tất cả luồng dữ liệu Stream đã kết thúc hoàn toàn.');
  print('----------------------------------------------------');
}