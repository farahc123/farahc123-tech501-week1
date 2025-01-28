# first download app folder from SP and unzip it off home directory (aka farah)

sudo apt-get update -y 

sudo apt-get upgrade -y

sudo apt-install nginx -y

# downloading node js 
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# from the local machine in git, need to scp or rsync or git clone [not needed in script? but for steps? should have permissions over this folder]

# scp method [private ssh] [folder from home directory of local machine] [path to home for VM, made of user @ ip:~
# note that this takes a while]:
scp -i ~/.ssh/tech501-farah-az-key -r nodejs20-sparta-test-app azureuser@20.254.65.158:~

# for script?
ls #shows repo only
cd repo
ls #shows readme.md and app
cd app
npm install [should show 0 vulnerabilities]

node app.js or npm start [output: your app is ready and listening on port 3000]

# for steps: paste IP address into url bar followed by :3000 to test app is running

