#! /usr/bin/bash
echo "What is your cmd?"
read name
if [ $name ]; then
    echo "$name sounds alright to me"
    compgen -C $(name)
else
    echo "Doesn't sound like a $name cmd exists... attempting install $(sudo apt install $name)"
fi