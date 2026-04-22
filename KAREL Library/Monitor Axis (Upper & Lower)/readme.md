# MON_AXIS Program Documentation

## 1. Program Purpose

`MON_AXIS` is a monitoring program that continuously records the maximum and minimum joint angles of the robot's 6 axes in real time.

It updates the stored values during program execution and can be used for:

- Axis range monitoring
- Motion analysis
- Robot calibration support
- Diagnostic logging

---

## 2. Program Function

The program performs the following tasks:

1. Reads the current joint positions of the robot
2. Stores the initial joint angles as both maximum and minimum values
3. Continuously updates the maximum and minimum angles for each axis
4. Repeats the monitoring loop with a fixed delay

---

## 3. Data Structures

### 3.1 `AXIS_ANGL_T`

A structure used to store the tracked angle range for each axis.

| Field | Meaning |
|---|---|
| `max_angle` | Maximum recorded angle of the axis |
| `min_angle` | Minimum recorded angle of the axis |

---

## 4. Variables

| Variable | Meaning |
|---|---|
| `axis_angle` | Array storing the max/min angle values for all 6 axes |
| `curjpos_arry` | Current joint angle array |
| `indexi` | Loop index |

---

## 5. Routines

### 5.1 `GET_CURJPOS`
Retrieves the current robot joint positions and converts them into a real-valued angle array.

#### Functionality
- Calls the system joint position function
- Converts the result into relative joint angles
- Returns the current angle array

---

### 5.2 `MAX`
Returns the larger of two real values.

### 5.3 `MIN`
Returns the smaller of two real values.

---

## 6. Program Workflow

### Step 1: Initialization
The program first reads the current joint positions and uses them to initialize both:

- `max_angle`
- `min_angle`

for each of the 6 axes.

### Step 2: Monitoring Loop
The program enters an infinite loop:

1. Read the current joint positions
2. Compare each axis value with the stored maximum and minimum
3. Update the values if a new maximum or minimum is found
4. Wait 20 ms
5. Repeat

---

## 7. Monitoring Logic

For each axis:

- If the current angle is greater than the stored maximum, update `max_angle`
- If the current angle is smaller than the stored minimum, update `min_angle`

This ensures that the program continuously tracks the full angular range reached during execution.

---

## 8. Delay Handling

The program uses a fixed delay of 20 ms:

```text
DELAY 20
```

This prevents excessive polling and reduces controller load while still providing near real-time monitoring.

---

## 9. Typical Use Cases

This program is useful for:

- Verifying robot axis travel limits
- Tracking motion extremes during testing
- Monitoring robot movement behavior
- Supporting maintenance and diagnostics

---

## 10. Important Notes

### 10.1 Continuous Execution
The program loops indefinitely until manually stopped or aborted.

### 10.2 Initial Values
The first sampled joint positions are used as the initial reference for both maximum and minimum values.

### 10.3 Controller Dependency
The routine depends on controller-specific joint position and conversion functions.

---

## 11. Summary

`MON_AXIS` is a real-time monitoring tool for robot joint angles.  
It continuously records the maximum and minimum positions reached by each of the 6 axes during program execution.
