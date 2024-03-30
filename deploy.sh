apk add curl git
git clone https://github.com/bestrand/fly.git && cd fly
curl -L https://fly.io/install.sh | sh
chmod +x fly-deploy.sh
cd locations/amsterdam/fly/mqtt
/fly/fly-deploy.sh alpine-clean
