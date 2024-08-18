// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learning_system/core/utils/app_string.dart';
// import 'package:learning_system/core/utils/color_manager.dart';
// import 'package:learning_system/core/utils/icon_manager.dart';
// import 'package:learning_system/core/utils/style_manager.dart';
// import 'package:learning_system/core/utils/values_manager.dart';
// import 'package:learning_system/core/widgets/new_search/search_textfield.dart';
// import 'package:learning_system/src/features/institute/cubit/search_cubit/search_cubit.dart';
// import 'package:learning_system/src/features/institute/cubit/search_cubit/search_state.dart';
// import 'package:learning_system/src/features/user/cubit/search_cubit/course_item.dart';
// import 'package:learning_system/src/features/user/cubit/search_cubit/search_cubit.dart';
// import 'package:learning_system/src/features/user/cubit/search_cubit/search_state.dart';

// class SliverAppBarScholarship extends StatelessWidget {
//   SliverAppBarScholarship(
//       {super.key, required this.onChanged, required this.iconClosePressed});
//   void Function(String) onChanged;
//   void Function() iconClosePressed;
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       leading: IconButton(
//         color: ColorManager.white,
//         icon: IconManager.arrowLeft,
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       backgroundColor: ColorManager.SecondaryColorLogo,
//       expandedHeight: AppSize.s160,
//       floating: true,
//       pinned: true,
//       snap: false,
//       title: RichText(
//         text: TextSpan(
//           text: "Scholarships",
//           style: getBoldStyle(fontSize: 25, color: ColorManager.white),
//         ),
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         background: Stack(children: [
//           Positioned(
//             top: AppPadding.p100,
//             left: AppPadding.p16,
//             right: AppPadding.p16,
//             child:
//                 BlocBuilder<SearchScholarshipsCubit, SearchScholarshipsState>(
//               builder: (context, state) {
//                 return SearchTextField(
//                   onChanged: onChanged,
//                   iconClosePressed: iconClosePressed,
//                 );
//               },
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
