# Trust-Fall-Wifi-hack
AP-Less hacking tool to initiate and collect EAPOL handshakes.

You must have scapy 2.3.3 and above to use this script.
* For some reason, cracking with windows hashcat works but not on linux
*During  the check for handshake capture, It stores alot of frames, So be mindful of the space or how long you run it for.
*The tool is dependent on Airodump-ng  and airbase-ng to capture handshake and rouge-AP respectively.
*Feel you an make the tool better with more modules, I'll be glad to partner :)
Link to demo https://youtu.be/b9tU3YeN_-o
The 3 main files are;

i. clientprobe.py-> Listens for x amount of beacon frames and allows you select your target one done. 
ii. handshake.sh-> This bash script recieves input from the clientprobe.py, creates a fake AP and tricks the user to auto connect to the fake AP. This is where a lot of disk space is consumed as the frames are writen to the handshakecheck.txt file and constantly checking for the keyword 'handshake'. The longer it takes for the client/phone/laptop to try an EAPOL authentication to us, the longer it will take to get the confirmation and the more disk space will be consumed. You will notice your PC might start to slowdown. At the point, if you give up on catching the frames, hit ctrl +c twice and use top command to find the airbase and airodupm processess and kill em softly.
iii. handshakecheck.txt -> checking for the keyword handshake during frame capture

Scan_Probes.py ->This script only listens for probes around and colorises them. Also, the wifi device interface is set to static as "interface = 'wlan1mon'". If your wifi device is not 'wlan1mon' it won't run properly. feel free to change this to your device or you can  dynamically call the interface with a simple line of code.


*****Limitations of the tool******
1.The tool cannot exit properly of you decide to kill(stop) it midway
2. Instead of the script serching for the keyword 'handshake' it can search for only the first two EAPOL packets, hence, saving time and space. This is more of playing with the frames using Scapy


Tool caveat-> the probes don't tell you if its a WEP/WPA


