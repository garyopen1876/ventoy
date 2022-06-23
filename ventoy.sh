#!/usr/bin/env bash

# Text Color Variables
GREEN='\033[32m'  # Green
YELLOW='\033[33m' # YELLOW
CLEAR='\033[0m'   # Clear color and formatting

# Setup script for setting up a new macos machine
echo -e "${GREEN}Starting ventoy :)${CLEAR}"

# Bonk!
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

# Put your ventoy download setting 

wget https://github.com/ventoy/Ventoy/releases/download/v1.0.77/ventoy-1.0.77-linux.tar.gz
sudo tar -xf ventoy-1.0.77-linux.tar.gz
cd ventoy-1.0.77

# Put your usb dev (You can use $ lsblk | grep disk to find your usb!)