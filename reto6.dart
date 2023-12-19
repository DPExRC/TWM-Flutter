import 'dart:io';

void main() {
  stdout.write('Ingrese un número: ');
  int numero = int.parse(stdin.readLineSync()!);

  if (esPrimo(numero)) {
    print('$numero es un número primo.');
  } else {
    print('$numero no es un número primo.');
  }

  if (esPar(numero)) {
    print('$numero es un número par.');
  } else {
    print('$numero es un número impar.');
  }
}

bool esPrimo(int n) {
  if (n <= 1) {
    return false;
  }
  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

bool esPar(int n) {
  return n % 2 == 0;
}
