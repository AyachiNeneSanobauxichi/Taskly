import "package:flutter_dotenv/flutter_dotenv.dart";

/// 环境配置的唯一读取入口。
///
/// 为什么集中一处：`.env` 的裸读（`dotenv.env["X"]`）散落各业务会导致 key
/// 拼写漂移、缺省值不一致。这里统一做「读取 + 默认值 + 类型转换」，业务只依赖 `Env`。
/// 若 `.env` 未加载或缺字段，回退到本地开发默认值，保证不会因缺配置而崩溃。
abstract final class Env {
  /// API 根地址（已含全局前缀 `/api`）。默认指向本地后端。
  static String get apiBaseUrl =>
      dotenv.maybeGet("API_BASE_URL") ?? "http://localhost:3000/api";

  /// 是否启用网络详细日志（PrettyDioLogger）。生产应关闭。
  static bool get enableLogging =>
      (dotenv.maybeGet("ENABLE_LOGGING") ?? "true").toLowerCase() == "true";
}
