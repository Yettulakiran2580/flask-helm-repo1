{{/*
Create a default fully qualified app name.
*/}}
{{- define "flask-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "flask-app.labels" -}}
app.kubernetes.io/name: {{ include "flask-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "flask-app.serviceAccountName" -}}
{{- $sa := .Values.serviceAccount -}}
{{- if and $sa (kindIs "map" $sa) (default false $sa.create) -}}
    {{- default (include "flask-app.fullname" .) $sa.name -}}
{{- else if and $sa (kindIs "map" $sa) -}}
    {{- default "default" $sa.name -}}
{{- else -}}
    default
{{- end -}}
{{- end -}}
