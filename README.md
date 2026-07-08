Shell Scripting Notes
1. #!/bin/bash
Definition

#! is called a Shebang.

It tells Linux which interpreter should execute the script.

/bin/bash means use the Bash (Bourne Again Shell) interpreter.

Bash is the most commonly used shell for Linux automation and DevOps.

Why do we use Bash?

Because it provides many advanced features like:

Arrays
Functions
Variables
Loops
Arithmetic operations
Command history
Auto-completion
Better scripting support
Example
#!/bin/bash

echo "Hello DevOps"

Run:

chmod +x hello.sh
./hello.sh

Output

Hello DevOps
Real DevOps Use

Most automation scripts in Jenkins, Ansible, Terraform provisioning, Docker, and AWS use:

#!/bin/bash




2. #!/bin/sh
Definition

#!/bin/sh also starts a shell script.

It is a basic POSIX-compliant shell and is more portable across Unix/Linux systems.

On many Linux distributions, /bin/sh is a symbolic link to another shell such as dash or bash.

Advantages
Faster startup
Portable
Uses fewer system resources
Good for simple scripts
Example
#!/bin/sh

echo "Hello Linux"
Difference
#!/bin/bash	#!/bin/sh
Advanced shell	Basic shell
Supports arrays	No array support in POSIX sh
Supports Bash-specific features	Only standard shell features
Most common for DevOps	Best for portability





3. set -x
Definition

set -x enables debug mode.

It prints every command before executing it.

Example
#!/bin/bash

set -x

name="Jayesh"

echo $name
pwd
date

Output

+ name=Jayesh
+ echo Jayesh
Jayesh
+ pwd
/home/ec2-user
+ date
Tue Jul 8 ...
Why use it?

Useful while debugging shell scripts.






4. set -e
Definition

Stops the script immediately if any command returns an error.

Example
#!/bin/bash

set -e

echo "Start"

mkdir test

cd test123

echo "Completed"

Output

Start

cd: test123: No such file or directory

The last echo is never executed because the script exits on error.

Why use it?

Prevents scripts from continuing after a failure.









5. set -o pipefail
Definition

Normally, a pipeline may appear successful if the last command succeeds, even when an earlier command failed.

set -o pipefail makes the entire pipeline fail if any command in it fails.

Example

Without pipefail

false | cat

echo $?

Output

0

The pipeline looks successful because cat succeeded.

With pipefail

set -o pipefail

false | cat

echo $?

Output

1

Now the failure is reported correctly.

Why use it?

Very important in CI/CD pipelines so hidden failures are not ignored.








6. set -exo pipefail

This is a common production setting.

set -exo pipefail

It combines:

-x → Show executed commands
-e → Exit on errors
pipefail → Fail the pipeline if any command fails

Many production shell scripts begin with:

#!/bin/bash
set -exo pipefail





7. awk
Definition

awk is a powerful text-processing tool used to read, filter, and format text files column by column.

Syntax
awk '{print $1}' file.txt
Example File
Tom 22
John 30
Alice 25

Print the first column:

awk '{print $1}' file.txt

Output

Tom
John
Alice

Print the second column:

awk '{print $2}' file.txt

Output

22
30
25
Practical Example
ps -ef | awk '{print $2}'

Prints all process IDs (PIDs).








8. ps -ef
Definition

Displays all running processes.

Options
-e → Every process
-f → Full details
Example
ps -ef

Output

UID      PID   PPID CMD
root       1      0 init
root     500      1 sshd

Find Jenkins:

ps -ef | grep jenkins

Print only the PID:

ps -ef | grep jenkins | awk '{print $2}'







9. curl
Definition

curl transfers data to or from a server.

It is commonly used to test APIs and download data.

Example
curl https://example.com

Display only headers:

curl -I https://example.com

Download a file:

curl -O https://example.com/file.zip
DevOps Use
Test REST APIs
Check application health
Call web services
Download files







10. wget
Definition

wget downloads files from the internet.

Example
wget https://example.com/file.zip

Resume download

wget -c https://example.com/file.zip
DevOps Use

Download:

Jenkins
Terraform
Docker packages
Configuration files
11. Difference between curl and wget
curl	wget
Transfers data	Downloads files
API testing	File downloading
Doesn't save by default	Saves automatically
Supports POST, PUT, DELETE	Mostly GET downloads






12. wc
Definition

Counts lines, words, and characters.

Example file

Linux
DevOps
AWS

Count lines

wc -l file.txt

Output

3 file.txt



Count words

wc -w file.txt



Count characters

wc -c file.txt






13. grep -o
Definition

grep -o prints only the matching text, not the whole line.

Example

echo "apple banana apple" | grep -o "apple"

Output

apple
apple
14. vim -r file.txt
Definition

Recovers an unsaved Vim file using the swap file after a crash or unexpected exit.

Example
vim -r notes.txt







15. Soft Link vs Hard Link

Soft Link vs Hard Link in Linux

Think of a file as a house.

Hard Link = Another door to the same house.
Soft Link (Symbolic Link) = A signboard that points to the house.
Soft Link (Symbolic Link)

A soft link stores the path to the original file.

Create
ln -s original.txt softlink.txt
Example

Create a file:

echo "Hello Linux" > file1.txt

Create a soft link:

ln -s file1.txt softlink.txt

Check:

ls -l

Output:

-rw-r--r--  file1.txt
lrwxrwxrwx  softlink.txt -> file1.txt

Notice the -> showing that softlink.txt points to file1.txt.

If original file is deleted
rm file1.txt

Now:

cat softlink.txt

Output:

No such file or directory

The soft link becomes broken because it only stored the path.

Hard Link

A hard link is another name for the same data (same inode).

Create
ln file1.txt hardlink.txt

Check inode numbers:

ls -li

Output:

12345 file1.txt
12345 hardlink.txt

Both have the same inode number, meaning they refer to the same file data.

Delete original file
rm file1.txt

Now:

cat hardlink.txt

Output:

Hello Linux

It still works because the data still exists as long as at least one hard link remains.

Differences
Feature	Soft Link	Hard Link
Points to	File path	Same inode
Inode number	Different	Same
Works after original file is deleted	❌ No	✅ Yes
Can link directories	✅ Yes (usually with care)	❌ Generally not allowed
Can cross file systems	✅ Yes	❌ No
Command	ln -s file link	ln file link
Commands
Create Soft Link
ln -s source.txt soft.txt
Create Hard Link
ln source.txt hard.txt
Show inode numbers
ls -li
Show soft link target
ls -l
Interview Answer (30 seconds)

Soft Link (Symbolic Link) stores the path to the original file. It has a different inode number, can cross file systems, and becomes broken if the original file is deleted.

Hard Link is another name for the same file and shares the same inode number. It cannot cross file systems, usually cannot link directories, and continues to work even if the original filename is deleted because the data remains until all hard links are removed.

Easy way to remember
Soft Link = Shortcut (like a desktop shortcut in Windows) 📌
Hard Link = Duplicate name for the same file 📄📄 (both names point to the same underlying data)






16. break vs continue
break

Stops the loop immediately.

for i in 1 2 3 4 5
do
    if [ $i -eq 3 ]
    then
        break
    fi
    echo $i
done

Output

1
2
continue

Skips the current iteration.

for i in 1 2 3 4 5
do
    if [ $i -eq 3 ]
    then
        continue
    fi
    echo $i
done

Output

1
2
4
5






17. Types of Loops
for loop

Use when the number of iterations is known.

for i in 1 2 3
do
    echo $i
done
while loop

Runs while a condition is true.

i=1

while [ $i -le 5 ]
do
    echo $i
    i=$((i+1))
done
until loop

Runs until the condition becomes true.

i=1

until [ $i -gt 5 ]
do
    echo $i
    i=$((i+1))
done






18. Is Bash dynamically typed or statically typed?

Answer: Bash is dynamically typed.

Why?

Variables do not need a type declaration.
The same variable can hold a number, then later hold text.

Example:

name=100
name="DevOps"

This is allowed, so Bash is dynamically typed.







19. Network Troubleshooting Utilities
Command	Purpose
ping	Check if a host is reachable
curl	Test web servers and APIs
wget	Download files
ssh	Connect to remote servers
scp	Copy files securely
ss or netstat	Show open ports and connections
nslookup	Resolve DNS names
dig	Get detailed DNS information
traceroute	Show the path packets take to a destination






20. Sort a list of names

Example file:

John
Alice
Bob

Sort alphabetically:

sort names.txt

Output

Alice
Bob
John

Reverse order:

sort -r names.txt









21. Managing Huge Log Files

Large log files can quickly fill disk space. Common approaches include:

Rotate logs regularly using logrotate.
Compress old logs (.gz) to save space.
Delete logs older than a certain number of days.
Archive important logs to another location or cloud storage.
Monitor disk usage with df -h and log sizes with du -sh.
Example: Delete logs older than 30 days
find /var/log -name "*.log" -mtime +30 -delete
Example: Compress a log file
gzip application.log
