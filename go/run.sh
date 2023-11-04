apk add --no-cache go
wget https://raw.githubusercontent.com/bestrand/fly/c65217eea3461aa3c06249fdf0a509bee37dfb84/go/main.go
go mod init main && go mod tidy
go run .
