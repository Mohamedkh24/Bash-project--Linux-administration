# User & Group Management Controller

This project is designed to simplify some administrative tasks using a collection of Bash scripts . The script uses the `whiptail` utility to create a text-based user interface, allowing administrators to perform various user and group management tasks.

## Features

### User Management
 - **List Users:**
   - Display all users currently in the system.
- **Add User:**
   - Add a new users to the system with an interactive prompt.
- **Modify User:**
   - Modify an existing user’s details.
   - Features include:
      - **Change User Name:** Assign a new username to an existing user.
      - **Change User ID:** Assign a new User ID to an existing account.
      - **Set Primary Group:** Change the primary group of a user.
      - **Add Gecos:** Adding information about the user.
      - **Append Groups:** Add the user to additional groups without affecting current memberships.
      - **Change Home Directory:** Specify a new home directory for an existing user.
      - **Change Shell:** Change the login shell of the user.
- **Enable User:**
   - Unlock a user account that has been disabled.
- **Disable User:**
   - Lock a user account to prevent access.
- **Change Password:**
   - Change the password for a user.
- **Delete User:**
   - Safely remove users from the system with confirmation prompts to prevent accidental deletions.
### Group Management
- **List Groups:**
   - Display all groups in the system.
- **Add Group:**
   - Create a new groups.
- **Modify Group:**
   - Modify the details of an existing group and its members.
- **Delete Group:**
   - Remove an existing group from the system.
- **About:**
   - Display information about the program.
- **Exit:**
   - Close the program.

## Installation
1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Mohamedkh24/Bash-project--Linux-administration.git
   cd Bash-project--Linux-administration
   ```
2. **Make Scripts Executable:**

   ```bash
   chmod +x *
   ```
## Usage
1. **Run the Main Menu:**
    Execute the main menu script to display the Admin menu

   ```bash
   ./main_menu.sh
   ```
2. **Navigate the Menu:**
   Follow the on-screen prompts to manage users and groups.  
   
##  Script Structure
- **main_menu.sh:** The main script that presents the menu and handles user selections.
- **list_users.sh:** Script to list all users.
- **add_user.sh:** Script to add a new user.
- **modify_user.sh:** Script to modify an existing user.
- **enable_user.sh:** Script to enable/unlock a user account.
- **disable_user.sh:** Script to disable/lock a user account.
- **change_pass.sh:** Script to change a user's password.
- **delete_user.sh:** Script to delete a user.
- **list_group.sh:** Script to list all groups.
- **add_group.sh:** Script to add a new group.
- **modify_group.sh:** Script to modify an existing group.
- **delete_group.sh:** Script to delete a group.
- **about.sh:** Script to display information about the program

## Contributing
Contributions are welcome! If you would like to contribute, please fork the repository and submit a pull request.

## Author
- **Mohamed Khalid** - Mohamedkh24
