import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/src/features/teacher/data/models/get/get_all_messages_teacher_model.dart';

class MessagesTeacherWidget extends StatelessWidget {
  const MessagesTeacherWidget({
    super.key,
    required this.messages,
    required this.childCount,
  });
  final List<Messages> messages;
  final int childCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: ColorManager.white,
            backgroundColor: ColorManager.SecondaryColorLogo,
            title: RichText(
              text: TextSpan(
                text: "Messages",
                style: getSemiBoldStyle(
                    fontSize: FontSize.s24, color: ColorManager.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12, vertical: AppPadding.p8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(2),
                      // color: ColorManager.primary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: RichText(
                              text: TextSpan(
                                text: messages[index].instituteName,
                                style: getBoldStyle(
                                    fontSize: FontSize.s16,
                                    color: ColorManager.black),
                              ),
                            ),
                          ),
                          Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: RichText(
                              text: TextSpan(
                                text: messages[index].theMessage,
                                style: getRegularStyle(
                                    fontSize: FontSize.s16,
                                    color: ColorManager.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: childCount,
            ),
          ),
        ],
      ),
    );
  }
}
