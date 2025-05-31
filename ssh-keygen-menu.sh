#!/bin/bash

show_menu() {
  clear
  echo "=== SSH Keygen Menu ==="
  echo "1. Generate a key interactively"
  echo "2. Generate an ed25519 key with specific options"
  echo "3. Generate an RSA 4096-bit key with email comment"
  echo "4. Remove keys of a host from known_hosts"
  echo "5. Retrieve the fingerprint of a key"
  echo "6. Change the password of a key"
  echo "7. Change the key format"
  echo "8. Retrieve public key from secret key"
  echo "0. Exit"
  echo "======================"
  echo
}

generate_interactively() {
  ssh-keygen
}

generate_ed25519() {
  ssh-keygen -t ed25519 -a 100 -f ~/.ssh/filename
}

generate_rsa() {
  ssh-keygen -t rsa -b 4096 -C "comment|email"
}

remove_known_hosts() {
  ssh-keygen -R remote_host
}

retrieve_fingerprint() {
  ssh-keygen -l -E md5 -f ~/.ssh/filename
}

change_password() {
  ssh-keygen -p -f ~/.ssh/filename
}

change_key_format() {
  ssh-keygen -p -N "" -m PEM -f ~/.ssh/OpenSSH_private_key
}

retrieve_public_key() {
  ssh-keygen -y -f ~/.ssh/OpenSSH_private_key
}

run_menu() {
  show_menu

  while true; do
    read -p "Enter your choice (0-8): " choice
    case $choice in
      0)
        echo "Exiting..."
        break
        ;;
      1)
        generate_interactively
        ;;
      2)
        generate_ed25519
        ;;
      3)
        generate_rsa
        ;;
      4)
        remove_known_hosts
        ;;
      5)
        retrieve_fingerprint
        ;;
      6)
        change_password
        ;;
      7)
        change_key_format
        ;;
      8)
        retrieve_public_key
        ;;
      *)
        echo "Invalid choice. Please try again."
        ;;
    esac

    echo
    read -p "Press Enter to continue..."
    show_menu
  done
}

run_menu

