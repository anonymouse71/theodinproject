//find multiples of 3 and 5!
function sumOfMultiples(max_num) {
  var sum = 0;
  var multiples = [];
  for (var i = 0, len = max_num; i < len; i++) {
    if (i % 3 === 0 || i % 5 === 0) {
      multiples.push(i);
    }
  }
  for (var i in multiples) {
    sum += multiples[i]
  }
  return sum;
}
console.log(sumOfMultiples(1000));
