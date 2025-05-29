#define CPPHTTPLIB_OPENSSL_SUPPORT
#include <nlohmann/json.hpp>
#include <httplib.h>
#include <iostream>
#include <string>

int main()
{
    httplib::SSLServer Servidor("cert.pem", "key.pem");

    Servidor.Post("/", [](const httplib::Request &req, httplib::Response &res) {
        std::cout << "=== Nueva petición POST ===\n";
        std::cout << req.body << std::endl;
        std::cout << "===========================\n";

        res.set_content("Recibido", "text/plain");
    });

    std::cout << "[*] Servidor escuchando en https://localhost:8080\n";
    Servidor.listen("0.0.0.0", 8080);
}
