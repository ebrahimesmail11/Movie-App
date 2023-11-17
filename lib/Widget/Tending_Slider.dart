
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_setup_app/Screen/Details_Screen.dart';
import 'package:movie_setup_app/Widget/Constants.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key,required this.snapshot});
final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.60,
          pageSnapping: true,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context,itemIndex,pageViewIndex){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return DetailsScreen(DtMovie: snapshot.data[itemIndex],);
              }),);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                width: 200,
                height: 300,
               child: Image.network(
                 filterQuality: FilterQuality.high,
                 fit: BoxFit.cover,
                 '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'
               ),
              ),
            ),
          );
        },
      ),
    );
  }
}
