abstract class TaskCategory {
  String getCategoryName();
  String getStickerImage();
  String getUniqueKey(); // Add this method

   static final TaskCategory pillsCategory = PillsCategory();
  static final TaskCategory foodCategory = FoodCategory();
  static final TaskCategory snacksCategory = SnacksCategory();
  static final TaskCategory waterCategory = WaterCategory();

  static TaskCategory get getPillsCategory => pillsCategory;
  static TaskCategory get getFoodCategory => foodCategory;
  static TaskCategory get getSnacksCategory => snacksCategory;
  static TaskCategory get getWaterCategory => waterCategory;


  TaskCategory();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskCategory &&
        other.getCategoryName() == getCategoryName() &&
        other.getStickerImage() == getStickerImage();
  }

  @override
  int get hashCode {
    return getCategoryName().hashCode ^ getStickerImage().hashCode;
  }
}

class PillsCategory implements TaskCategory {
  @override
  String getCategoryName() {
    return "Pills";
  }

  @override
  String getStickerImage() {
    return 'assets/images/pill.png';
  }

  @override
  String getUniqueKey() {
    return 'Pills'; // Provide a unique key
  }

   PillsCategory();
}

class FoodCategory implements TaskCategory {
  @override
  String getCategoryName() {
    return "Food";
  }

  @override
  String getStickerImage() {
    return 'assets/images/pet-bowl.png';
  }
    @override
  String getUniqueKey() {
    return 'Food'; // Provide a unique key
  }


  FoodCategory();
}

class SnacksCategory implements TaskCategory {
  @override
  String getCategoryName() {
    return "Snack";
  }

  @override
  String getStickerImage() {
    return 'assets/images/paper-bag.png';
  }

    @override
  String getUniqueKey() {
    return 'Snack'; // Provide a unique key
  }


  SnacksCategory();
}

class WaterCategory implements TaskCategory {
  @override
  String getCategoryName() {
    return "Water";
  }

  @override
  String getStickerImage() {
    return 'assets/images/water.png';
  }

    @override
  String getUniqueKey() {
    return 'Water'; // Provide a unique key
  }

  WaterCategory();
}
