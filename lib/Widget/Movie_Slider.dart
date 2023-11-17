import 'package:flutter/material.dart';
import 'package:movie_setup_app/Screen/Details_Screen.dart';
import 'package:movie_setup_app/Widget/Constants.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key,required this.snapshot});
final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return DetailsScreen(DtMovie: snapshot.data[index]);
                },),);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshot.data![index].posterPath}'
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
