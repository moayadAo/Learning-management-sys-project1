import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../cubit/rate/rating_cubit.dart';

class RatingResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rating Result')),
      body: Center(
        child: BlocBuilder<RatingCubit, double>(
          builder: (context, rating) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Rating:',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 50.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 20),
                Text(
                  rating.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
