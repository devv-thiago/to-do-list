import 'dart:io';
import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? Container() : const SizedBox();
  }
}
