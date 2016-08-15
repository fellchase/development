read -p "Enter the 4chan thread : " thread
lynx -listonly -dump $thread | grep i.4cdn.org | cut -c7- | sed -n '1~2!p' > /tmp/4chan.txt
d=$(date +%y-%m-%d)
wget -i /tmp/4chan.txt -P $HOME/Afbeeldingen/4chan/$d/
