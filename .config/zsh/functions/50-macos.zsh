function airport {
  local airport_bin='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

  [[ -x "$airport_bin" ]] || {
    echo 'airport command is unavailable on this machine.'
    return 1
  }

  "$airport_bin" "$@"
}

function wifi_device {
  local previous=''
  local line=''

  while IFS= read -r line; do
    if [[ "$previous" == 'Hardware Port: Wi-Fi' || "$previous" == 'Hardware Port: AirPort' ]]; then
      if [[ "$line" == Device:* ]]; then
        printf '%s\n' "${line#Device: }"
        return 0
      fi
    fi
    previous="$line"
  done < <(networksetup -listallhardwareports)

  echo 'Unable to determine Wi-Fi device.'
  return 1
}

function wifi {
  airport -I "$@"
}

function wifion {
  local device
  device="$(wifi_device)" || return 1
  networksetup -setairportpower "$device" on
}

function wifioff {
  local device
  device="$(wifi_device)" || return 1
  networksetup -setairportpower "$device" off
}

function localip {
  local device
  device="$(wifi_device)" || return 1
  ipconfig getifaddr "$device"
}

function sniff {
  local device
  device="$(wifi_device)" || return 1
  sudo ngrep -d "$device" -t '^(GET|POST) ' 'tcp and port 80'
}

function httpdump {
  local device
  device="$(wifi_device)" || return 1
  sudo tcpdump -i "$device" -n -s 0 -w - | grep -a -o -E 'Host\: .*|GET /.*'
}
