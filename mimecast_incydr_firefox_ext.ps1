$dest_folder = "C:\Program Files\Mozilla Firefox\distribution"
$json_content = '{
  "policies": {
    "EnterprisePoliciesEnabled": true,
    "ExtensionSettings": {
      "{2e0d1041-8b91-445c-8e94-c0de42df6251}": {
        "installation_mode": "force_installed",
        "install_url": https://addons.mozilla.org/firefox/downloads/latest/{2e0d1041-8b91-445c-8e94-c0de42df6251}/latest.xpi
      }
    }
  }
}'
 
if (!(Test-Path -Path $dest_folder)) {
    New-Item -ItemType Directory -Path $dest_folder | Out-Null
}
 
$json_content | Set-Content -Path "$dest_folder\policies.json"
