// Considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
function sumOfFibonacci() {
  var limit = 4000000
  var a = 0;
  var b = 1;
  var sum = 0;

  while (a < limit) {
    if ( a % 2 === 0) {
      sum += a;
    }
    var c = a + b;
    a = b;
    b = c;
  }
  return sum;
}

console.log(sumOfFibonacci());
