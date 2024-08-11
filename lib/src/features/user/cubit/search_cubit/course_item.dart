import 'dart:ui';

class CourseItem {
  String image;

  CourseItem(
      {required this.image,
        required this.nameOfCourse,
        required this.nameOfTeacher,
        required this.priceOfCourse,
        required this.rate});

  String nameOfCourse;
  String nameOfTeacher;
  String priceOfCourse;
  String rate;

  static final List<CourseItem> courseItem = [
    CourseItem(
        image:
        "https://www.shutterstock.com/image-vector/elearning-banner-online-education-home-260nw-1694176021.jpg",
        nameOfCourse: "Programing",
        nameOfTeacher: "Ahmad",
        priceOfCourse: "120",
        rate: "6.9"),
    CourseItem(
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwNwwl7IKIe6uMG1D1MypJSerimte-ULrZkw&s",
        nameOfCourse: "Algorithm",
        nameOfTeacher: "Abood",
        priceOfCourse: "130",
        rate: "6.9"),
    CourseItem(
        image:
        "https://www.shutterstock.com/image-vector/elearning-banner-online-education-home-260nw-1694176021.jpg",
        nameOfCourse: "Math",
        nameOfTeacher: "Moayad",
        priceOfCourse: "130",
        rate: "6.9"),
    CourseItem(
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwNwwl7IKIe6uMG1D1MypJSerimte-ULrZkw&s",
        nameOfCourse: "Network",
        nameOfTeacher: "Eyad",
        priceOfCourse: "190",
        rate: "6.9"),
    CourseItem(
        image:
        "https://www.shutterstock.com/image-vector/elearning-banner-online-education-home-260nw-1694176021.jpg",
        nameOfCourse: "Arabic Language",
        nameOfTeacher: "Mohammad",
        priceOfCourse: "120",
        rate: "6.9"),
    CourseItem(
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwNwwl7IKIe6uMG1D1MypJSerimte-ULrZkw&s",
        nameOfCourse: "Since ",
        nameOfTeacher: "Samer",
        priceOfCourse: "180",
        rate: "6.9"),
    CourseItem(
        image:
        "https://www.shutterstock.com/image-vector/elearning-banner-online-education-home-260nw-1694176021.jpg",
        nameOfCourse: "Programing",
        nameOfTeacher: "Souad",
        priceOfCourse: "120",
        rate: "6.9"),
    CourseItem(
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwNwwl7IKIe6uMG1D1MypJSerimte-ULrZkw&s",
        nameOfCourse: "Programing",
        nameOfTeacher: "Abo essam",
        priceOfCourse: "120",
        rate: "6.9"),
  ];
}
