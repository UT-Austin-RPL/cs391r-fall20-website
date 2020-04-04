#!/bin/sh
# -----------------------------------------------------------
# deploy-utcs.sh
# -----------------------------------------------------------

# Variables

localjekyll="/Users/yukez/Lab/Teaching/cs391r_fall2020"
remotewebroot="/u/yukez/public_html"
instancehost="linux.cs.utexas.edu"
sshuser="yukez"
sshport="22"
# sshidentity="~/.ssh/your-private-key.key"

# Execution

cd $localjekyll
# bundle install
bundle exec jekyll build --config=_config.yml

echo "rsync to SSH host $instancehost ..."

rsync --update -vrh -p -e "ssh -p $sshport" --exclude ".*" --exclude "*.sh" --delete-after $localjekyll $sshuser@$instancehost:$remotewebroot

echo "SSH connection closed. Done. Committed."
