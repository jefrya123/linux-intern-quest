#!/bin/bash

run_task() {
    local prompt="$1"
    local correct_cmd="$2"
    local hint_text="$3"
    local hint_count=0

    echo ""
    echo "🎯 Task: $prompt"
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

# Tasks (challenge-style prompts + hints)
run_task \
  "Update the system using apt package manager so your system is current." \
  "sudo apt update -y && sudo apt upgrade -y" \
  "Use 'apt update' to refresh, and 'apt upgrade' to install updates."

run_task \
  "Install VLC media player." \
  "sudo apt-get install vlc" \
  "Use apt-get to install the package 'vlc'."

run_task \
  "Install the restricted media codecs (extras)." \
  "sudo apt-get install ubuntu-restricted-extras" \
  "Search for 'ubuntu-restricted-extras' using apt-get."

run_task \
  "Install ffmpeg and codec libraries." \
  "sudo apt-get install libavcodec-extra ffmpeg" \
  "Install both 'libavcodec-extra' and 'ffmpeg' in one command."

run_task \
  "Install pip for Python 3." \
  "sudo apt install python3-pip" \
  "Use 'apt install' to get pip for Python 3."

run_task \
  "Install the tools to stream and download videos from YouTube." \
  "sudo -H pip3 install streamlink yt-dlp" \
  "Use pip3 to install 'streamlink' and 'yt-dlp'."

run_task \
  "Stream this YouTube video using the command line: https://www.youtube.com/watch?v=3LXQWU67Ufk" \
  "streamlink https://www.youtube.com/watch?v=3LXQWU67Ufk best" \
  "Use 'streamlink' and the URL with the 'best' quality flag."

echo ""
echo "🏁 All tasks complete. You’re terminal-certified!"
