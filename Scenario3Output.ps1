#Sulem Morales Date: 10/20/2024
#ISS 212 - CS Scripting - Week 6 Tool Dev - Scenario 3
#Referenced Tool Dev 4 walkthrough
# Load log file and find failed login attempts
$logFile = "security.log"
$failedAttempts = Select-String -Path $logFile -Pattern "Login attempt failed from IP (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})" -AllMatches

# Extract IP addresses and count occurrences
$ipCounts = @{}
foreach ($match in $failedAttempts) {
	$ip = $match.Matches.Groups[1].Value
	if ($ipCounts.ContainsKey($ip)) {
    	$ipCounts[$ip] += 1
	} else {
    	$ipCounts[$ip] = 1
	}
}

# Display IPs with more than 3 failed attempts
Write-Host "Potentially Malicious IPs:"
foreach ($ip in $ipCounts.Keys) {
	if ($ipCounts[$ip] -gt 3) {
    	Write-Host "$ip has $($ipCounts[$ip]) failed login attempts"
	}
}
