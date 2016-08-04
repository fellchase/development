#!/bin/bash
sudo apt-get install libprotobuf-dev
git clone https://github.com/rastapasta/pokemon-go-mitm-node.git
cd pokemon-go-mitm-node
npm install
echo -e "Now install Pokemon Go pre patched apk on your Android"
firefox https://docs.google.com/uc?id=0B0r12bko9SIaenc2RjN3TFA1aUE&export=download
timeout 5s coffee example.logTraffic.coffee
cd .http-mitm-proxy/certs
ls | grep ca.pem
echo -e "Copy and add ca.pem to your trusted certificates in Android."
sudo apt-get install create_ap
echo -e "Create SoftAP using create_ap command."
ifconfig -a
echo -e "Construct create_ap command like this in another Terminal: "
echo -e "sudo create_ap $wireless $wired $apName"
echo -e "After that connect your phone to the freshly made AP."
cd
curl http://pastebin.com/raw/7BQ7yUrk > mewtwo.coffee
coffee mewtwo.coffee
