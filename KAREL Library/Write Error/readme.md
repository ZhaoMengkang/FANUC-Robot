# WRITE_ERROR User Guide

## 1. Overview
`WRITE_ERROR` is a KAREL program used to post **parameterized user alarms** on the teach pendant status bar.

It supports message placeholders such as `{1}` to `{9}`, which are replaced by the values passed in the CALL statement.

---

## 2. Syntax

```pascal
CALL WRITE_ERROR('Alarm text {1} {2}', AlarmLevel, Param1, Param2, ... )
```

---

## 3. Parameters

| Parameter | Description |
|-----------|-------------|
| `Alarm text` | Alarm message string. Supports placeholders `{1}` to `{9}`. |
| `AlarmLevel` | Alarm severity level. `0` = prompt only, `1` = PAUSE.G prompt, `2` = SRVO.G prompt. |
| `Param1` | Replacement value for `{1}`. |
| `Param2` | Replacement value for `{2}`. |
| `Param3` | Replacement value for `{3}`. |
| `Param4` | Replacement value for `{4}`. |
| `Param5` | Replacement value for `{5}`. |
| `Param6` | Replacement value for `{6}`. |
| `Param7` | Replacement value for `{7}`. |

> Notes:
> - Up to 7 replacement parameters are supported in this implementation.
> - Placeholder numbers must be within `1` to `9`.
> - Unsupported or missing placeholders will not be replaced correctly.

---

## 4. Usage Example

```pascal
CALL WRITE_ERROR('Gripper{1} is Not {2}', 2, 3, 'Open')
```

### Example Explanation

| Item | Value | Description |
|------|-------|-------------|
| `CALL WRITE_ERROR` | — | Called KAREL program |
| `'Gripper{1} is Not {2}'` | — | Alarm message with placeholders |
| `2` | — | Alarm level |
| `3` | — | Replacement parameter for `{1}` |
| `'Open'` | — | Replacement parameter for `{2}` |

### Output Example

```text
APSH-092 Gripper3 is Not Open
```

---

## 5. Additional Examples

### Example 1
```pascal
CALL WRITE_ERROR('WAIT FOR DI[{1}] = {2}', 0, 121, 'ON')
```

| Item | Value | Description |
|------|-------|-------------|
| `0` | — | Alarm level: prompt only |
| `121` | — | Replacement parameter for `{1}` |
| `'ON'` | — | Replacement parameter for `{2}` |

### Example 2
```pascal
CALL WRITE_ERROR('Error Place No, GI[1] = {1}', 2, R[1:Override])
```

### Example 3
```pascal
CALL WRITE_ERROR('Int={1} Real={2} Str={3}', 2, 1001, 3.1415, 'Hello')
```

---

## 6. Placeholder Rules
- `{1}` corresponds to the first replacement parameter.
- `{2}` corresponds to the second replacement parameter.
- Up to `{7}` are supported by the current implementation.
- Placeholder digits must be between `1` and `9`.
- If the placeholder format is invalid, it will be treated as plain text.

---

## 7. Notes
- The alarm is posted using `POST_ERR`.
- Parameter values are converted automatically to string format when needed.
- The teach pendant status bar displays the formatted alarm message.

---

## 8. Important Considerations
- Ensure the alarm text uses valid placeholder syntax, such as `{1}` or `{2}`.
- Provide enough replacement parameters for all placeholders used in the message.
- Keep alarm messages concise and clear.
