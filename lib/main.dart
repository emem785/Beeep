import 'package:beep/Providers/location_service.dart';
import 'package:beep/Providers/payment_plan_provider.dart';
import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UxControl()),
          ChangeNotifierProvider(create: (_) => PaymentProvider()),
          ChangeNotifierProvider(create: (_)=> LocationService()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Space Mono',
            buttonTheme: ButtonThemeData(minWidth: 366, height: 50),
            primaryColor: Colors.brown,            
            textTheme: TextTheme(
                button: TextStyle(fontFamily: 'Nunito', fontSize: 16),
                body1: TextStyle(color: Colors.black)),
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator().generateRoutes(),          
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
