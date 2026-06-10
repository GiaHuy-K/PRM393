import 'dart:async';

// ==========================================
// 1. ĐỊNH NGHĨA PRODUCT MODEL
// ==========================================
class Product {
  final int id;
  final String name;
  final double price;

  // Constructor để khởi tạo đối tượng Product
  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => 'Product(id: $id, name: $name, price: \$${price.toStringAsFixed(2)})';
}

// ==========================================
// 2. TRIỂN KHAI PRODUCT REPOSITORY
// ==========================================
class ProductRepository {
  // Danh sách sản phẩm giả lập làm cơ sở dữ liệu nội bộ
  final List<Product> _products = [
    Product(id: 1, name: 'Laptop ASUS ROG', price: 1200.00),
    Product(id: 2, name: 'iPhone 15 Pro', price: 999.00),
  ];

  // Khởi tạo StreamController dạng .broadcast() để cho phép nhiều Subscriber cùng lắng nghe
  final StreamController<Product> _liveAddedController = StreamController<Product>.broadcast();

  // Hàm getAll() trả về Future chứa danh sách sản phẩm sau khi giả lập delay 1 giây
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1)); // Giả lập độ trễ mạng
    return List.unmodifiable(_products); // Trả về danh sách read-only để bảo mật dữ liệu
  }

  // Hàm liveAdded() trả về Stream để lắng nghe sản phẩm mới theo thời gian thực
  Stream<Product> liveAdded() {
    return _liveAddedController.stream;
  }

  // Hàm thêm sản phẩm mới - vừa lưu vào danh sách, vừa đẩy vào Stream cho các bên đang lắng nghe
  void addProduct(Product product) {
    _products.add(product);
    _liveAddedController.add(product); // Phát sự kiện (emit item) vào Stream
    print('--> [Repo] Đã thêm sản phẩm mới vào DB: ${product.name}');
  }

  // Đóng StreamController khi không còn sử dụng để tránh rò rỉ bộ nhớ (Memory Leak)
  void dispose() {
    _liveAddedController.close();
  }
}

// ==========================================
// 3. HÀM MAIN CHẠY THỬ NGHIỆM
// ==========================================
void main() async {
  print('=== BẮT ĐẦU BÀI TẬP 1 ===\n');

  final repository = ProductRepository();

  // --- THỬ NGHIỆM STREAM (REAL-TIME UPDATES) ---
  // Thiết lập lắng nghe Stream trước khi sản phẩm mới được thêm vào
  final subscription = repository.liveAdded().listen(
    (product) {
      print(' [Stream - Người nghe 1] Nhận real-time: $product');
    },
    onDone: () => print('Stream đã đóng.'),
  );

  // Thêm một người nghe thứ 2 để chứng minh tính năng của .broadcast()
  final subscription2 = repository.liveAdded().listen((product) {
    print(' [Stream - Người nghe 2] Cũng nhận được: ${product.name}');
  });

  // --- THỬ NGHIỆM FUTURE (GET ALL PRODUCTS) ---
  print('Đang tải danh sách sản phẩm ban đầu...');
  final initialProducts = await repository.getAll();
  print(' Danh sách sản phẩm lấy từ Future (getAll):');
  for (var p in initialProducts) {
    print('   - $p');
  }
  print('--------------------------------------------------\n');

  // --- GIẢ LẬP THÊM SẢN PHẨM MỚI THEO THỜI GIAN THỰC ---
  // Chờ 1 giây rồi thêm sản phẩm thứ nhất
  await Future.delayed(Duration(seconds: 1));
  repository.addProduct(Product(id: 3, name: 'Bàn phím cơ Custom', price: 150.50));

  // Chờ tiếp 1.5 giây nữa rồi thêm sản phẩm thứ hai
  await Future.delayed(Duration(milliseconds: 1500));
  repository.addProduct(Product(id: 4, name: 'Chuột Logitech G Pro', price: 89.90));

  // --- DỌN DẸP TÀI NGUYÊN ---
  // Chờ một chút cho các stream in hết kết quả rồi đóng lại
  await Future.delayed(Duration(seconds: 1));
  await subscription.cancel();
  await subscription2.cancel();
  repository.dispose();

  print('\n=== KẾT THÚC BÀI TẬP 1 ===');
}