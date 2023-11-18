import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_setup_app/Colors.dart';
import 'package:movie_setup_app/Model/Movie_Model.dart';
import 'package:movie_setup_app/Widget/Back_Button.dart';
import 'package:movie_setup_app/Widget/Constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.DtMovie});
  final Movie DtMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const backButton(),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              // titlePadding: EdgeInsets.only(right: 20,bottom: 20,left: 16),
              background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.network(
                    '${Constants.imagePath}${DtMovie.posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  )),
              title: Text(
                DtMovie.title,
                style: GoogleFonts.belleza(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    'OverView',
                    style: GoogleFonts.openSans(
                        fontSize: 27, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    DtMovie.overview,
                    style: GoogleFonts.roboto(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Release data: ',
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DtMovie.releaseDate,
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Rating:',
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                             Text(
                              '${DtMovie.voteAverage.toStringAsFixed(1)}\n/10',
                              style: GoogleFonts.roboto(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
