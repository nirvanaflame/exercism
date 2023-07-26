#include "armstrong_numbers.h"
#include "math.h"


bool is_armstrong_number(int n) {
  int td = floor(log10(n) + 1);
  int sm = 0;
  for (int i = 0; i < td; i++) {
    int d = (n % (int)pow(10, i + 1)) / (int)pow(10, i);
    sm += (int)pow(d, td);
  }
  return (bool)(sm == n);
}