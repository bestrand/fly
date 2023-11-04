apk add --no-cache go
wget https://raw.githubusercontent.com/bestrand/fly/main/go/main.go
go mod init main && go mod tidy
go run .
