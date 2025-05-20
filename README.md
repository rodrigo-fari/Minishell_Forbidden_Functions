# Forbidden Functions Tester

╔════════════════════════════════════════╗
║ MAIN MENU ║
╠════════════════════════════════════════╣
║ 1. Introduction ║
║ 2. How to Use ║
║ 3. Customization ║
║ 4. License ║
╚════════════════════════════════════════╝

Add the forbidden functions to the testersrc file, one per line:

Run the script:

The script will scan all .c files in the project directory and display the results:

[OK]: No forbidden functions found in the file.
[KO]: Forbidden functions found, with details about the file and line number.
3. Customization
Adapting the Script to Your Project:
Set the Project Directory:
Update the PROJECT_DIR variable in forbidden.sh to point to your project's root directory:

Define Forbidden Functions:
Edit the testersrc file to include the functions you want to prohibit, one per line.

Modify Output Messages:
Customize the script's output messages to better suit your project's needs. For example, you can change the error or success messages in the echo commands.

4. License
This project is licensed under the MIT License. You are free to use, modify, and distribute this script for any purpose, as long as you provide proper credit to the original creator.

Created by: Your Name
```