class FactorialCalculator {
  Future<int> factorial(int n) {
    return Future.delayed(Duration(seconds: 1), () {
      int result = 1;
      for (int i = 2; i <= n; i++) {
        result *= i;
      }
      print("Factorial of $n: $result");
      return result;
    });
  }

  Future<void> calculateFactorials(List<int> numbers) {
    List<Future<int>> futures = [];
    for (int number in numbers) {
      futures.add(factorial(number));
    }
    return Future.wait(futures).then((_) {
      print("All factorials have been calculated successfully.");
    }).catchError((error) {
      print("Error occurred: $error");
    }).whenComplete(() {
      print("Calculation completed.");
    });
  }
}

void main() {
  List<int> numbers = [5, 6, 7, 8, 9];
  FactorialCalculator calculator = FactorialCalculator();
  calculator.calculateFactorials(numbers);
}
