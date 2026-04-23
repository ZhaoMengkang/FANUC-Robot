# CPY_DCS Program Documentation

## 1. Program Purpose

`CPY_DCS` is a robot controller utility used to export DCS configuration data into a text file.

The program reads controller system variables related to DCS and writes them into a file named:

```text
dcsconfig.cm
```

This file can be used for:

- Backup of DCS settings
- Configuration migration
- Offline review of DCS parameters
- Documentation and maintenance

---

## 2. Program Features

The program exports the following DCS-related data:

- DCS IO configuration
- DCS CSI comments
- DCS CSO comments
- DCS Joint Position Check (JPC)
- DCS Joint Space Check (JSC)
- DCS Cartesian Position Check (CPC)
- DCS Cartesian Space Check (CSC)
- User model configuration

---

## 3. Output File

The generated output file is:

```text
dcsconfig.cm
```

Supported save devices:

- Memory Card: `MC:\`
- USB Disk: `UD1:\`
- USB on TP: `UT1:\`

---

## 4. Main Constants

| Constant | Meaning |
|---|---|
| `CPC_MAX` | Maximum number of Cartesian Position Check records |
| `JPC_MAX` | Maximum number of Joint Position Check records |
| `JSC_MAX` | Maximum number of Joint Space Check records |
| `UM_MAX` | Maximum number of User Models |
| `SFIO_MAX` | Maximum number of Safety Function I/O records |

---

## 5. Main Routines

### 5.1 `CNV_INT2STR`
Converts an integer into a string without leading spaces.

### 5.2 `CLR_WND`
Clears the TP display windows.

### 5.3 `SYSVAR_CM`
Reads a controller system variable and converts it into a command string that can be written into the output file.

This routine supports:

- Integer values
- Real values
- String values
- Boolean values

If the variable does not exist or is not initialized, it returns a placeholder string.

---

## 6. Program Flow

### Step 1: Device Selection
The user selects the storage device:

- `MC:\`
- `UD1:\`
- `UT1:\`

If the user selects `Exit`, the program terminates.

### Step 2: File Creation
The file `dcsconfig.cm` is created or overwritten on the selected device.

### Step 3: Export DCS IO Data
The program exports the following variables:

- `$DCSS_IOC[...]`
- `$DCS_C_CSI[...]`
- `$DCS_C_CSO[...]`

### Step 4: Export JPC Data
The program exports the following fields for each JPC entry:

- `$COMMENT`
- `$ENABLE`
- `$MODE`
- `$GRP_NUM`
- `$UPR_LIM`
- `$LWR_LIM`
- `$STOP_TYP`
- `$DSBIO_TYP`
- `$DSBIO_IDX`
- `$ENBL_CALMD`

### Step 5: Export JSC Data
The program exports the following fields for each JSC entry:

- `$COMMENT`
- `$ENABLE`
- `$MODE`
- `$GRP_NUM`
- `$AXS_NUM`
- `$SPD_LIM`
- `$STOP_TYP`
- `$DSBIO_TYP`
- `$DSBIO_IDX`
- `$STOP_TOL`

### Step 6: Export CPC Data
The program exports the following fields for each CPC entry:

- `$COMMENT`
- `$ENABLE`
- `$MODE`
- `$GRP_NUM`
- `$MODEL_NUM[1]`
- `$MODEL_NUM[2]`
- `$MODEL_NUM[3]`
- `$UFRM_NUM`
- `$NUM_VTX`
- `$X[1]` to `$X[8]`
- `$Y[1]` to `$Y[8]`
- `$Z1`
- `$Z2`
- `$STOP_TYP`
- `$DSBIO_TYP`
- `$DSBIO_IDX`
- `$ENBL_CALMD`
- `$USE_PREDICT`
- `$DELAY_TIME`
- `$SPEED_CTRL`
- `$OVR_LIMT[1]` to `$OVR_LIMT[4]`
- `$SPD_LIMT[1]` to `$SPD_LIMT[4]`
- `$DSBL_TYP[1]` to `$DSBL_TYP[4]`
- `$DSBL_IDX[1]` to `$DSBL_IDX[4]`
- `$UTOOL_NUM`
- `$STOP_TOL`

### Step 7: Export CSC Data
The program exports the following fields for each CSC entry:

- `$COMMENT`
- `$ENABLE`
- `$MODE`
- `$GRP_NUM`
- `$TCP`
- `$UFRM_NUM`
- `$SPD_LIM`
- `$STOP_TYP`
- `$DSBIO_TYP`
- `$DSBIO_IDX`
- `$STOP_TOL`

### Step 8: Export User Model Data
The program exports the following fields for each user model:

- `$COMMENT`
- `$USE`
- `$LINK_NO`
- `$LINK_TYPE`
- `$UTOOL_NUM`
- `$SHAPE`
- `$SIZE[1]`
- `$SIZE[2]`
- `$DATA[1]` to `$DATA[6]`

---

## 7. File Format

The file is written as a sequence of controller-style command lines.

Examples:

```text
PRINT "Config DCS JPC[1]"
SETVAR $DCSS_JPC[1].$ENABLE 1
SETVAR $DCSS_JPC[1].$COMMENT "..."
```

The exact format depends on the variable type:

- `SETVAR` for numeric values
- `KCL SET VAR` for string values
- Boolean values are written as `0` or `1`

---

## 8. Error Handling

The program checks for:

- Invalid device selection
- File open errors
- Missing or uninitialized variables
- Invalid system variable types

If a system variable is not available, the routine returns a placeholder string such as:

```text
!!!! <variable> No Exist
```

or

```text
!!!! <variable> Uninitialized
```

---

## 9. Important Notes

### 9.1 System Variable Access
The program depends on the controller system variable structure and may vary across software versions.

### 9.2 Output File Overwrite
The file `dcsconfig.cm` is opened in write mode and may overwrite an existing file.

### 9.3 Controller Dependency
This program is controller-specific and intended for FANUC TP/KCL environments.

---

## 10. Usage Scenario

This program is suitable for:

- DCS backup generation
- System configuration export
- Service documentation
- Robot commissioning support
- Offline parameter review

---

## 11. Summary

`CPY_DCS` is a utility that exports FANUC DCS configuration data into a structured text file.  
It covers IO configuration, DCS check settings, and user model definitions, making it useful for backup and maintenance tasks.
