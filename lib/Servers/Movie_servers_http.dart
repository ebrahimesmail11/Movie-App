
import 'dart:convert';

import 'package:movie_setup_app/Model/Movie_Model.dart';
import 'package:movie_setup_app/Widget/Constants.dart';
import 'package:http/http.dart' as http;

class MovieHttp{
static const _trendingUrl='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
static const _TopedUrl='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
static const _UpComingUrl='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

// Future<List<Movie>> getTrendingMovies()async{
//   var response=await http.get(Uri.parse(_trendingUrl));
//   if(response.statusCode == 200){
//     Map<String,dynamic> decodeData=jsonDecode(response.body);
//     List<dynamic> results=decodeData['results'];
//     List<Movie> Movieresult=[];
//     for(var result in results){
//       Movie movies=Movie.fromJson(result);
//       Movieresult.add(movies);
//     }
//     return Movieresult;
//   }else
//     throw Exception("Somethings Happened");
//
// }


// Future<List<Movie>> getTopedMovies()async{
//   var response=await http.get(Uri.parse(_TopedUrl));
//   if(response.statusCode == 200){
//     Map<String,dynamic> decodeData=jsonDecode(response.body);
//     List<dynamic> results=decodeData['results'];
//     List<Movie> Movieresult=[];
//     for(var result in results){
//       Movie movies=Movie.fromJson(result);
//       Movieresult.add(movies);
//     }
//     return Movieresult;
//   }else
//     throw Exception("Somethings Happened");
// }


// Future<List<Movie>> getUpComingMovies()async{
//   var response=await http.get(Uri.parse(_UpComingUrl));
//   if(response.statusCode == 200){
//     Map<String,dynamic> decodeData=jsonDecode(response.body);
//     List<dynamic> results=decodeData['results'];
//     List<Movie> Movieresult=[];
//     for(var result in results){
//       Movie movies=Movie.fromJson(result);
//       Movieresult.add(movies);
//     }
//     return Movieresult;
//   }else
//     throw Exception("Somethings Happened");
//
// }

Future<List<Movie>> getTrendingMovies()async {
  var response = await http.get(Uri.parse(_trendingUrl));
  if (response.statusCode == 200) {
    final decodeData = json.decode(response.body)['results'] as List;
    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  } else {
    throw Exception('Something Happened');
  }
}

  Future<List<Movie>> getTopedMovies() async {
    var response = await http.get(Uri.parse(_TopedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }
  Future<List<Movie>> getUpComingMovies() async {
    var response = await http.get(Uri.parse(_UpComingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }
}