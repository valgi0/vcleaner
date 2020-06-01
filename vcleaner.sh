echo "********Removing files from pgk and .cache directories**********"
rm -f /var/cache/pacman/pkg/*
rm -fr ~/.cache/

paccache -rk1 # to clean cache also for installe packages. Remove all previous version and keep 1 lastest verions
sudo pacman -Rns $(pacman -Qtdq) # Remove all orphan packages
yay -Yc #remove uneeded dependencies


echo "***************** INFO *********************"
echo -e "\n**** Space on /dev/sda6****"
df -H /dev/sda6 
echo -e "\n\n***** Packages installed ******\n"
yay -Ps

echo -e "\n\n******* Biggest files in the system *********\n"
sudo find / -type f -size +500M -exec ls -lh {} \; | awk '{ print $NF ": " $5 }'

