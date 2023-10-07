cat <<EOL
#!/bin/bash

LOCATION="$LOCATION"
OWNER="$OWNER"
REPO="$REPO"
HEADLINE="$HEADLINE"
TOOL_CMD="$TOOL_CMD"

echo "Reading \$HEADLINE" 

if [ ! -d "\$REPO" ] ; then
    git clone "\${OWNER}/\${REPO}.git" "/root/\$REPO"
    cd /root/\$REPO
    \$TOOL_CMD \$HEADLINE
fi

cd /root/\$REPO
git fetch --quiet

if git diff HEAD origin/main --quiet -- \$HEADLINE; then
    echo "No news"
else
    echo "Reading and applying headline: \$HEADLINE"
    git pull --rebase
    \$TOOL_CMD \$HEADLINE
fi
EOL