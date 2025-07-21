#!/bin/bash

run_task() {
    local prompt="$1"
    local correct_cmd="$2"
    local hint_text="$3"
    local why_text="$4"
    local hint_count=0

    echo ""
    echo "🎯 Task: $prompt"
    echo "🧠 Why: $why_text"
    echo "💡 Use the Linux terminal to complete the task."
    echo "💡 Type 'hint' for help, 'skip' to move on, or 'exit' to quit the game."

    while true; do
        read -e -p "intern@linuxquest:$ " user_input

        case "$user_input" in
            exit)
                echo "👋 Exiting the quest early. See you next time!"
                exit 0
                ;;
            skip)
                echo "⏭️ Skipping this task..."
                break
                ;;
            hint)
                ((hint_count++))
                if [[ $hint_count -lt 3 ]]; then
                    echo "💡 Hint $hint_count: $hint_text"
                else
                    echo "📘 Full Answer: $correct_cmd"
                fi
                ;;
            *)
                eval "$user_input" 2>/dev/null
                if [[ "$user_input" == "$correct_cmd" ]]; then
                    echo "✅ Task complete!"
                    break
                fi
                ;;
        esac
    done
    echo ""
}

# Linux Fundamentals Tasks
run_task "Show your current working directory." \
         "pwd" \
         "Try a command that prints the present working directory." \
         "Always know where you are in the filesystem, especially after login or changing directories."

run_task "Change into the 'training' directory and list its contents." \
         "cd training && ls" \
         "Use 'cd' to enter the directory and 'ls' to list what's inside." \
         "This is how you explore and navigate project folders or log files."

run_task "Use man pages to find what the -a flag does for ls." \
         "man ls" \
         "Try reading the manual page for the 'ls' command." \
         "Man pages are essential for learning commands and their options without leaving the terminal."

run_task "Find the line in 'data.txt' that contains the word 'ERROR'." \
         "grep ERROR data.txt" \
         "Use grep to search for keywords inside files." \
         "This is used constantly to search logs, configs, or code for important patterns."

run_task "Count how many lines are in 'data.txt'." \
         "wc -l data.txt" \
         "Use wc with the -l flag to count lines in a file." \
         "This helps check file length, log sizes, or CSV row counts."

run_task "Make 'run.sh' executable by everyone." \
         "chmod +x run.sh" \
         "Use chmod to change file permissions." \
         "Real work often requires making scripts runnable after pulling from Git or creating them."

run_task "Display the first 3 lines of 'data.txt' using pipes." \
         "cat data.txt | head -n 3" \
         "Use 'cat' to show contents and 'head' to limit output." \
         "This is used to preview large files or just verify a structure."

run_task "Find all '.log' files in the '/home/intern/logs' directory." \
         "find /home/intern/logs -name '*.log'" \
         "Use 'find' to search directories by pattern." \
         "Admins use this to locate error logs, rotated files, or temp data."

run_task "Run the script named 'solve.sh' in the current directory." \
         "./solve.sh" \
         "Use ./ to run local executable files." \
         "This is how scripts are started in almost every Linux automation task."

echo ""
echo "🏁 All tasks complete. You’re terminal-certified!"