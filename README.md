## 安裝 mysql 
- 拉取 mysql 映像
```
$ docker pull mysql:8
```
- 檢查映像
```
$ docker images
```
- 檢查 mysql 映像
docker images | grep mysql

- 運行 mysql 容器
docker run --name sql2 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Qwer890@ -d mysql:8


## 安裝 JWT
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer