import 'package:flutter/material.dart';

class MenuItem{

  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
    });
  
}

const appMenuItems = <MenuItem>[

    MenuItem(
      title: 'Botones', 
      subtitle: 'Varios botones en flutter', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
      ),

      MenuItem(
      title: 'Tarjetas', 
      subtitle: 'Un contenedor estilizado', 
      link: '/cards', 
      icon: Icons.credit_card
      ),

      
      MenuItem(
      title: 'Progress Indicators', 
      subtitle: 'Generales', 
      link: '/progress', 
      icon: Icons.refresh_rounded
      ),
      
      MenuItem(
      title: 'Snackbars y Dialogos', 
      subtitle: 'Indicadores en pantallas', 
      link: '/snackbars', 
      icon: Icons.info_outline
      ),

      MenuItem(
      title: 'Animated Container', 
      subtitle: 'Stateful Widget animado', 
      link: '/animated', 
      icon: Icons.check_box_outline_blank_rounded
      ),

       MenuItem(
      title: 'UI controls + Tiles', 
      subtitle: 'Una serie de controles de Flutter', 
      link: '/ui-controls', 
      icon: Icons.car_rental_sharp
      ),

       MenuItem(
      title: 'Introduccion a la app', 
      subtitle: 'Pequeño tutorial introductorio', 
      link: '/tutorial', 
      icon: Icons.accessible_rounded
      ),
  ];