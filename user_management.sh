
#!/bin/bash
file="users.txt"
touch "$file"

add_user() {
    read -p "Enter username: " name
    if grep -Fxq "$name" "$file"; then
        echo "User '$name' already exists."
    else
        echo "$name" >> "$file"
        echo "User '$name' added."
    fi
}

delete_user() {
    read -p "Enter username to delete: " name
    if grep -Fxq "$name" "$file"; then
        grep -Fxv "$name" "$file" > temp.txt && mv temp.txt "$file"
        echo "User '$name' deleted."
    else
        echo "User '$name' not found."
    fi
}

list_users() {
    echo "Current users:"
    cat "$file"
}

while true; do
    echo -e "\n1. Add User\n2. Delete User\n3. List Users\n4. Exit"
    read -p "Choose an option: " choice
    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) echo "Program ended!"; break ;;
        *) echo "Invalid choice." ;;
    esac
done

