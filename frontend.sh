echo disabling in nginx
dnf module disable nginx -y

echo enabling nginx 20
dnf module enable nginx:1.24 -y

echo installing nginx
dnf install nginx -y

copying the conf file
cp nginx.conf /etc/nginx/nginx.conf

echo removing the default content of the web
rm -rf /usr/share/nginx/html/*

echo downloading the app content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo enabling the nginx service
systemctl enable nginx

echo restart the nginx server
systemctl restart nginx