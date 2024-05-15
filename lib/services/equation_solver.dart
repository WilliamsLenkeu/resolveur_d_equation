import 'dart:math' as math;

num cbrt(num x) {
  return math.pow(x, 1/3);
}

List<num> solveCubicEquation(num a, num b, num c, num d) {
  num f = ((3 * c / a) - ((b * b) / (a * a))) / 3;
  num g = ((2 * (b * b * b) / (a * a * a)) - (9 * b * c / (a * a)) + (27 * d / a)) / 27;
  num h = ((g * g) / 4) + ((f * f * f) / 27);

  // Calcul du discriminant pour déterminer le nombre et le type de solutions
  num discriminant = (f * f * f) / 27 + (g * g) / 4;

  if (discriminant > 0) {
    // Une solution réelle et deux solutions complexes
    num r = -(g / 2) + math.sqrt(h);
    num s = (r < 0) ? -cbrt(-r) : cbrt(r);
    num t = -(g / 2) - math.sqrt(h);
    num u = (t < 0) ? -cbrt(-t) : cbrt(t);
    num x1 = (s + u) - (b / (3 * a));
    return [x1.toDouble()];
  } else if (discriminant == 0) {
    // Trois solutions réelles identiques
    num x = -cbrt(g / 2) - (b / (3 * a));
    return [x.toDouble(), x.toDouble(), x.toDouble()];
  } else {
    // Trois solutions réelles différentes
    num i = math.sqrt((g * g) / 4 - h);
    num j = cbrt(i);
    num k = math.acos(-(g / (2 * i)));
    num l = -j;
    num m = math.cos(k / 3);
    num n = math.sqrt(3) * math.sin(k / 3);
    num p = -(b / (3 * a));
    num x1 = 2 * j * math.cos(k / 3) - (b / (3 * a));
    num x2 = l * (m + n) + p;
    num x3 = l * (m - n) + p;
    return [x1.toDouble(), x2.toDouble(), x3.toDouble()];
  }
}