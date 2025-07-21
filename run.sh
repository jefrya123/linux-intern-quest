#!/bin/bash
echo "🛠️  Building and launching Linux Intern Quest..."
docker build -t linux-intern-quest . && docker run -it --rm linux-intern-quest
