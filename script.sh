#!/bin/bash
echo "====================="
echo "====ServerSummon====="
echo "=====revision 1======"
echo "written by vscorpio"
echo "https://github.com/vscorpio"
echo "====================="
echo "Make sure current directory is clean and only contains script.sh and its folders."
sleep 2
echo "Setting up environment..."
mkdir -p BuildTools && cd BuildTools
echo "Fetching latest BuildTools jar from Jenkins..."
curl https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar > BuildTools.jar
read -p "What version do you want to build? ex: 1.14 ----- " targetversion
sleep 1
echo "--------------------------------------------"
echo "Launching BuildTools: java -jar BuildTools.jar --rev $targetversion"
java -jar BuildTools.jar --rev $targetversion
echo "--------------------------------------------"
echo "SpigotServer built...moving files around & creating SpigotServer directory where your server will be..."
sleep 1
mkdir ../SpigotServer
mv spigot-$targetversion.jar ../SpigotServer
cd ../SpigotServer
echo "--------------------------------------------"
echo "Starting server to enforce eula-acceptance..."
java -Xmx1G -jar spigot-$targetversion.jar
echo "eula=true" > eula.txt
echo "--------------------------------------------"
echo "The script is done now. Server will start in current console screen to begin world generation. After done send command stop to server to save everything and move the server where you wish."
echo "--------------------------------------------"
java -Xmx1G -jar spigot-$targetversion.jar
