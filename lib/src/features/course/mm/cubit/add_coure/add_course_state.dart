part of 'add_course_cubit.dart';

abstract class AddCourseState {}

final class AddCourseInitial extends AddCourseState {}
final class AddCourseLoading extends AddCourseState {}
final class AddCourseSuccess extends AddCourseState {}
final class AddCourseError extends AddCourseState {}
