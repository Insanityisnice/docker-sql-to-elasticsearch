Param(
    [string]$elastic_uri='http://localhost:9200',
    [parameter(Mandatory=$true)]
    [string]$elastic_password,
    [string]$kibana_password=$elastic_password,
    [string]$logstash_system_password=$elastic_password
)

function SetUserPassword([string]$username, [string]$password)
{
    $set_password_body = "{ 'password': $($elastic_password) }"
    Write-Host "Setting password for user:$($username) at uri:$($elastic_uri)"
    Write-Host "Invoke-WebRequest -Uri '$($elastic_uri)/_xpack/security/user/$($username)/_password' -Method Post -Body $set_password_body"
    #Invoke-WebRequest -Uri "$($elastic_uri)/_xpack/security/user/$($username)/_password" -Method Post -Body $set_password_body
}

SetUserPassword "elastic" $elastic_password
SetUserPassword "kibana" $kibana_password
SetUserPassword "logstash_system" $logstash_system_password