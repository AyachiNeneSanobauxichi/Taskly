import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:pretty_dio_logger/pretty_dio_logger.dart";
import "package:todo_app_v1/core/config/index.dart";
import "package:todo_app_v1/core/network/index.dart";
import "package:todo_app_v1/core/storage/index.dart";

// 说明：本仓库当前 Flutter SDK（analyzer 8.4.1 / meta 1.17.0）无法运行
// riverpod_generator（其 analyzer_utils/source_helper 依赖 analyzer 9 的新 API），
// 故 provider 暂用「手写」而非 @riverpod 代码生成。等价的注解写法与差异见
// agent/study/riverpod-codegen-issue.md。改动 provider 无需再跑 build_runner。

/// 安全存储单例：token 等敏感数据的读写入口。
final secureStorageProvider = Provider<SecureStorage>(
  (ref) => const SecureStorage(FlutterSecureStorage()),
);

/// 全局唯一 Dio 实例。
///
/// 集中配置 baseUrl / 超时 / 公共头，并按顺序挂载拦截器：
/// 鉴权(注入 token) → 解包(信封) → 错误映射 → 日志(仅 debug)。
/// 顺序要点：ErrorInterceptor 必须在 ResponseInterceptor 之后，
/// 才能接住后者 reject 出的业务错误。provider 销毁时关闭连接。
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: const {"Content-Type": "application/json"},
    ),
  );
  dio.interceptors.addAll([
    AuthInterceptor(ref.watch(secureStorageProvider)),
    ResponseInterceptor(),
    ErrorInterceptor(),
    // 仅 debug 且配置开启时打印，避免生产泄露请求/响应体。
    if (kDebugMode && Env.enableLogging)
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
  ]);
  ref.onDispose(dio.close);
  return dio;
});

/// 网络访问门面：业务层只依赖 `DioClient`，不直接接触 `Dio`。
final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(ref.watch(dioProvider)),
);
