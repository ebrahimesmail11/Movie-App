import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_setup_app/Model/Movie_Model.dart';
import 'package:movie_setup_app/Servers/Movie_servers_http.dart';
import 'package:movie_setup_app/Widget/Movie_Slider.dart';
import 'package:movie_setup_app/Widget/Tending_Slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;

  @override
  void initState() {
    trendingMovies=MovieHttp().getTrendingMovies();
    topRatedMovies=MovieHttp().getTopedMovies();
    upComingMovies=MovieHttp().getUpComingMovies();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
            "assets/flutflix.png",
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              SizedBox(height: 16,),
             SizedBox(
               child: FutureBuilder(
                 future: trendingMovies,
                 builder: (context,snapshot){
                   if(snapshot.hasData){
                     final data=snapshot.data;
                     return TrendingSlider(snapshot: snapshot,);
                   }else if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                   }else{
                     return Center(child: CircularProgressIndicator(),);
                   }
                 },
               ),
             ),
              SizedBox(height:32,),
              Text(
                'Top rated movies',
                style: GoogleFonts.aBeeZee(fontSize: 25,),
              ),
              SizedBox(height: 32,),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      final data=snapshot.data;
                      return MovieSlider(snapshot: snapshot,);
                    }else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
              SizedBox(height:32,),
              Text(
                'Upcoming movies',
                style: GoogleFonts.aBeeZee(fontSize: 25,),
              ),
              SizedBox(height: 32,),
              SizedBox(
                child: FutureBuilder(
                  future: upComingMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      final data=snapshot.data;
                      return MovieSlider(snapshot: snapshot,);
                    }else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}