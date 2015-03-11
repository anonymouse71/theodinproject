// Find the largest prime factor of nth number

function largestPrimefactor(num) {
  var factor = 2;

  while (num > factor) {
    if (num % factor === 0) {
      num = num / factor;
    } else {
      factor++;
    }
  }
  return factor;
}

console.log(largestPrimefactor(600851475143));
