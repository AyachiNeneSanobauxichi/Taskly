import "package:freezed_annotation/freezed_annotation.dart";

/// Todo 领域枚举（v1）。取值与后端契约一致，`@JsonValue` 供 DTO 序列化直接复用；
/// 各枚举保留 `unknown` 兜底，避免后端新增取值时反序列化直接崩溃。

/// 任务类型。
enum TodoType {
  @JsonValue("normal")
  normal,
  @JsonValue("important")
  important,
  @JsonValue("urgent")
  urgent,
  @JsonValue(null)
  unknown,
}

/// 任务状态。
enum TodoStatus {
  @JsonValue("pending")
  pending,
  @JsonValue("completed")
  completed,
  @JsonValue("doing")
  doing,
  @JsonValue("deleted")
  deleted,
  @JsonValue(null)
  unknown,
}

/// 列表排序字段。
enum TodoSortField {
  @JsonValue("createdAt")
  createdAt,
  @JsonValue("updatedAt")
  updatedAt,
  @JsonValue("type")
  type,
  @JsonValue("status")
  status,
}

/// 列表排序方向。
enum TodoSortOrder {
  @JsonValue("asc")
  asc,
  @JsonValue("desc")
  desc,
}
