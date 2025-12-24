enum Status { padding, done }

extension StatusExtension on Status {
  String get label {
    switch (this) {
      case Status.padding:
        return "يتم التجهيز";
      case Status.done:
        return "تم التسليم";
    }
  }
}

enum Drink { coffee, tea, turkishCoffee }

extension DrinkExtension on Drink {
  String get label {
    switch (this) {
      case Drink.coffee:
        return "قهوة";
      case Drink.tea:
        return "شاي";
      case Drink.turkishCoffee:
        return "قهوة تركي";
    }
  }
}

extension ImageExtension on Drink {
  String get image {
    switch (this) {
      case Drink.coffee:
        return "coffee.png";
      case Drink.tea:
        return "tea.jpg";
      case Drink.turkishCoffee:
        return "turkishCoffee.png";
    }
  }
}
