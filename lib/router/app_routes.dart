import 'package:flutter/material.dart';
import 'package:flutter_components/models/models.dart';
import 'package:flutter_components/screens/screens.dart';


class AppRoutes {
  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[    
    MenuOption(route: 'listviewOne', icon: Icons.list, name: 'Listview Screen', screen: const ListviewScreen()),
    MenuOption(route: 'listviewTwo', icon: Icons.list_alt, name: 'ListviewTwo Screen', screen: const ListviewTwoScreen()),
    MenuOption(route: 'card', icon: Icons.car_rental, name: 'Card Screen', screen: const CardScreen()),
    MenuOption(route: 'alert', icon: Icons.notification_important, name: 'Alert Screen', screen: const AlertScreen()),
    MenuOption(route: 'avatar', icon: Icons.supervised_user_circle_outlined, name: 'Circule Avatar Screen', screen: const AvatarScreen()),
    MenuOption(route: 'animated', icon: Icons.play_circle_outline_outlined, name: 'Animated Screen', screen: const AnimatedScreen()),
    MenuOption(route: 'inputs', icon: Icons.input_rounded, name: 'Inputs Screen', screen: const InputsScreen()),
    MenuOption(route: 'slider', icon: Icons.slow_motion_video_rounded, name: 'Slider And Checks Screen', screen: const SliderScreen()),
    MenuOption(route: 'listviewbuilder', icon: Icons.build_circle, name: 'List View Builder Screen', screen: const ListViewBuilderScreen()),

  ];


  static Map<String, Widget Function(BuildContext)> getAppRoutes()  {

    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({
      'home' : (BuildContext context ) => const HomeScreen()
    });

    for(final option in menuOption) {
      appRoutes.addAll({
        option.route : (BuildContext context ) => option.screen
      });
    }
    return  appRoutes;
  }
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home' :(BuildContext context) =>  const HomeScreen(),
  //   'listviewOne' :(BuildContext context) =>  const ListviewScreen(),
  //   'listviewTwo' :(BuildContext context) =>  const ListviewTwoScreen(),
  //   'card' :(BuildContext context) =>  const Card(),
  //   'alert' :(BuildContext context) =>  const AlertScreen(),
  // };
  
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return  MaterialPageRoute(
      builder:(context) => const NotFoundScreen()
    );
  }
}