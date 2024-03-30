APP_NAME="$1"
APP_EXISTS=$(flyctl apps list -t $FLY_TOKEN | grep $APP_NAME)
 
if [ -z "$APP_EXISTS" ]; then
  echo "App $1 does not exist, creating..."
  flyctl launch --detach --now --copy-config -y -t $FLY_TOKEN --ha=false
fi
 
echo "Deploying app $1"
flyctl deploy --detach --now -y -t $FLY_TOKEN --ha=false
