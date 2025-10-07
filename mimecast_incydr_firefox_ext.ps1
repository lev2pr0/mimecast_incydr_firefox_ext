<#
.SYNOPSIS
    Powershell script to mass deploy Incydr Browser Extension to Firefox
.DESCRIPTION
    Creates policies.json under "C:\Program Files\Mozilla Firefox\distribution" to force install Mimecast Incydr Browser Extension. 
    Can be used with Software Deployment tools to mass deploy extension to Firefox.
.AUTHOR
    Levar Norwood - lnorwood@mimecast.com
.VERSION
    1.0
.DATE
    October 7, 2025
.NOTES
    WARNING: This will overwrite existing policies.json on device. This will not override GPO policy nor MDM configuration profiles for Mozilla Firefox if already in place.
#>
 
$dest_folder = "C:\Program Files\Mozilla Firefox\distribution"
$json_content = '{
  "policies": {
    "EnterprisePoliciesEnabled": true,
    "ExtensionSettings": {
      "{2e0d1041-8b91-445c-8e94-c0de42df6251}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/{2e0d1041-8b91-445c-8e94-c0de42df6251}/latest.xpi"
      }
    }
  }
}'
 
if (!(Test-Path -Path $dest_folder)) {
    New-Item -ItemType Directory -Path $dest_folder | Out-Null
}
 
$json_content | Set-Content -Path "$dest_folder\policies.json"
