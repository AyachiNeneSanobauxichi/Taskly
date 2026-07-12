import "package:dio/dio.dart";
import "package:todo_app_v1/core/storage/secure_storage.dart";

/// 鉴权拦截器：为每个请求注入 `Authorization: Bearer <token>`。
///
/// token 来源为安全存储（Keychain/Keystore），登录成功后写入；未登录（无 token）
/// 时不加该头，让公开接口正常访问。
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storage);

  final SecureStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.readToken();
    if (token != null && token.isNotEmpty) {
      // 按后端约定：值为 "Bearer " 前缀拼接 token。
      options.headers["Authorization"] = "Bearer $token";
    }
    handler.next(options);
  }

  // TODO(auth): 收到 401 时应刷新令牌或触发登出并跳登录页；待登录/刷新接口
  //   与全局导航就绪后，在此补 onError 的 401 处理（含刷新后重放请求）。
}
