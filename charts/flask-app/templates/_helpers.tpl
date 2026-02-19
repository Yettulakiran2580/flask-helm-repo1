{{- define "flask-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flask-app.labels" -}}
app.kubernetes.io/name: {{ include "flask-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
# The line below is the fix: added | quote
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "flask-app.serviceAccountName" -}}
{{- if and .Values.serviceAccount .Values.serviceAccount.name }}
{{- .Values.serviceAccount.name -}}
{{- else -}}
{{- include "flask-app.fullname" . -}}
{{- end -}}
{{- end -}}
