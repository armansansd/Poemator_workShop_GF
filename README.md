Poemator_workShop_GF
====================

petit poème automatique


I used a Raspberry pi to print each pdf created by Poemator

1. Install CUPS
(http://www.howtogeek.com/169679/how-to-add-a-printer-to-your-raspberry-pi-or-other-linux-computer/) 

```sudo apt-get install cups```

add pi to lpadmin
```sudo usermod -a -G lpadmin pi```

ocomplete the configuration, open .conf
```sudo nano /etc/cups/cupsd.conf```

Change this lines  
```# Only listen for connections from the local machine
# Listen localhost:631
Port 631

< Location / >
# Restrict access to the server...
Order allow,deny
Allow @local
< /Location >

< Location /admin >
# Restrict access to the admin pages...
Order allow,deny
Allow @local
< /Location >

< Location /admin/conf >
AuthType Default
Require user @SYSTEM

# Restrict access to the configuration files...
Order allow,deny
Allow @local
< /Location >```

restart
```sudo /etc/init.d/cups restart``` 

to open cups
>> Http://Ipadress:631


