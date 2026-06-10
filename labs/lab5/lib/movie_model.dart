// Định nghĩa cấu trúc lớp dữ liệu Movie
class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String overview;
  final List<String> genres;
  final double rating;
  final List<String> trailers;

  const Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.overview,
    required this.genres,
    required this.rating,
    required this.trailers,
  });
}

// Dữ liệu mẫu cố định (Static Sample Data) để hiển thị lên ứng dụng
const List<Movie> sampleMovies = [
  Movie(
    id: '1',
    title: 'Avatar: The Way of Water',
    posterUrl: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500&q=80', // Ảnh minh họa rạp phim điện ảnh
    overview: 'Jake Sully lives with his newfound family formed on the extraterrestrial moon of Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Na\'vi race to protect their home.',
    genres: ['Action', 'Adventure', 'Sci-Fi'],
    rating: 7.6,
    trailers: ['Official Trailer 1', 'Official Trailer 2', 'Teaser Trailer'],
  ),
  Movie(
    id: '2',
    title: 'Inception',
    posterUrl: 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=500&q=80', // Ảnh minh họa không gian phim huyền bí
    overview: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project.',
    genres: ['Action', 'Sci-Fi', 'Thriller'],
    rating: 8.8,
    trailers: ['Main Trailer', 'Behind the Scenes'],
  ),
  Movie(
    id: '3',
    title: 'Interstellar',
    posterUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500&q=80', // Ảnh minh họa vũ trụ không gian
    overview: 'When Earth becomes uninhabitable, a team of explorers travels through a wormhole in space in an attempt to ensure humanity\'s survival.',
    genres: ['Adventure', 'Drama', 'Sci-Fi'],
    rating: 8.7,
    trailers: ['Official Trailer', 'Final Trailer'],
  ),
];