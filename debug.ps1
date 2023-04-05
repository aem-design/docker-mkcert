Param(
  [string]$LOG_PATH = "${PWD}\logs",
  [string]$LOG_PEFIX = "docker",
  [string]$LOG_SUFFIX = ".log",
  [string]$TAG = "latest",
  [string]$NAME = "aemdesign/mkcert",
  [string]$FILE = "Dockerfile",
  [string]$FUNCTIONS_URI = "https://github.com/aem-design/aemdesign-docker/releases/latest/download/functions.ps1",
  [string]$COMMAND = "docker build . -f .\${FILE} -t ${NAME}:${TAG}"
)

$SKIP_CONFIG = $true
$PARENT_PROJECT_PATH = "."

. ([Scriptblock]::Create((([System.Text.Encoding]::ASCII).getString((Invoke-WebRequest -Uri "${FUNCTIONS_URI}").Content))))

printSectionBanner "Loading Debug Image"
printSectionLine "$COMMAND" "warn"

$IMAGENAME=Select-String -path $FILE '.*imagename="(.*)".*' -AllMatches | Foreach-Object {$_.Matches} | Foreach-Object {$_.Groups[1].Value}

docker run -it --rm -v ${PWD}/certs:/certs:rw ${NAME}:${TAG} /bin/sh
docker run -it --rm -v ${PWD}/certs:/certs:rw ${NAME}:${TAG} /bin/sh -c "mkcert -install && mkcert -cert-file mkcert.pem -key-file mkcert.key -client localhost.dev localhost 127.0.0.1 ::1 && openssl pkcs12 -export -out mkcert.pfx -in mkcert.pem -inkey mkcert.key -certfile rootCA.pem -passout pass:123"
