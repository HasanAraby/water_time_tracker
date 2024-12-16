import 'dart:math';

double computePercent(int upperLimit, int drunkTillNow) {
  return min(1, drunkTillNow / upperLimit);
}
