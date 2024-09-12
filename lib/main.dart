import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = 'key';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stripe error demo',
      home: Scaffold(
        body: Center(
          child: OpacityCardField(),
        )
      )
    );
  }
}

class OpacityCardField extends StatefulWidget {
  const OpacityCardField({super.key});

  @override
  State<StatefulWidget> createState() {
    return OpacityCardFieldState();
  }
}

class OpacityCardFieldState extends State<OpacityCardField> with SingleTickerProviderStateMixin {
  late final _animationCtrl = AnimationController(
    vsync: this,
    // Set to a non-zero value, e.g. 0.1 to avoid issue.
    lowerBound: 0,
    upperBound: 1,
    duration: const Duration(seconds: 5)
  );

  @override
  void initState() { 
    super.initState();
    _animationCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationCtrl,
      child: const CardField(),
    );
  }
}
