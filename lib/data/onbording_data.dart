import 'package:expenz_app/models/onbording_model.dart';

class OnbordingData {
  final List<OnbordingModel> onbordingDataList = [
    OnbordingModel(
        imgUrl: "assets/images/onboard_1.png",
        title: "Gain total control\nof your money",
        discription: "Become your own money manager and make every cent count"),
    OnbordingModel(
        imgUrl: "assets/images/onboard_2.png",
        title: "Know where your \nmoney goes",
        discription:
            "Track your transaction easily, with categories and financial report "),
    OnbordingModel(
        imgUrl: "assets/images/onboard_3.png",
        title: "Planning ahead",
        discription: "Setup your budget for each category so you in control"),
  ];
}
