This is a batch script designed to execute certain functions based on user input.

The script takes in command line arguments and executes the appropriate function. 

The available functions are:
- init_script: Initializes a new project folder with a specific structure and files.
- delete_script: Deletes a specified folder.
- run_script: Runs a specified script.

If an invalid function is entered as an argument, an error message is displayed.

The "init_script" function creates a new project folder with a specified structure and files, including a package.json file and a main app.js file. It also prompts the user to open the new project folder in explorer. 

The "delete_script" function deletes a specified folder. If the "-q" flag is included as an argument, the folder is deleted without prompting the user for confirmation. 

The "run_script" function runs a specified script. Currently, only the "file_manager" script is supported.

If any of the commands fail to execute, an error message is displayed.

#Copyright © Chan Guo Xin
