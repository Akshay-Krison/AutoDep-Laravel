#!/bin/bash
# Set the repeat status of entry
SET_STATUS=0;
# Set the color variable
yellow='\033[1;33m';
red='\033[1;31m';
# Clear the color after that
clear='\033[0m';
#looping the data insert
for (( i=0; i != 1 ;  ))
do
echo
if [ $SET_STATUS == 0 ]
then
echo 
read -p "Insert the Project Name (same as the git repo name) : " PROJECTNAME;
echo
read -p "Enter the domain you want to deploy : " YOURDOMAIN;
echo
read -p "Insert the DB Name : " DATABASENAME;
echo
read -p "Insert the DB Password : " DATABASEPASS;
echo 
read -p "Insert the GIT_URL want to clone : " GITURL;
echo
read -p "Define the Branch you want to clone : " BRNACHNAME;
echo
else
echo -e "${red}Insert the Project Name Correctly (same as the git repo name)... ${clear}"
read -p "Project Name : " PROJECTNAME;
echo
echo -e "${red}Enter the domain you want to deploy Correctly ${clear}"
read -p "Domain Name : " YOURDOMAIN;
echo
echo -e "${red}Insert the DB Name Correctly.. ${clear}"
read -p "DB Name : " DATABASENAME;
echo
echo -e "${red}Insert the DB Password Correctly.. ${clear}"
read -p "DB Password : " DATABASEPASS;
echo
echo -e "${red}Insert the Git URL want to clone Correctly.. ${clear}"
read -p "Git URL : " GITURL;
echo
echo -e "${red}Define the Branch you want to clone Correctly... ${clear}"
read -p "Branch Name :" BRNACHNAME;
echo
fi
echo "Confirm the below Values are enterd correct"
echo "----------------------------------------------"
echo -e "Project Name       :${yellow} $PROJECTNAME ${clear}"
echo -e "Database Name      :${yellow} $DATABASENAME ${clear}"
echo -e "Database Password  :${yellow} $DATABASEPASS ${clear}"
echo -e "Domain Name        :${yellow} $YOURDOMAIN ${clear}"
echo -e "Git URL            :${yellow} $GITURL ${clear}"
echo -e "Branch Name        :${yellow} $BRNACHNAME ${clear}"
echo 
echo "Enter Yes to Confirm else enter No to Re-enter the Details..."
echo
echo "Please Confirm Yes or No"
echo
PS3="Enter 1 For Yes Enter 2 For No...?: "
select STATUS1 in  Yes No
do
    case $STATUS1 in 
        Yes)
            echo
            echo "Configuration Successfully added..."
            export PROJECT_NAME="$PROJECTNAME";
            export DATABAS_ENAME="$DATABASENAME";
            export DATABASE_PASS="$DATABASEPASS";
            export YOUR_DOMAIN="$YOURDOMAIN";
            export GIT_URL="$GITURL";
            export BRNACH_NAME="$BRNACHNAME";
            i=1;
            break
            ;;
        No)
            echo "Re-enter the Configurations.."
            SET_STATUS=1;
            i=0;
            break;
            ;;
    esac
done
done