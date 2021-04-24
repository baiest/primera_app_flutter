import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review('assets/img/sebas.jpg', "Sebastian Tamayo", "1 review 5 photos",
            "Very nice"),
        Review('assets/img/mapa.jpg', "Maria Paula", "1 review 3 photos",
            "Hola que tal?"),
        Review('assets/img/victor.jpg', "Victor Manuel", "1 review 7 photos",
            "Panaaaaaaaaa"),
      ],
    );
  }
}
