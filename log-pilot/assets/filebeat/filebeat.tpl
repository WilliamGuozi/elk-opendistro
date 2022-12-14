{{range .configList}}
- type: log
  enabled: true
  paths:
      - {{ .HostDir }}/{{ .File }}
  scan_frequency: 10s
  fields_under_root: true
  {{if eq .Format "json"}}
  json.keys_under_root: true
  {{end}}
  {{if .Stdout}}
  json.add_error_key: true
  json.message_key: log
  multiline.pattern: '^[[:space:]]|^Caused by:|^{|^com|^org|^java'
  multiline.negate: false
  multiline.match: after
  {{end}}
  fields:
      {{range $key, $value := .Tags}}
      {{ $key }}: {{ $value }}
      {{end}}
      {{range $key, $value := $.container}}
      {{ $key }}: {{ $value }}
      {{end}}
  processors:
    - drop_fields:
        fields: [ "index" ]
# 性能优化
  harvester_buffer_size: 40960000
  filebeat.spool_size: 250000
  filebeat.idle_timeout: 1s
  tail_files: false
  close_inactive: 2h
  close_eof: false
  close_removed: true
  clean_removed: true
  close_renamed: true

{{end}}
