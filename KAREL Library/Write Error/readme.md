# WRITE_ERROR 使用说明 / User Guide

## 1. 功能说明 / Function
`WRITE_ERROR` 用于在示教器状态栏中输出**带参数的报警信息**，并可设置报警等级。  
`WRITE_ERROR` is used to display **parameterized alarm messages** on the teach pendant status bar and set the alarm level.

---

## 2. 调用格式 / Syntax

```pascal
CALL WRITE_ERROR('报警文本{1} {2}', 报警等级, 参数1, 参数2, ... )
```

```pascal
CALL WRITE_ERROR('Alarm text {1} {2}', AlarmLevel, Param1, Param2, ... )
```

### 参数说明 / Parameter Description
| 参数 / Parameter | 说明 / Description |
|------|------|
| `报警文本` / `Alarm text` | 字符串，支持 `{1}` ~ `{9}` 作为占位符 / String, supports `{1}` ~ `{9}` as placeholders |
| `报警等级` / `AlarmLevel` | 整数，范围 `0~3` / Integer, range `0~3` |
| `参数1~参数7` / `Param1~Param7` | 用于替换报警文本中的占位符 / Used to replace placeholders in the alarm text |

---

## 3. 占位符规则 / Placeholder Rules
- `{1}` 对应第 1 个替换参数  
  `{1}` corresponds to the 1st replacement parameter

- `{2}` 对应第 2 个替换参数  
  `{2}` corresponds to the 2nd replacement parameter

- 以此类推，最多支持 `{7}`  
  And so on, up to `{7}`

- 占位符中的数字必须为 `1~9`  
  The number inside the placeholder must be within `1~9`

---

## 4. 示例 / Examples

### 示例 1：字符串替换 / String Replacement
```pascal
CALL WRITE_ERROR('Gripper{1} is Not {2}', 2, 3, 'Open')
```

输出示例 / Output example:
```text
APSH-092 Gripper1 is Not Open
```

### 示例 2：等待信号提示 / Waiting Signal Message
```pascal
CALL WRITE_ERROR('WAIT FOR DI[{1}] = {2}', 0, 121, 'ON')
```

### 示例 3：数值参数 / Numeric Parameter
```pascal
CALL WRITE_ERROR('Error Place No, GI[1] = {1}', 2, R[1:Override])
```

### 示例 4：混合类型 / Mixed Types
```pascal
CALL WRITE_ERROR('Int={1} Real={2} Str={3}', 2, 1001, 3.1415, 'Hello')
```

---

## 5. 说明 / Notes
- 报警信息会通过 `POST_ERR` 发布到示教器。  
  The alarm message is posted to the teach pendant via `POST_ERR`.

- 参数类型会自动转换为字符串后进行替换。  
  Parameter types are automatically converted to strings before replacement.

- 报警等级建议按现场实际需求设置。  
  It is recommended to set the alarm level according to actual application needs.

---

## 6. 注意事项 / Important Notes
- 占位符格式必须正确，例如 `{1}`、`{2}`。  
  Placeholder format must be correct, e.g. `{1}`, `{2}`.

- 参数数量不足时，未提供的占位符不会被正确替换。  
  If not enough parameters are provided, placeholders will not be replaced correctly.

- 建议报警文本长度不要过长。  
  It is recommended to keep alarm text reasonably short.
