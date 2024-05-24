import 'dart:math' as math;

num cbrt(num x) {
  return x < 0 ? -math.pow(-x, 1/3) : math.pow(x, 1/3);
}

List<num> solveCubicEquation(num a, num b, num c, num d) {
  num f = ((3 * c / a) - ((b * b) / (a * a))) / 3;
  num g = ((2 * (b * b * b) / (a * a * a)) - (9 * b * c / (a * a)) + (27 * d / a)) / 27;
  num h = ((g * g) / 4) + ((f * f * f) / 27);

  // Ici j'affecte la valeur du calcul du discriminant pour déterminer le nombre et le type de solutions
  num discriminant = h;

  if (discriminant > 0) {
    // Une solution réelle et deux solutions complexes
    num r = -(g / 2) + math.sqrt(h);
    num s = cbrt(r);
    num t = -(g / 2) - math.sqrt(h);
    num u = cbrt(t);
    num x1 = (s + u) - (b / (3 * a));
    return [x1.toDouble()];
  } else if (discriminant == 0) {
    // Trois solutions réelles identiques ou deux réelles (one being double)
    num u1 = cbrt(d / a);
    num x1 = -2 * u1 - (b / (3 * a));
    num x2 = u1 - (b / (3 * a));
    return [x1.toDouble(), x2.toDouble(), x2.toDouble()];
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
