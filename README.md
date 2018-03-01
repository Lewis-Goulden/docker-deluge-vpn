How to run:

docker build -t local:docker-deluge-vpn ./docker-deluge-openvpn

docker run --cap-add=NET_ADMIN \
        --name deluge01 \
	-p 8112:8112 \
	-p 58846:58846 \
	-p 58946:58946 \
	-p 58946:58946/udp \
        -v [PATH_TO_CONFIG_FOLDER]:/config \
        -v [PATH_TO_DOWNLOAD_FOLDER]:/downloads \
        -d local/docker-deluge-openvpn
