
const String baseApiUrl = 'https://api.themoviedb.org/3';
String path(String path) => '$baseApiUrl/movie/$path?api_key=$apiKey';
String popularEndPoint(String path,int page) => '$baseApiUrl/movie/$path?api_key=$apiKey&page=$page';
String topRatedEndPoint(String path,int page) => '$baseApiUrl/movie/$path?api_key=$apiKey&page=$page';
String nowPlayingEndPoint(String path,int page) => '$baseApiUrl/movie/$path?api_key=$apiKey&page=$page';
String upComingEndPoint(String path,int page) => '$baseApiUrl/movie/$path?api_key=$apiKey&page=$page';
String searchEndPoint(String path,String query) => '$baseApiUrl/$path/movie?api_key=$apiKey&query=$query';
const String apiKey = '740ca5e7fc5fd2770595d34f1ec7ca74';
const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
String imageUrl(String path)=>'$baseImageUrl$path';
String movieDetailsPath(int id) => '$baseApiUrl/movie/$id?api_key=$apiKey';
String creditsPath(int id) => '$baseApiUrl/movie/$id/credits?api_key=$apiKey';
String similarMoviesPath(int id) => '$baseApiUrl/movie/$id/similar?api_key=$apiKey';
String trailerMoviesPath(int id) => '$baseApiUrl/movie/$id/videos?api_key=$apiKey';



