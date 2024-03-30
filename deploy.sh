apk add curl git
git clone git@github.com:bestrand/fly.git
curl -L https://fly.io/install.sh | sh
chmod +x fly-deploy.sh
./fly-deploy.sh
