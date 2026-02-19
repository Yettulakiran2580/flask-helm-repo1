{{- define "flask-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flask-app.labels" -}}
app.kubernetes.io/name: {{ include "flask-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: Helm
{{- end -}}

{{- define "flask-app.serviceAccountName" -}}
{{- $sa := .Values.serviceAccount -}}
{{- if and $sa $sa.name }}
{{- $sa.name -}}
{{- else -}}
{{- include "flask-app.fullname" . -}}
{{- end -}}
{{- end -}}
