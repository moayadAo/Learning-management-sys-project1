import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../cubit/rate/rating_cubit.dart';

class RatingResultPage extends StatelessWidget {
  const RatingResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating Result')),
      body: Center(
        child: BlocBuilder<RatingCubit, double>(
          builder: (context, rating) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your Rating:',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 50.0,
                  direction: Axis.horizontal,
                ),
                const SizedBox(height: 20),
                Text(
                  rating.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
