
enum FontConstant {
  regular, medium, semiBold, bold, robotoRegular, robotoBold
}

extension FontConstantExtension on FontConstant? {
  String get getFont {
    switch (this) {
      case FontConstant.regular:
        return "Regular";
      case FontConstant.medium:
        return "Medium";
      case FontConstant.semiBold:
        return "SemiBold";
      case FontConstant.bold:
        return "Bold";
      case FontConstant.robotoRegular:
        return "RobotoRegular";
      case FontConstant.robotoBold:
        return "RobotoBold";
      default:
        return "Regular";
    }
  }
}

enum FontSize {
  smallest,
  small,
  medium,
  big,
  bigger,
  biggest,
  overSize,
}

extension FontSizeExtension on FontSize? {
  double get getSize {
    switch (this) {
      case FontSize.smallest:
        return 10;
      case FontSize.small:
        return 12;
      case FontSize.medium:
        return 14;
      case FontSize.big:
        return 16;
      case FontSize.bigger:
        return 18;
      case FontSize.biggest:
        return 24;
      case FontSize.overSize:
        return 32;
      default:
        return 14;
    }
  }
}