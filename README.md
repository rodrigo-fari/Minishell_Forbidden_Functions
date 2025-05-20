# [FFT] - Forbidden Functions Tester

<div align="center">
  <img src="https://github.com/user-attachments/assets/e889ca7a-0f7a-4275-b20d-00fded76d5e4" 
       width="600">
</div>

### 1. What is this ?
The **Forbidden Functions Tester** is a simple Bash script that helps you detect restricted or undesired functions inside your C source code.

Whether you're working on a school project with strict rules or maintaining code quality in a team, this tool gives you a fast and clean way to ensure no forbidden functions sneak in.

It works by scanning all `.c` files in a specified directory and matching them against a list of functions you define in a separate file.

---

### 2. How to Use

### Step-by-step:

1. **Clone the repository** (or just copy the script if you prefer):
```bash
git clone https://github.com/your-username/forbidden-functions-tester.git
cd forbidden-functions-tester
```

<br>

2. **List your forbidden functions**:
In the `testersrc` file, add each function on a new line. For example:
```
malloc
free
printf
```

<br>

3. **Set your target directory**:
Inside the script (`forbidden.sh`), point the `PROJECT_DIR` variable to the folder containing your `.c` files.
```bash
PROJECT_DIR="../src"
```

<br>

4. **Run the script**:
```bash
./forbidden.sh
```

<br>

5. **Read the output**:
- `[OK]` – No forbidden functions in this file.
- `[KO]` – Forbidden function found: you’ll get the function name, file, and line number.

<br>

---

### 3. Customization

You can adapt the script easily to suit your project:

- **Change folders**: Modify `PROJECT_DIR` in the script.
- **Update forbidden list**: Just edit the `testersrc` file.
- **Style the messages**: Tweak the colors or formats in the `echo` lines.
- **More extensions**: Want to scan `.h` files too? Change the `find` command accordingly.

---


### 4. License

This project is licensed under the MIT License.

Feel free to use, modify, and share it however you like. Just give credit when it's due.

Created by: Rodrigo-fari ;p
