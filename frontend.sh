echo =====================================
echo -e \e[1;31mdisabling in nginx\\e[0m
echo =====================================
dnf module disable nginx -y

echo =====================================
echo -e \\e[32menabling nginx 20\\e[0m
echo =====================================
dnf module enable nginx:1.24 -y

echo =====================================
echo -e \\e[33minstalling nginx\\e[0m
echo =====================================
dnf install nginx -y

echo =====================================
echo -e \\e[35mcopying the conf file\\e[0m
echo =====================================
cp nginx.conf /etc/nginx/nginx.conf

echo ========================================
echo -e \\e[34mremoving the default content of the web\\e[0m
echo ========================================
rm -rf /usr/share/nginx/html/*

echo =============================
echo -e \\e[36mdownloading the app content\\e[0m
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
echo =============================

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo ===========================
echo -e \\e[32menabling the nginx service\\e[0m
echo ===========================
systemctl enable nginx

echo ===========================
echo -e \\e[31mrestart the nginx server\\e[0m
echo ===========================
systemctl restart nginx