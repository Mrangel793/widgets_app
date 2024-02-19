import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //limpiar o ocultar snackbars anteriores
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  //crear nuestro propio dialogo con un metodo
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //para evitar que cuando de click por fuera cierre el dialogo
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Nostrud ullamco eiusmod laborum id eiusmod id proident.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialosgos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                //Mostrar licensias usadas
                showAboutDialog(context: context, children: [
                  const Text(
                      'Enim ex nulla duis laboris enim minim officia sint.')
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar dialogo'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}

/*formas de identificar donde esta el scaffold que puede se mediante la key,
pero hay una forma en general de encontrar el scaffold mas cercano y ahi construir 
el snackbar, que seria mediante: ScaffoldMessenger.of(context).showSnackbar(
  aqui dentro nos pide el widget Snackbar(y dentro tenemos su contenido, content: Text('Hola mundo'))
)*/