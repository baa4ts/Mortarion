openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes `
-subj "/C=AR/ST=None/L=None/O=CTF-Corp/OU=RedTeam/CN=localhost"
