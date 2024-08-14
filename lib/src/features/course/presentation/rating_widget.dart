import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../cubit/rate/rating_cubit.dart';

class RatingWidgetCourse extends StatelessWidget {
  final bool hasPurchasedCourse; // أضف هذا المتغير

  RatingWidgetCourse({required this.hasPurchasedCourse}); // أضف هذا المعامل

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubit, double>(
      builder: (context, rating) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Rate :",
                style: getBoldStyle(
                    fontSize: AppSize.s18, color: ColorManager.black),
              ),
            ),
            Card(),
            hasPurchasedCourse
                ? RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: AppSize.s24,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ColorManager.primaryColorLogo,
                    ),
                    onRatingUpdate: (newRating) {
                      context.read<RatingCubit>().updateRating(newRating);
                    },
                  )
                : RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ColorManager.primaryColorLogo,
                    ),
                    itemCount: 5,
                    itemSize: AppSize.s24,
                    direction: Axis.horizontal,
                  ),
          ],
        );
      },
    );
  }
}
