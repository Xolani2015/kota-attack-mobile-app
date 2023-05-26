abstract class AppSizes {
  AppSizes({
    required this.headerText,
    required this.hearderText2,
  });

  final double headerText;
  final double hearderText2;
}

class CustomSizes implements AppSizes {
  CustomSizes({
    this.headerText = 50,
    this.hearderText2 = 30,
  });

  @override
  double headerText;
  @override
  double hearderText2;
}
