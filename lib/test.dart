// import 'dart:math';
//
// class ShapeCalculator {
//
//   double area(String shape, double width, double length) {
//     if (shape == 'rectangle') {
//       return width * length;
//     } else if (shape == 'circle') {
//       return pi * width * width;
//     }
//     return 0;
//   }
//
//   double perimeter(String shape, double width, double length) {
//     if (shape == 'rectangle') {
//       return 2 * (width + length);
//     } else if (shape == 'circle') {
//       return 2 * pi * width;
//     }
//     return 0;
//   }
//
// }
//
//
//
// abstract class Shape {
//   double area();
//   double perimeter();
// }
//
// class Rectangle implements Shape {
//   final double width;
//   final double length;
//
//   Rectangle(this.width, this.length);
//
//   @override
//   double area() => width * length;
//
//   @override
//   double perimeter() => 2 * (width + length);
// }
//
// class Circle implements Shape {
//   final double radius;
//
//   Circle(this.radius);
//
//   @override
//   double area() => pi * radius * radius;
//
//   @override
//   double perimeter() => 2 * pi * radius;
// }
//
//
//
// // class Bird {
// //    String fly() {
// //     return "Flying";
// //   }
// // }
// //
// // class Sparrow extends Bird {}
// //
// // class Penguin extends Bird {}
// //
// // void makeBirdFly(Bird bird) {
// //   bird.fly();
// // }
// //
// // void main() {
// //   Sparrow sparrow = Sparrow();
// //   Penguin penguin = Penguin();
// //
// //   makeBirdFly(sparrow);  // ✅ Works fine
// //   makeBirdFly(penguin);  // ❌ Breaks logic: Penguins can't fly
// // }
//
//
// // Abstract class for birds
//
//
// abstract class Bird {
//   String eat() {
//     return "Eating";
//   }
// }
//
// // Birds that can fly
// abstract class FlyingBird extends Bird {
//   void fly();
// }
//
// class Sparrow extends FlyingBird {
//   @override
//   String fly() {
//     return "Sparrow is flying";
//   }
// }
//
// // Birds that cannot fly
// class Penguin extends Bird {
//   String swim() {
//     return "Penguin is swimming";
//   }
// }
//
// void makeFlyingBirdFly(FlyingBird bird) {
//   bird.fly(); // ✅ Safe now
// }
//
// void main() {
//   Sparrow sparrow = Sparrow();
//   Penguin penguin = Penguin();
//
//   makeFlyingBirdFly(sparrow);  // ✅ Works fine
//   // makeFlyingBirdFly(penguin); // ❌ Compile-time error: Correct!
//
//   penguin.swim(); // ✅ Penguins swim instead of fly
// }

void main(){

}
