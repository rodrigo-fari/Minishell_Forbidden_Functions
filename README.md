<div align="center">
 <h1>🟢  Forbidden Functions Tester  🔴</h1>
  <img src="https://github.com/user-attachments/assets/e889ca7a-0f7a-4275-b20d-00fded76d5e4" 
       width="800">
  <br>
  <div>
   <a href="https://github.com/rodrigo-fari" target="_blank">
    <img src="https://komarev.com/ghpvc/?username=rodrigo-fari&color=4fa69a&style=flat-square" width="140" alt="Profile Visitors"/>
   </a>
   <a href="https://github.com/rodrigo-fari" target="_blank">
    <img src="https://img.shields.io/static/v1?label=Overview&message=RODRIGO-FARI&color=4fa69a&style=for-the-badge&logo=GitHub" alt="GitHub Overview" width="210"/>
   </a>
  </div>
</div>

<br>
<br>
<br>

## What is this ?

The **Forbidden Functions Tester** is a simple Bash script that helps you detect restricted or undesired functions inside your source code.

Whether you're working on a school project with strict rules or maintaining code quality in a team, this tool gives you a fast and clean way to ensure no forbidden functions sneak in.

It works by scanning all files in a specified directory and matching them against a list of functions you define in a separate file.

---

## How to Use ?

### Step-by-step:

1. **Clone the repository** (or just copy the script if you prefer):
```bash
git clone https://github.com/your-username/forbidden-functions-tester.git
cd forbidden-functions-tester
```

<br>

2. **List your forbidden functions**:
In the `testersrc` file, add each function on a new line. For example:
```c
malloc
free
printf
```

<br>

3. **Set your target directory**:
Inside the script (`forbidden.sh`), point the `PROJECT_DIR` variable to the folder containing your files.
```bash
PROJECT_DIR="../path-to-your-project"
```

<br>

4. **Set your target language**:
Inside the script (`forbidden.sh`), point the `EXTENSION` variable to your file extensions.
```bash
EXTENSION=".c"
```

<br>

5. **Run the script**:
```bash
./forbidden.sh
```

<br>

6. **Read the output**:
- `[OK]` – No forbidden functions in this file.
- `[KO]` – Forbidden function found: you’ll get the function name, file path, and line number.

<br>

---

## Customization

You can adapt the script easily to suit your project:

- **Change folders**: Modify `PROJECT_DIR` in the script.
- **Update forbidden list**: Just edit the `testersrc` file.
- **Style the messages**: Tweak the colors or formats in the `echo` lines.
- **More extensions**: Want to scan `.h` files too? Change the `find` command accordingly.

---

<div style="display:flex">
 <h2>
  License
  <a>
   <img src="https://img.shields.io/badge/LICENSE-MIT-green" alt="Liscense"/>
  </a>
 </h2>
</div>  
This project is licensed under the MIT License.

Feel free to use, modify, and share it however you like. Just give credit when it's due.

Created by: [Rodrigo-fari](https://github.com/rodrigo-fari) ;p
