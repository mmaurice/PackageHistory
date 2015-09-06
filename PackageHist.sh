#!/bin/sh

user=$(whoami)

fil=~/.bash_history

#test for existence of the hist log file
pack=packages.sh

if [ -f $pack ]
then
	rm -r $pack
else
	com="bash /home/$user/Scripts/PackageHistory/PackageHist.sh"
	job="0 12 * * * $com"
	cat <(fgrep -i -v "$com" <(crontab -l)) <(echo "$job") | crontab -
	echo "New Task Scheduled!"
fi

echo "#!/bin/sh" >> packages.sh

if [ -f $fil ]
then

  #read through the file line by line looking for apt-get insttall <package>
  #Then add that line to a new bash file that can be run to install those packages
  while read line
  do
    if [[ $line == *"apt-get install"* ]] || [[ $line == *"curl"* ]] || [[ $line == *"wget"* ]]
    then
    	echo $line >> packages.sh
    fi
  done < $fil

fi

#Now do the same for the zsh hist file if you are using zshell!

zfil=~/.zsh_history

if [ ! -f $pack ]
then
	echo "#!/bin/sh" >> packages.sh
fi

if [ -f $zfil ]
then

  #read through the file line by line looking for apt-get insttall <package>
  while read zline
  do
    if [[ $zline == *"apt-get install"* ]] || [[ $zline == *"curl"* ]] || [[ $zline == *"wget"* ]]
    then
    	echo ${zline#*;} >> packages.sh
    fi
  done < $zfil

fi
