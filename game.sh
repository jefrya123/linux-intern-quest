#!/bin/bash

check_command() {
    local expected="$1"
    local input="$2"
    [[ "$input" == "$expected" ]]
}

run_task() {
    local prompt="$1"
    local correct_cmd="$2"

    echo "🎯 Task: $prompt"
    while true; do
        read -e -p "intern@linuxquest:$ " user_input
        if check_command "$correct_cmd" "$user_input"; then
            echo "✅ Correct!"
            break
        fi
    done
    echo ""
}

run_task "Update the system using apt." "sudo apt update -y && sudo apt upgrade -y"
run_task "Install VLC media player." "sudo apt-get install vlc"
run_task "Install ubuntu-restricted-extras." "sudo apt-get install ubuntu-restricted-extras"
run_task "Install libavcodec-extra and ffmpeg." "sudo apt-get install libavcodec-extra ffmpeg"
run_task "Install Python 3 pip." "sudo apt install python3-pip"
run_task "Install streamlink and yt-dlp using pip3." "sudo -H pip3 install streamlink yt-dlp"

echo "🎥 Final Task: Stream a YouTube video via CLI."
echo "Use the correct streamlink command to play: https://www.youtube.com/watch?v=3LXQWU67Ufk"
while true; do
    read -e -p "intern@linuxquest:$ " user_input
    if [[ "$user_input" == "streamlink https://www.youtube.com/watch?v=3LXQWU67Ufk best" ]]; then
        echo "✅ You did it!"
        break
    fi
done

echo ""
echo "🏁 All tasks complete. You’re terminal-certified!"
