echo =====================================
echo -e \\e[31mdisabling in nginx
echo =====================================
dnf module disable nginx -y

echo =====================================
echo enabling nginx 20
echo =====================================
dnf module enable nginx:1.24 -y

echo =====================================
echo installing nginx
echo =====================================
dnf install nginx -y

echo =====================================
echo copying the conf file
echo =====================================
cp nginx.conf /etc/nginx/nginx.conf

echo ========================================
echo removing the default content of the web
echo ========================================
rm -rf /usr/share/nginx/html/*

echo =============================
echo downloading the app content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
echo =============================

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo ===========================
echo enabling the nginx service
echo ===========================
systemctl enable nginx

echo ===========================
echo restart the nginx server
echo ===========================
systemctl restart nginx