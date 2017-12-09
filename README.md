How to run:

docker build -t ./deluge-vpn

docker run --cap-add=NET_ADMIN \
        --name deluge01 \
	-p 8112:8112 \
	-p 58846:58846 \
	-p 58946:58946 \
	-p 58946:58946/udp \
        -v /Users/lewis.goulden/Documents/working/config/:/config \
        -v /Users/lewis.goulden/Documents/working/downloads/:/downloads \
        -d deluge-vpn
