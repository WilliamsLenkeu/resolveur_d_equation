import 'dart:math' as math;

num cubicRoot(num x) {
  return x < 0 ? -math.pow(-x, 1/3) : math.pow(x, 1/3);
}

List<num> solveCubicEquation(num coefficientA, num coefficientB, num coefficientC, num coefficientD) {
  num termF = ((3 * coefficientC / coefficientA) - ((coefficientB * coefficientB) / (coefficientA * coefficientA))) / 3;
  num termG = ((2 * (coefficientB * coefficientB * coefficientB) / (coefficientA * coefficientA * coefficientA)) - (9 * coefficientB * coefficientC / (coefficientA * coefficientA)) + (27 * coefficientD / coefficientA)) / 27;
  num termH = ((termG * termG) / 4) + ((termF * termF * termF) / 27);

  // Calcul du discriminant pour déterminer le nombre et le type de solutions
  num discriminant = termH;

  if (discriminant > 0) {
    // Une solution réelle et deux solutions complexes
    num r = -(termG / 2) + math.sqrt(termH);
    num s = cubicRoot(r);
    num t = -(termG / 2) - math.sqrt(termH);
    num u = cubicRoot(t);
    num solution = (s + u) - (coefficientB / (3 * coefficientA));
    return [solution.toDouble()];
  } else if (discriminant == 0) {
    // Trois solutions réelles identiques ou deux réelles (l'une étant double)
    num u1 = cubicRoot(coefficientD / coefficientA);
    num solution1 = -2 * u1 - (coefficientB / (3 * coefficientA));
    num solution2 = u1 - (coefficientB / (3 * coefficientA));
    return [solution1.toDouble(), solution2.toDouble(), solution2.toDouble()];
  } else {
    // Trois solutions réelles différentes
    num i = math.sqrt((termG * termG) / 4 - termH);
    num j = cubicRoot(i);
    num k = math.acos(-(termG / (2 * i)));
    num l = -j;
    num m = math.cos(k / 3);
    num n = math.sqrt(3) * math.sin(k / 3);
    num p = -(coefficientB / (3 * coefficientA));
    num solution1 = 2 * j * math.cos(k / 3) - (coefficientB / (3 * coefficientA));
    num solution2 = l * (m + n) + p;
    num solution3 = l * (m - n) + p;
    return [solution1.toDouble(), solution2.toDouble(), solution3.toDouble()];
  }
}
