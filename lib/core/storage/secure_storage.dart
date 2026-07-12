import "package:flutter_secure_storage/flutter_secure_storage.dart";

/// 敏感数据安全存储封装（iOS Keychain / Android Keystore 加密）。
///
/// 为什么单独封装：对外只暴露语义化方法（`readToken` 等），隐藏 key 常量与底层
/// 插件，避免 key 拼写漂移；登出时统一 `clear()` 清空。切勿用 SharedPreferences
/// 明文存 token（红线/skill 10）。
class SecureStorage {
  const SecureStorage(this._storage);

  final FlutterSecureStorage _storage;

  // 存储 key 常量集中在此，业务不直接接触。
  static const String _kAccessToken = "access_token";

  /// 读取访问令牌；未登录返回 null。
  Future<String?> readToken() => _storage.read(key: _kAccessToken);

  /// 写入访问令牌（登录成功后调用）。
  Future<void> writeToken(String token) =>
      _storage.write(key: _kAccessToken, value: token);

  /// 删除访问令牌。
  Future<void> deleteToken() => _storage.delete(key: _kAccessToken);

  /// 清空所有敏感项（登出时调用）。
  Future<void> clear() => _storage.deleteAll();
}
