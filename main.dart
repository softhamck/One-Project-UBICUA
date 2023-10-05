import 'dart:io';

List <dynamic> inventario=[];

//Función principal
void main() {
  mostrar_menu();
  String? value = stdin.readLineSync();
  int number = 0;
  
  if (value != null && value.isNotEmpty) { //'value' no es nulo y contiene al menos un carácter
    if (checkN(value)) { // evalua que sea 'value' es un número
      number = int.parse(value);
      switch (number) {
        case 1:
          addPeluchito();
          main();
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
  stdout.write("Ingrese el nombre del peluche: ");
  String? nombre = stdin.readLineSync();
  stdout.write("Ingrese el precio del peluche: ");
  double precio = double.parse(stdin.readLineSync()!);
  stdout.write("Ingrese la cantidad en stock del peluche: ");
  int stock = int.parse(stdin.readLineSync()!);
  
  double ventas = 0; // Inicializamos ventas a 0
  int tot = 0;      // Inicializamos tot a 0
  
  var grupo = [nombre, precio, stock, ventas, tot];
  inventario.add(grupo);

  print("Peluche agregado con éxito!");
}


void searchPeluchito() {
  // Lógica para la opción 2
  stdout.write("Ingrese el nombre del peluche que desea buscar: ");
  String? busqueda = stdin.readLineSync();
  bool encontrado = false;

  for (var grupo in inventario) {
    String nombre = grupo[0];
    double precio = grupo[1];
    int stock = grupo[2];

    if (nombre.toLowerCase() == busqueda!.toLowerCase()) {
      print("Peluche encontrado:");
      print("Nombre: $nombre | Cantidad en Stock: $stock | Valor: \$$precio");
      encontrado = true;
      break;
    }
  }

  if (!encontrado) {
    print("Peluche \"$busqueda\" no encontrado en el inventario.");
  }
}

void deletePeluchito() {
  // Lógica para la opción 3
  stdout.write("Ingrese el nombre del peluche que desea eliminar: ");
  String? busqueda = stdin.readLineSync();
  bool encontrado = false;

  for (var grupo in inventario) {
    String nombre = grupo[0];

    if (nombre.toLowerCase() == busqueda!.toLowerCase()) {
      inventario.remove(grupo);
      print("Peluche \"$nombre\" eliminado del inventario.");
      encontrado = true;
      break;
    }
  }

  if (!encontrado) {
    print("Peluche \"$busqueda\" no encontrado en el inventario.");
  }
}

void showInventary() {
  // Lógica para la opción 4
  print("Inventario de Peluches:");
  if (inventario.isEmpty) {
    print("El inventario está vacío.");
  } else {
    for (var grupo in inventario) {
      String nombre = grupo[0];
      double precio = grupo[1];
      int stock = grupo[2];

      print("Nombre: $nombre | Precio: \$$precio | Stock: $stock");
    }
  }
}

void makeSale() {
  // Lógica para la opción 5
  stdout.write("Ingrese el nombre del peluche que desea vender: ");
  String? busqueda = stdin.readLineSync();
  bool encontrado = false;

  for (var grupo in inventario) {
    String nombre = grupo[0];

    if (nombre.toLowerCase() == busqueda!.toLowerCase()) {
      print("Peluche \"$nombre\" encontrado en el inventario.");

      stdout.write("Ingrese la cantidad que desea vender: ");
      String? cantidadVendida = stdin.readLineSync();
      
      if (cantidadVendida != null && cantidadVendida.isNotEmpty) {
        int cantidad = int.tryParse(cantidadVendida) ?? 0;

        if (cantidad <= 0) {
          print("La cantidad debe ser un número positivo.");
        } else if (cantidad <= grupo[2]) {
          grupo[2] -= cantidad;
          // Almacenar la cantidad vendida en la variable grupo
          grupo[3] += cantidad;
          
          print("Venta de $cantidad peluches \"$nombre\" realizada con éxito.");
        } else {
          print("No hay suficiente stock de \"$nombre\" para realizar la venta.");
        }
      } else {
        print("Cantidad no válida. Debe ingresar un número positivo.");
      }

      encontrado = true;
      break;
    }
  }

  if (!encontrado) {
    print("Peluche \"$busqueda\" no encontrado en el inventario.");
  }
}

void totalProfits() {
  // Lógica para la opción 6
  double totalVentas = 0;
  print("Ventas:");

  if (inventario.isEmpty) {
    print("El inventario está vacío.");
  } else {
    for (var grupo in inventario) {
      String nombre = grupo[0];
      double precio = grupo[1];
      double ventas = grupo[3];
      
      double valorTotalVenta = ventas * precio;
      totalVentas += valorTotalVenta;
      
      print("Nombre: $nombre | Cantidad de Ventas: $ventas | Valor Total de Ventas: \$$valorTotalVenta");
    }
  }

  print("Valor Total de Todas las Ventas: \$$totalVentas");
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
