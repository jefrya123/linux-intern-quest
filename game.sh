#!/bin/bash

run_task() {
    local prompt="$1"
    local correct_cmd="$2"

    echo ""
    echo "🎯 Task: $prompt"
    echo "💡 Run real Linux commands. When you're ready, type the correct command:"
    echo "   ✅ $correct_cmd"
    echo "💡 Type 'exit' or 'quit' to skip the task."

    while true; do
        read -e -p "intern@linuxquest:$ " user_input

        if [[ "$user_input" == "exit" || "$user_input" == "quit" ]]; then
            echo "⏭️ Skipping..."
            break
        fi

        # Actually run the typed command
        eval "$user_input" 2>/dev/null

        # Check if the command matches exactly
        if [[ "$user_input" == "$correct_cmd" ]]; then
            echo "✅ Correct!"
            break
        fi
    done

    echo ""
}

# Tasks
run_task "Update the system using apt." "sudo apt update -y && sudo apt upgrade -y"
run_task "Install VLC media player." "sudo apt-get install vlc"
run_task "Install ubuntu-restricted-extras." "sudo apt-get install ubuntu-restricted-extras"
run_task "Install libavcodec-extra and ffmpeg." "sudo apt-get install libavcodec-extra ffmpeg"
run_task "Install Python 3 pip." "sudo apt install python3-pip"
run_task "Install streamlink and yt-dlp using pip3." "sudo -H pip3 install streamlink yt-dlp"

run_task "Stream a YouTube video." "streamlink https://www.youtube.com/watch?v=3LXQWU67Ufk best"

echo ""
echo "🏁 All tasks complete. You’re terminal-certified!"
