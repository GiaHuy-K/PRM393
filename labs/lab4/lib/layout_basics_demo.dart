import 'package:flutter/material.dart';

// 1. Tạo một lớp đối tượng Movie để quản lý dữ liệu cho gọn
class Movie {
  final String title;
  final String description;

  const Movie({required this.title, required this.description});
}

class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Tạo danh sách các bộ phim mẫu giống như trong đề bài yêu cầu
    final List<Movie> movies = [
      const Movie(title: 'Avatar', description: 'Sample description'),
      const Movie(title: 'Inception', description: 'Sample description'),
      const Movie(title: 'Interstellar', description: 'Sample description'),
      const Movie(title: 'Joker', description: 'Sample description'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
      ),
      // Dùng Padding bao quanh toàn bộ body để tạo khoảng cách đều đặn với viền màn hình (16px)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa tiêu đề
          children: [
            // Tiêu đề "Now Playing" ở trên cùng
            const Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Dùng SizedBox tạo khoảng cách 16px giữa tiêu đề và danh sách
            const SizedBox(height: 16),

            // RẤT QUAN TRỌNG: ListView nằm trong Column bắt buộc phải bọc bằng Expanded
            // để nó không chiếm vô hạn không gian gây lỗi tràn màn hình (sẽ học kỹ hơn ở bài 5)
            Expanded(
              child: ListView.builder(
                itemCount: movies.length, // Số lượng phần tử trong danh sách
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  // Dùng Card để tạo hiệu ứng bo góc và đổ bóng nhẹ cho từng dòng phim
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0), // Khoảng cách giữa các Card
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Bo góc Card 12px
                    ),
                    child: ListTile(
                      // Biểu tượng hình tròn chứa chữ cái đầu tiên của tên phim ở đầu hàng
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.1), // Nền xanh nhạt
                        child: Text(
                          movie.title[0], // Lấy chữ cái đầu (A, I, I, J)
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        movie.title,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      subtitle: Text(
                        movie.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}