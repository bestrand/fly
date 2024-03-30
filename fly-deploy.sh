APP_NAME="$1"
APP_EXISTS=$(/root/.fly/bin/flyctl apps list -t $FLY_TOKEN | grep $APP_NAME)
 
if [ -z "$APP_EXISTS" ]; then
  echo "App $1 does not exist, creating..."
  /root/.fly/bin/flyctl launch --now --copy-config -y -t $FLY_TOKEN --ha=false
fi
 
echo "Deploying app $1"
/root/.fly/bin/flyctl deploy --now -y -t $FLY_TOKEN --ha=false
