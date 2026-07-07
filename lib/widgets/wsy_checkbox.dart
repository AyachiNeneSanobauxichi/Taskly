import "package:flutter/material.dart";
import "package:todo_app_v1/theme/index.dart";

class WsyCheckbox extends StatelessWidget {
  const WsyCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final ValueChanged<bool>? onChanged; // 传 null 表示禁用
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final enabled = onChanged != null;
    return InkWell(
      onTap: enabled ? () => onChanged!(!value) : null,
      borderRadius: BorderRadius.circular(WsyAppRadius.checkbox),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: enabled ? (v) => onChanged!(v ?? false) : null,
          ),
          Expanded(child: label),
        ],
      ),
    );
  }
}
