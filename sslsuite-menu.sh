#!/bin/bash

function pause() {
    read -rp "Press Enter to resume execution..."
}

printf "sslscan, ssldump, sslsniff, and sslsplit are different tools used for analyzing and testing SSL/TLS connections, but they serve different purposes:

sslscan: It is a command-line tool used to assess the security configuration of SSL/TLS services. It connects to a remote host and performs a series of tests to evaluate the supported cipher suites, SSL/TLS versions, and potential vulnerabilities. It provides information about the SSL/TLS configuration and helps identify weaknesses that could be exploited by attackers.

pause

ssldump: It is a packet sniffer tool specifically designed for SSL/TLS connections. It captures and analyzes network traffic between a client and server, allowing you to inspect the SSL/TLS handshake, view encrypted data, and analyze the SSL/TLS protocol negotiation. ssldump is useful for troubleshooting SSL/TLS communication issues, debugging, and studying the internals of the protocol.

pause

sslsniff: It is a tool used for transparently intercepting SSL/TLS connections. It acts as a proxy server, allowing you to monitor and capture SSL/TLS traffic between clients and servers. By intercepting the traffic, sslsniff can analyze the exchanged data, decrypt SSL/TLS traffic, and perform various security tests and attacks. It helps identify vulnerabilities, misconfigurations, or potential security weaknesses in SSL/TLS implementations.

pause

sslsplit: It is another transparent SSL/TLS interception tool, similar to sslsniff. It allows you to intercept SSL/TLS connections and redirect them to a local proxy server. With sslsplit, you can analyze and modify the intercepted traffic, log SSL/TLS sessions, or even split the SSL/TLS connections into separate components for further inspection. It is often used for security analysis, testing, and debugging of SSL/TLS communications.

It's important to note that these tools should be used responsibly, with proper authorization and for legitimate purposes such as security assessments, debugging, or educational research. Using them without proper authorization or for malicious purposes is illegal and unethical. Always ensure you comply with applicable laws and respect the privacy and security of others."

pause

echo

while true; do
    clear
    echo "==== SSL Tools Menu ===="
    echo "1. ssldump"
    echo "2. sslscan"
    echo "3. sslsniff"
    echo "4. sslsplit"
    echo "5. Quit"

    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)
            while true; do
                clear
                echo "==== ssldump Menu ===="
                echo "1. Capture SSL/TLS Traffic"
                echo "2. Analyze Existing SSL/TLS Capture"
                echo "3. Back"

                read -p "Enter your choice (1-3): " ssldump_choice

                case $ssldump_choice in
                    1)
                        sudo ssldump -i eth0 port 443
                        ;;
                    2)
                        read -p "Enter the path to the ssldump capture file: " ssldump_file
                        sudo ssldump -r $ssldump_file
                        ;;
                    3)
                        break
                        ;;
                    *)
                        echo "Invalid choice. Please try again."
                        read -p "Press Enter to continue..."
                        ;;
                esac
            done
            ;;
        2)
            read -p "Enter the target host or IP address: " target_host
            sslscan $target_host
            ;;
        3)
            read -p "Enter the target host or IP address: " target_host
            sslsniff -a -c $target_host
            ;;
        4)
            while true; do
                clear
                echo "==== sslsplit Menu ===="
                echo "1. Split SSL/TLS Traffic"
                echo "2. Back"

                read -p "Enter your choice (1-2): " sslsplit_choice

                case $sslsplit_choice in
                    1)
                        read -p "Enter the path to the sslsplit certificate file: " sslsplit_cert
                        sudo sslsplit -D -l connections.log -S logdir/ -k $sslsplit_cert ssl 0.0.0.0 8443 tcp 0.0.0.0 8080
                        ;;
                    2)
                        break
                        ;;
                    *)
                        echo "Invalid choice. Please try again."
                        read -p "Press Enter to continue..."
                        ;;
                esac
            done
            ;;
        5)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            read -p "Press Enter to continue..."
            ;;
    esac
done

