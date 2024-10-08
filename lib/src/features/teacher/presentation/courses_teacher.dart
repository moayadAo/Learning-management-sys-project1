// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learning_system/core/utils/app_string.dart';
// import 'package:learning_system/core/widgets/new_search/search_textfield.dart';
// import 'package:learning_system/src/features/user/cubit/search_cubit/course_item.dart';
// import 'package:learning_system/src/features/user/cubit/search_cubit/search_cubit.dart';
// import 'package:learning_system/src/features/user/cubit/search_cubit/search_state.dart';

// import '../../../../core/utils/color_manager.dart';
// import '../../../../core/utils/icon_manager.dart';
// import '../../../../core/utils/style_manager.dart';
// import '../../../../core/utils/values_manager.dart';

// class CoursesTeacher extends StatelessWidget {
//   CoursesTeacher({super.key});
//   final List<CourseItem> course = CourseItem.courseItem;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SearchCubit(course),
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               leading: IconButton(
//                 color: ColorManager.white,
//                 icon: IconManager.arrowLeft,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               backgroundColor: ColorManager.SecondaryColorLogo,
//               expandedHeight: AppSize.s160,
//               floating: true,
//               pinned: true,
//               snap: false,
//               title: RichText(
//                 text: TextSpan(
//                   text: "Enroll Course",
//                   style: getBoldStyle(fontSize: 25, color: ColorManager.white),
//                 ),
//               ),
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Stack(children: [
//                   Positioned(
//                     top: AppPadding.p100,
//                     left: AppPadding.p16,
//                     right: AppPadding.p16,
//                     child: BlocBuilder<SearchCubit, SearchState>(
//                       builder: (context, state) {
//                         return SearchTextField(
//                           onChanged: (query) =>
//                               context.read<SearchCubit>().updateSearch(query),
//                           iconClosePressed: () =>
//                               context.read<SearchCubit>().clearSearch(),
//                         );
//                       },
//                     ),
//                   ),
//                 ]),
//               ),
//             ),
//             BlocBuilder<SearchCubit, SearchState>(
//               builder: (context, state) {
//                 return SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                       final course = state.filteredCourses[index];
//                       return InkWell(
//                         onTap: () {
//                           Navigator.pushNamed(
//                               context, AppRoute.coursePageScreen);
//                         },
//                         child: Container(
//                           height: AppSize.s130,
//                           width:
//                           AppSize.s100 * 2.6, // Adjust the width as needed
//                           margin: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: ColorManager.white,
//                             border: Border.all(),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   width: AppSize.s120,
//                                   height: AppSize.s120,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(),
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: ColorManager.primaryColorLogo,
//                                     image: DecorationImage(
//                                       image: NetworkImage(course.image),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: AppSize.s40,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   RichText(
//                                     text: TextSpan(
//                                       text: course.nameOfCourse,
//                                       style: getBoldStyle(
//                                           fontSize: AppSize.s20,
//                                           color: ColorManager.black),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: AppSize.s10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       IconManager.user,
//                                       const SizedBox(
//                                           width:
//                                           AppSize.s4), // Add some spacing
//                                       RichText(
//                                         text: TextSpan(
//                                           text: course.nameOfTeacher,
//                                           style: getTitleMeduim(
//                                               fontSize: AppSize.s14,
//                                               color: ColorManager.grayLight),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: AppPadding.p6,
//                                   ),
//                                   Row(
//                                     children: [
//                                       RichText(
//                                           text: TextSpan(
//                                             text: "\$${course.priceOfCourse}",
//                                             style: getHeadLineLarge(
//                                               fontSize: AppSize.s16,
//                                               color:
//                                               ColorManager.SecondaryColorLogo,
//                                             ),
//                                           )),
//                                       const SizedBox(
//                                         width: AppSize.s60,
//                                       ),
//                                       IconManager.star,
//                                       const SizedBox(
//                                           width: 4), // Add some spacing
//                                       RichText(
//                                         text: TextSpan(
//                                           text: course.rate,
//                                           style: getMediumStyle(
//                                               color: ColorManager.lightGrey),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     childCount: state.filteredCourses.length,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
