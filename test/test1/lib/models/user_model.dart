class UserModel {
  final String name;
  final String avatarUrl;
  final String? lastMessage;
  final String? lastMessageTime;
  final bool isOnline;

  UserModel({
    required this.name,
    required this.avatarUrl,
    this.lastMessage,
    this.lastMessageTime,
    this.isOnline = false,
  });
}

List<UserModel> dummyUsers = [
  UserModel(
    name: "Lê văn Bầu",
    avatarUrl: "https://i.pravatar.cc/150?img=11",
    lastMessage: "Hôm nay làm bài test Flutter ngon lành chứ anh?",
    lastMessageTime: "12:45 PM",
    isOnline: true,
  ),
  UserModel(
    name: "Nguyễn Văn A",
    avatarUrl: "https://i.pravatar.cc/150?img=12",
    lastMessage: "Chiều nay đi uống cà phê không bồ?",
    lastMessageTime: "11:30 AM",
    isOnline: true,
  ),
  UserModel(
    name: "Trần Thị B",
    avatarUrl: "https://i.pravatar.cc/150?img=5",
    lastMessage: "Đã gửi một ảnh",
    lastMessageTime: "Hôm qua",
    isOnline: false,
  ),
  UserModel(
    name: "Lê Hoàng C",
    avatarUrl: "https://i.pravatar.cc/150?img=13",
    lastMessage: "Kế hoạch tuần tới như nào vậy ạ?",
    lastMessageTime: "Thứ Hai",
    isOnline: false,
  ),
  UserModel(
    name: "Phạm Minh D",
    avatarUrl: "https://i.pravatar.cc/150?img=14",
    lastMessage: "Ok anh, chốt thế nhé!",
    lastMessageTime: "09/06",
    isOnline: true,
  ),
  UserModel(
    name: "Hoàng Gia Bảo",
    avatarUrl: "https://i.pravatar.cc/150?img=15",
    lastMessage: "Anh check giúp em cái Pull Request này với.",
    lastMessageTime: "08/06",
    isOnline: true,
  ),
  UserModel(
    name: "Nguyễn Thùy Linh",
    avatarUrl: "https://i.pravatar.cc/150?img=26",
    lastMessage: "Dạ em nhận được thông tin rồi ạ.",
    lastMessageTime: "07/06",
    isOnline: false,
  ),
  UserModel(
    name: "Đặng Đình Toàn",
    avatarUrl: "https://i.pravatar.cc/150?img=18",
    lastMessage: "Lát nữa có đá bóng không mấy ông?",
    lastMessageTime: "06/06",
    isOnline: true,
  ),
  UserModel(
    name: "Vũ Thị Hồng",
    avatarUrl: "https://i.pravatar.cc/150?img=32",
    lastMessage: "Chúc mừng sinh nhật muộn nha khứa!",
    lastMessageTime: "05/06",
    isOnline: false,
  ),
  UserModel(
    name: "Bùi Anh Tú",
    avatarUrl: "https://i.pravatar.cc/150?img=33",
    lastMessage: "Bên mình đang tuyển Python Developer đúng không anh?",
    lastMessageTime: "04/06",
    isOnline: true,
  ),
  UserModel(
    name: "Phan Thanh Trúc",
    avatarUrl: "https://i.pravatar.cc/150?img=41",
    lastMessage: "Haha hài hước ghê.",
    lastMessageTime: "02/06",
    isOnline: false,
  ),
  UserModel(
    name: "Đỗ Hùng Dũng",
    avatarUrl: "https://i.pravatar.cc/150?img=60",
    lastMessage: "Cảm ơn anh nhiều nha.",
    lastMessageTime: "30/05",
    isOnline: false,
  ),
];