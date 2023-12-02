#
# Make sure that there are NO secrets or personal identifiers in the files you are about to upload
# Use .gitignore to block/allow files and folders from being uploaded
# Use .gitkeep in an empty folder to upload that folder
#
#

# Delete the current local Git repository
#echo "Do you wish to PERMANENTLY DELETE the local Git Reository"
#select yn in "Yes" "No"; 
#    do case $yn in
#        Yes ) break;;
#        No ) exit;;
#    esac
#done
rm -r /config/.git
echo " The local Git repository has been NUKED ...."

# Create the empty local Git repository
git init

# Setup the email and user name for the commiter
git config user.email "rob@thedutch.no"
git config user.name "Rob"

# Add ALL the files to the local Git repository
git add .
# Set the reason for the for the upload
git commit -m "Initial github upload"
# Set the branch
git branch -M main

# Connect the local repository to Github
git remote add origin git@github.com:thedutch-no/homeassistant.git

# Tell Git where to find the private key
#git config core.sshCommand "ssh -i /root/config/.ssh/id_rsa -F /dev/null"

# Tell Git where to find the KnowHostFIle and the Private key
git config core.sshCommand "ssh -o UserKnownHostsFile=/config/.ssh/known_hosts -i /config/.ssh/id_rsa -F /dev/null"

# Push the local repository to Github
git push -u origin main

# Thats it, the local files were upload to Github
