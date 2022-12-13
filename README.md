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


## 發佈程式
dotnet publish --configuration Release

發佈記得 修改 app.js

## 帳號
anita/827ccb0eea8a706c4c34a16891f84e7b

## 
http://demo.sunyu-tech.com.tw/WebDemo/