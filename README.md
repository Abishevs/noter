# Noter the best
Terminal note taking system or more an app to make note taking faster
## Configuration
1. clone this repo into a folder of your choice in the home directory
````Bash
$ git clone https://github.com/Abishevs/noter.git
``````
2. Make file executable
```Bash
$ chmod +x note.sh
```
3. Add softlink to /usr/bin/ to excecute noter from anywhere in the terminal
````bash
ln -s ~/your_folder/scripts/note.sh /usr/bin/
``````
scripts is the file where noter will be placed

4. Add an alias to .bashrc to make not use .sh everytime
````Bash
$ vim ~/.bashrc
``````
Find where all alias are placed and paste this in
```vim
# custom alias
alias noter='note.sh'
`````````
5. Add google drive sync to an directory ~/myGoogleDrive/
Steps for doing that will i add later...
6. Enjoy by typing first noter -h to get all availble commands
````Bash
$ noter -h
Noter the best note taking app on the market
Version: 0.1.0

options:
-d     Create a daily note or open existing one.
-q     Create a quick note.
-w     Create a weekly note or open an existing one.
-y     Create a yearly note or open an existing one.
-o     Open this weeks personal notes.
-t     Create a tech_note for ideas
-e     Edit Noter source code
-h     Print this Help.
``````

