import 'package:flutter/material.dart';
import 'package:learning_system/core/data/models/quiz_model/quiz_model.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsManager.quizIcon),
                ),
              ),
            ),
           // const SizedBox(width: 1000),
            const Text(
              'Your Score: ',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / 9,
                    color: Colors.green,
                    backgroundColor: ColorManager.redBright,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 80),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / QuestionInfo.questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
            UnconstrainedBox(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                splashColor: Colors.black,
                minWidth: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height / 15,
                color: ColorManager.SecondaryColorLogo,
                child: const Text(
                  'Go To Home ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
              ),
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}