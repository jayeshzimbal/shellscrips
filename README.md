<div align="center">

# 🐧 Shell Scripting Notes

### Complete Linux Shell Scripting Notes for Beginners & DevOps Engineers

![Linux](https://img.shields.io/badge/Linux-Ubuntu-E95420?style=for-the-badge&logo=ubuntu)
![Bash](https://img.shields.io/badge/Bash-Shell-4EAA25?style=for-the-badge&logo=gnubash)
![DevOps](https://img.shields.io/badge/DevOps-Learning-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</div>

---

# 📚 Table of Contents

- [Introduction](#-introduction)
- [Bash vs sh](#-bash-vs-sh)
- [Debugging](#-debugging)
- [Cron Jobs](#-cron-jobs)
- [awk](#-awk)
- [grep](#-grep)
- [curl vs wget](#-curl-vs-wget)
- [Loops](#-loops)
- [Break vs Continue](#-break-vs-continue)
- [Soft Link vs Hard Link](#-soft-link-vs-hard-link)
- [Network Troubleshooting](#-network-troubleshooting)
- [Interview Questions](#-interview-questions)

---

# 📖 Introduction

This repository contains beginner to advanced Shell Scripting notes with practical examples.

Perfect for

- Linux Beginners
- DevOps Engineers
- AWS Engineers
- Interview Preparation

---

# 🐚 Bash vs sh

<details>

<summary>Click to Expand</summary>

## #!/bin/bash

```bash
#!/bin/bash
```

Bash is an advanced shell that supports

- Arrays
- Functions
- Loops
- Arithmetic
- Auto-completion

Example

```bash
#!/bin/bash

echo "Hello DevOps"
```

---

## #!/bin/sh

```bash
#!/bin/sh
```

Simple POSIX shell.

Portable across Linux systems.

Best for small scripts.

</details>

---

# ⚙️ Debugging

<details>

<summary>Click to Expand</summary>

## set -x

```bash
set -x
```

Shows every command before execution.

---

## set -e

```bash
set -e
```

Stops the script if any command fails.

---

## set -o pipefail

```bash
set -o pipefail
```

Fails the entire pipeline if any command fails.

---

## Production Example

```bash
#!/bin/bash

set -exo pipefail
```

</details>

---

# ⏰ Cron Jobs

<details>

<summary>Click to Expand</summary>

Run every minute

```cron
* * * * * /home/ec2-user/script.sh
```

Run every day at 2 AM

```cron
0 2 * * * /home/ec2-user/backup.sh
```

</details>

---

# 📄 awk

```bash
awk '{print $1}' file.txt
```

Example

```
Tom 22
John 30
Alice 25
```

Output

```
Tom
John
Alice
```

---

# 🌐 curl vs wget

| curl | wget |
|-------|------|
| API Testing | Download Files |
| Supports POST | GET Downloads |
| Doesn't save by default | Saves automatically |

---

# 🔗 Soft Link vs Hard Link

| Feature | Soft Link | Hard Link |
|----------|-----------|-----------|
| Same Inode | ❌ | ✅ |
| Survives Original File Delete | ❌ | ✅ |
| Cross File System | ✅ | ❌ |

---

# 🌍 Network Troubleshooting

| Command | Purpose |
|----------|----------|
| ping | Check connectivity |
| curl | Test APIs |
| wget | Download files |
| ssh | Remote login |
| scp | Secure file copy |
| dig | DNS lookup |
| traceroute | Trace network path |

---

# 🎯 Interview Questions

### What is Shebang?

`#!` tells Linux which interpreter executes the script.

---

### Difference between Bash and sh?

- Bash → Advanced
- sh → Portable

---

### Difference between Hard Link and Soft Link?

Hard Link shares the same inode.

Soft Link stores the file path.

---

# 👨‍💻 Author

**Jayesh Zimbal**

DevOps | AWS | Linux | Shell Scripting

⭐ If these notes helped you, don't forget to star this repository.
