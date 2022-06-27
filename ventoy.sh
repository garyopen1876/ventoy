#!/usr/bin/env bash

# Text Color Variables
GREEN='\033[32m'  # Green
YELLOW='\033[33m' # YELLOW
CLEAR='\033[0m'   # Clear color and formatting

echo -e "${GREEN}Starting ventoy :)${CLEAR}"
echo -e "                              ...:::::^^!7                                             "              
echo -e "                           .?5555GG555555Y!.                                           "              
echo -e "                          ?B#YPP55555YJJJY?!^                BONK!                     "              
echo -e "                        .YGBBGGPY5YJJ5GP5YYJG.                           BONK!         "              
echo -e "                       :YP55555Y?!^.:^~~75PGBJ.                BONK!                   "              
echo -e "                    .^JPPP5555Y?!^:::^7YJ??Y#&&?                                       "              
echo -e "                  .7Y5555PGGP5YJ7!^::^?PGP5Y5PY^                           ^.          "              
echo -e "                 !PG5Y5555PGGPP5Y?!~^^^~!??:                             !&@&.         "              
echo -e "                JBGGGP5YYJJY555P5YJ7!~^^^~~.                           7#&&J.          "              
echo -e "               !PGBGGGGPYJ77!!!7777!^::^~^^.                         7&@@5^            "              
echo -e "              ~P55PBBGP5YJ?77!~~^^^^:::^^^^.                       7&@@#PY5G?          "             
echo -e "             ^#BPPPGBGPPY7!!!~~~~~^^^^^^^^^.                     ~&@&B555PPGPJ:        "              
echo -e "             5BBBGPPGGGPPY7~^^^^^^^^^^^~~~~.                   .Y&&PJ!^~?Y5PP55PY.     "              
echo -e "             PGGGGGPPGGGPP5?!~~~~~~~~^~!777                  ^PGG5Y?~:~?Y5P555GGBG:    "              
echo -e "             ?BGGGGPPPGGPPP5YJ7!!!!!~!!!!7?                 .7?.~!~^~!?????J5PGBGPY.   "              
echo -e "             .YGGGBGGGB#BG555J777777??!~~!7               .:.  ^^^::^^~~~!!?5PBGPPBP   "              
echo -e "               !GBBBBB#&#G5YY?!JJJJPBP7^~~7.            ...   .!!~^^^^~^^~75PGGPPGBG^  "              
echo -e "                .!P####&BP5YJ7!???YGBB5~~~!??7~:.     ..       77!!~!!!!?Y5PGGPPGGGG.  "              
echo -e "                   :JG#&#GG5J7!!!!77J5PY7!!. .:^?!^ ..         7~~?Y?777J55G#BGGBGP^   "              
echo -e "                      .!5PGPY?7?!~~^^~JY?7!!:.    ..       .:^!!~~PBPJJ77J5G#&#BG?.    "              
echo -e "                          ~G5J7:         .~!77?!^~7      .^^:.:!7YPJ77!!7YPB#BY^       "              
echo -e "                           55J!            .^!!~!7:      ..:^~!!^^:..:^!?55~:          "              
echo -e "                           5PJ?.              ...        :777~.        :JP^            "              
echo -e "                           !P?7^                                       ~JP:            "              
echo -e "                           .7?77~                                     :7?7             "              
echo -e "                             ...                                     ...               "



sudo apt-get update
sudo apt-get install -y curl

# Put your ventoy download setting 
wget https://github.com/ventoy/Ventoy/releases/download/v1.0.77/ventoy-1.0.77-linux.tar.gz
sudo tar -xf ventoy-1.0.77-linux.tar.gz
cd ventoy-1.0.77


usb=xxx # Put your usb dev here(You can use $ lsblk | grep disk to find your usb!)

yes | sudo sh Ventoy2Disk.sh -i /dev/$usb 
cd ..

mkdir iso
cd iso

# google drive download
function google_drive_download() {
	fileid=$1
	filename=$2
    html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
	curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
}

# Clonezilla
if [ ! -f Clonezilla.iso ]
then
	echo -e "${YELLOW}Starting Downloading Clonezilla${CLEAR}"
	wget "https://osdn.net/frs/redir.php?m=rwthaachen&f=clonezilla%2F77480%2Fclonezilla-live-20220620-jammy-amd64.iso" -O "Clonezilla.iso"
fi


# lenovo
if [ ! -f Lenovo_BIOS_Upgrade.iso ]
then
	echo -e "${YELLOW}Starting Downloading Lenovo BIOS Upgrade${CLEAR}"
	wget "https://download.lenovo.com/pccbbs/mobiles/g2uj33us.iso" -O "Lenovo_BIOS_Upgrade.iso"
fi
if [ ! -f Lenovo_Diagnostics.iso ]
then 
	echo -e "${YELLOW}Starting Downloading Lenovo Diagnostics${CLEAR}"
	wget "https://download.lenovo.com/pccbbs/thinkvantage_en/ldiag_4.41.0_linux.iso" -O "Lenovo_Diagnostics.iso"
fi
echo -e "${YELLOW}Starting Downloading Lenovo Things${CLEAR}"


# ubuntu20.04
if [ ! -f ubuntu-20.04.4-desktop-amd64.iso ]
then
	echo -e "${YELLOW}Starting Downloading Ubuntu 20.04${CLEAR}"
	wget "https://releases.ubuntu.com/20.04/ubuntu-20.04.4-desktop-amd64.iso"
fi

# USBOX 7
if [ ! -f USBOX_V7[ISO版].iso ]
then
	echo -e "${YELLOW}Starting Downloading USBOX 7${CLEAR}"
	google_drive_download "1EKWsGPR04mmp5CrqTaZ2yyf9z63o4HnT" "USBOX_V7[ISO版].iso"
fi

# windows 10
if [ ! -f Windows.iso ]
then
	echo -e "${YELLOW}Starting Downloading Windows10${CLEAR}"
	google_drive_download "1VGz51tQakXOnUmLtJUlfpqnrcLyebnbb" "Windows.iso"
fi

echo -e "${YELLOW}Starting Moving ISO To Your USB(it may take some time and make sure your usb is NTFS!)${CLEAR}"
sudo mkdir /mnt/usb
sudo mount /dev/${usb}1 /mnt/usb
sudo rsync -av *.iso /mnt/usb
sudo umount /dev/${usb}1