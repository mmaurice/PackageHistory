# Package History Script

Here we have a script that first schedules a cronjob to be run daily at noon. Note that inorder for the cron job to be properly scheduled you must put the PackageHist.sh script in the following directry:

	/home/$user/Scripts/PackageHistory/PackageHist.sh

Now the script parses you bash_hisrtory file for lines (commands) containing "apt-get install". If a line contains this then it is redirected into another bash.

The purpose of this is that you can run the new bash files to install all of the packages that you had on a previous setup. 

Finally the script will do the same thing if you have zsh_history file.

*NOTE*
The packages.sh is example of the output after running it on my machine.
	
