import 'dart:io';

//Función principal
void main() {
  mostrar_menu();
  String? value = stdin.readLineSync();
  int number = 0;

  if (value != null && value.isNotEmpty) { //'value' no sea nulo y que contenga al menos un carácter
    if (checkN(value)) { // evalua que sea 'value' es un número
      number = int.parse(value);
      switch (number) {
        case 1:
          addPeluchito();
          mostrar_menu();
          break;
        case 2:
          stdout.write("\x1B[2J\x1B[0;0H"); // Limpiar la consola
          searchPeluchito();
          main();
          break;
        case 3:
          stdout.write("\x1B[2J\x1B[0;0H"); // Limpiar la consola
          deletePeluchito();
          main();
          break;
        case 4:
          stdout.write("\x1B[2J\x1B[0;0H"); // Limpiar la consola
          showInventary();
          main();
          break;
        case 5:
          stdout.write("\x1B[2J\x1B[0;0H"); // Limpiar la consola
          makeSale();
          main();
          break;
        case 6:
          stdout.write("\x1B[2J\x1B[0;0H"); // Limpiar la consola
          totalProfits();
          main();
          break;
        case 7:
          stdout.write("\x1B[2J\x1B[0;0H"); // Limpiar la consola
          print("Gracias por ingresar al sistema. Feliz dia!");
          break;
        default:
          print("Número fuera de los límites");
          main();
          break;
      }
    } else {
      print("Entrada no válida. Debe ingresar un número.");
      main();
    }
  } else {
    print("Entrada vacía. Debe ingresar un número.");
    main();
  }
}

//Función para verificar si una cadena se puede convertir en un número entero
bool checkN(String readValue) {
  try {
    int.parse(readValue);
    return true;
  } catch (e) {
    return false;
  }
}

void addPeluchito() {
  // Lógica para la opción 1
}

void searchPeluchito() {
  // Lógica para la opción 2
}

void deletePeluchito() {
  // Lógica para la opción 3
}

void showInventary() {
  // Lógica para la opción 4
}

void makeSale() {
  // Lógica para la opción 5
}

void totalProfits() {
  // Lógica para la opción 6
}

void mostrar_menu() {
  print("*------------------------------------------------------------*");
  print("|                 BIENVENIDO A Peluchitos.com                |");
  print("|------------------------------------------------------------|");
  print("|                    1. Agregar peluchito                    |");
  print("|                    2. Buscar peluchito                     |");
  print("|                    3. Eliminar peluchito                   |");
  print("|                    4. Mostrar Inventario                   |");
  print("|                    5. Realizar Venta                       |");
  print("|                    6. Mostrar ganancias totales            |");
  print("|                    7. Salir                                |");
  print("*------------------------------------------------------------*");
  print(" Ingrese una opción: ");
}