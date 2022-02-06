{{- define "boolToStr" }}
{{- if . -}}
  "enabled"
{{- else -}}
  "disabled"
{{- end -}}
{{- end -}}

{{- define "_arrayjoin"}}
{{- range $i, $val := . }}
{{- (print $val ",") -}}
{{ end -}}
{{- end -}}

{{- define "array.join" }}
{{- include "_arrayjoin" . | trimSuffix "," | quote -}}
{{- end -}}

{{- define "_sitoNum" }}
{{- if hasSuffix "Gi" . -}}
{{ mul (mul (mul (trimSuffix "Gi" . | atoi) 1024) 1024) 1024 }}
{{- else if hasSuffix "Mi" . -}}
{{ mul (mul (trimSuffix "Mi" . | atoi) 1024) 1024 }}
{{- else if hasSuffix "Ki" . -}}
{{ mul (trimSuffix "Ki" . | atoi) 1024 }}
{{- end -}}
{{- end -}}

{{- define "si.toNum" }}
{{- include "_sitoNum" . | quote -}}
{{- end -}}

{{- define "probeTcp" -}}
livenessProbe:
  tcpSocket:
    port: {{ . }}
  initialDelaySeconds: 5
  periodSeconds: 10
  timeoutSeconds: 3
  failureThreshold: 3
readinessProbe:
  tcpSocket:
    port: {{ . }}
  initialDelaySeconds: 15
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 3
startupProbe:
  tcpSocket:
    port: {{ . }}
  initialDelaySeconds: 60
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 3
{{- end -}}

{{- define "probeHttp" -}}
livenessProbe:
  httpGet:
    path: /health
    port: {{ . }}
  initialDelaySeconds: 5
  periodSeconds: 10
  timeoutSeconds: 3
  failureThreshold: 3
readinessProbe:
  httpGet:
    path: /ping
    port: {{ . }}
  initialDelaySeconds: 15
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 3
startupProbe:
  httpGet:
    path: /ping
    port: {{ . }}
  initialDelaySeconds: 15
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 3
{{- end -}}

# Place it to initContainers section
{{- define "influxdbCheck" -}}
- name: influxdb-check
  image: curlimages/curl:7.80.0
  command: [
      "/usr/bin/curl",
      "http://{{ .Release.Name }}-influxdb.{{ .Release.Namespace }}:{{ .Values.influxdb.port }}/health"
    ]
{{- end }}

{{- define "dbCheck" -}}
- name: db-check
  image: sami/mysql-client:3.4
  command: [
      "mysqlshow",
      "--host=aw-test-db.appwrite",
      "--user=user",
    ]
  env:
    - name: MYSQL_PWD
      valueFrom:
        secretKeyRef:
          name: "{{ .Release.Name }}-env"
          key: _APP_DB_PASS
{{- end }}

{{- define "redisCheck" -}}
- name: redis-check
  image: redis:6.0-alpine3.12
  command: [
    '/usr/local/bin/redis-cli',
    "-h", "{{ .Release.Name }}-redis.{{ .Release.Namespace }}", "-p", "{{ .Values.redis.port }}",
    '-r', '3', '-i', '5',
    {{ if ne .Values.redis.user "" -}}
    "-u", "{{ .Values.redis.user }}",
    {{ end -}}
    {{ if ne .Values.redis.pass "" -}}
    '-a', '$REDIS_PASS',
    {{ end -}}
  ]
  {{ if ne .Values.redis.pass "" -}}
  env:
    - name: REDIS_PASS
      valueFrom:
        secretKeyRef:
          name: "{{ .Release.Name }}-env"
          key: _APP_REDIS_PASS
  {{ end -}}
{{- end }}

{{- define "redisEnv" -}}
- name: _APP_REDIS_HOST
  value: "{{ .Release.Name }}-redis.{{ .Release.Namespace }}"
- name: _APP_REDIS_PORT
  valueFrom:
    configMapKeyRef:
      name: "{{ .Release.Name }}-env"
      key: _APP_REDIS_PORT
{{ if ne .Values.redis.user "" -}}
- name: _APP_REDIS_USER
  valueFrom:
    secretKeyRef:
      name: "{{ .Release.Name }}-env"
      key: _APP_REDIS_USER
{{ end -}}
{{ if ne .Values.redis.pass "" -}}
- name: _APP_REDIS_PASS
  valueFrom:
    secretKeyRef:
      name: "{{ .Release.Name }}-env"
      key: _APP_REDIS_PASS
{{ end -}}
{{- end }}

{{- define "smtpEnv" -}}
{{- with .Values.smtp }}
{{- if and ( ne .host "" ) ( ne .port "" ) ( ne .user "" ) ( ne .pass "" ) -}}
- name: _APP_SMTP_HOST
  valueFrom:
    configMapKeyRef:
      name: "{{ $.Release.Name }}-env"
      key: _APP_SMTP_HOST
- name: _APP_SMTP_PORT
  valueFrom:
    configMapKeyRef:
      name: "{{ $.Release.Name }}-env"
      key: _APP_SMTP_PORT
- name: _APP_SMTP_SECURE
  valueFrom:
    configMapKeyRef:
      name: "{{ $.Release.Name }}-env"
      key: _APP_SMTP_SECURE
- name: _APP_SMTP_USERNAME
  valueFrom:
    secretKeyRef:
      name: "{{ $.Release.Name }}-env"
      key: _APP_SMTP_USERNAME
- name: _APP_SMTP_PASSWORD
  valueFrom:
    secretKeyRef:
      name: "{{ $.Release.Name }}-env"
      key: _APP_SMTP_PASSWORD
{{- end -}}
{{- end -}}
{{- end }}

{{- define "dbEnv" -}}
- name: _APP_DB_HOST
  value: "{{ .Release.Name }}-db.{{ .Release.Namespace }}"
- name: _APP_DB_PORT
  valueFrom:
    configMapKeyRef:
      name: "{{ .Release.Name }}-env"
      key: _APP_DB_PORT
- name: _APP_DB_SCHEMA
  valueFrom:
    configMapKeyRef:
      name: "{{ .Release.Name }}-env"
      key: _APP_DB_SCHEMA
- name: _APP_DB_USER
  valueFrom:
    secretKeyRef:
      name: "{{ .Release.Name }}-env"
      key: _APP_DB_USER
- name: _APP_DB_PASS
  valueFrom:
    secretKeyRef:
      name: "{{ .Release.Name }}-env"
      key: _APP_DB_PASS
{{- end }}