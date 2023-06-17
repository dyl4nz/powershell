function IP_Clip {
    $IPAddress = (Invoke-RestMethod -Uri "https://api.ipify.org?format=json").ip
    $IPAddress | Set-Clipboard
}
IP_Clip
