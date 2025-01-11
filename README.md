# Repair System Automation Script 

## Description

This repository contains a PowerShell script designed to automate system repairs using the System File Checker (SFC) and Deployment Image Servicing and Management (DISM) tools. It simplifies the process of diagnosing and repairing corrupted system files on Windows.

## Features
- Automatically checks for administrator privileges.
- Runs `sfc /scannow` to verify and repair system files.
- Uses DISM to repair the system image if SFC cannot resolve issues.
- Provides user-friendly messages indicating the status of repairs.

## Requirements
- Windows operating system.
- PowerShell 2.0 or later.
- Administrator privileges to execute the script.

## Usage
1. Download the appropriate script for your preferred language:
   - English: `ENRepairSystem.ps1`
   - Traditional Chinese: `TCRepairSystem.ps1`
2. Open PowerShell with Administrator privileges.
3. Navigate to the folder containing the script.
4. Execute the script:
   ```powershell
   # For English version
   .\ENRepairSystem.ps1
   ```
5. Follow the on-screen instructions to complete the repair process.

## Release Notes
### v1.0.0
- Initial release of the Repair System Automation Script.
- Includes SFC and DISM integration for automated repairs.

---

## Language Switch

This README is in English. You can switch to the Traditional Chinese version by clicking the link below:

- [繁體中文 README](TC_README.md)

