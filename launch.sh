echo "Launching ngrok"
/ngrok authtoken $1
/ngrok http -region eu --log=stdout 80 > ngrok.log &
sleep 2
URL="$(tail -2 ngrok.log | grep tunnels | awk '{ print $8 }'| cut -d'=' -f 2)"
echo
echo "Url: $URL"
echo 
echo "Generating certificate"
if [[ ! -f /etc/nginx/ssl/server.crt || ! -f /etc/nginx/ssl/server.crt ]]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj '/CN=www.what3ver.sure'
fi

echo
echo "Server up. Waiting for connections..."
echo 
nginx -g 'daemon off;'
