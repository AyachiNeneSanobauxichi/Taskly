import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:todo_app_v1/app/app.dart";

void main() {
  // ProviderScope：Riverpod 根容器，为后续 controller/provider 预留基建。
  runApp(const ProviderScope(child: WsyApp()));
}
