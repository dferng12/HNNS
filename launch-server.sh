./ngrok http -region eu --log=stdout 80 > ngrok.log &
sleep 2
URL="$(tail -1 ngrok.log | awk '{ print $8 }'| cut -d'=' -f 2)"
echo "Url: $URL"
echo ""
sudo docker run --rm -it -p 80:80 -p 443:443 -v "${PWD}:/data" litios/ngrok-simple-server
printf "\n\nStopping ngrok"
kill -9 "$(ps aux | grep "./ngrok http -region eu --log=stdout 80" | awk '{ print $2 }' | head -1)"
printf "\nFinished\n"
