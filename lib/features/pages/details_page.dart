import 'package:cinema_app/cors/const/consts.dart';
import 'package:cinema_app/features/models/movie_model.dart';
import 'package:cinema_app/features/pages/reservation_screen.dart';
import 'package:cinema_app/features/widgets/movie_info.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Text(
          "Movie Details",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: movie.poster,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            movie.poster,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MovieInfo(
                            icon: Icons.videocam_rounded,
                            name: "Genre",
                            value: movie.genre,
                          ),
                          MovieInfo(
                            icon: Icons.timer,
                            name: "Duration",
                            value: formatTime(
                              Duration(
                                minutes: movie.duration,
                              ),
                            ),
                          ),
                          MovieInfo(
                            icon: Icons.star,
                            name: "Rating",
                            value: "${movie.rating}/10",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                Text(
                  "Synopsis",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  movie.synopsis,
                  style: TextStyle(
                      fontSize: 13,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white60,
                      height: 2),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Color(0xff1c1c27), blurRadius: 60, spreadRadius: 80),
        ]),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          label: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReservationScreen(),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            color: buttonColor,
            height: 70,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Center(
                child: Text(
                  "Get Reservation",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
