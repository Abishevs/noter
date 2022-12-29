#/bin/bash
############################################################
# Help                                                     #
############################################################
VERSION=0.1.2
Help()
{
   # Display Help
   echo "Noter the best note taking app on the market"
   echo "Version: $VERSION"
   echo
   echo "options:"
   echo "-d     Create a daily note or open existing one."
   echo "-q     Create a quick note."
   echo "-w     Create a weekly note or open an existing one."
   echo "-y     Create a yearly note or open an existing one."
   echo "-o     Open this weeks personal notes."
   echo "-t     Create a tech_note for ideas"
   echo "-e     Edit Noter source code"
   echo "-h     Print this Help."
   echo
}
######################
# Global variables ##
# ###################
NAME="Webmaster"

OBSIDIAN=~/Desktop/obsidian
OPEN_EDITOR=nvim #choose your editor of choice like vim,nvim,lvim, nano etc
TEMPLATES=$OBSIDIAN/templates
YEAR=`date +%Y`
MONTH=`date +%B`
WEEK=`date +%V`
PERSONAL_NOTES=$OBSIDIAN/Personal_logs
MNOTES=$PERSONAL_NOTES/${YEAR}/$MONTH
WNOTES=$MNOTES/week-$WEEK
YNOTES=$PERSONAL_NOTES/$YEAR
RNOTES=$OBSIDIAN/Quick_notes
WEEKLY=$YNOTES/weekly
check_if_exists()
{

  if [ ! -d $YNOTES ]; then mkdir $YNOTES 
  fi
  if [ ! -d $MNOTES ]; then mkdir $MNOTES
  fi
  if [ ! -d $WNOTES ]; then mkdir $WNOTES
  fi
  if [ ! -d $RNOTES ]; then mkdir $RNOTES
  fi
  if [ ! -d $WEEKLY ]; then mkdir $WEEKLY 
  fi
}

echo "Good morning $NAME!"
check_if_exists #Cheks for folders for notes, makes them if needed.

DailyNote()
{
  #Daily note logic here
  NOTE_NAME=`date +%Y-%m-%d`.md  
  # TEMPLATE=$TEMPLATES/template_dnote.md
  NOTE=$PERSONAL_NOTES/${YEAR}/${MONTH}/week-${WEEK}/$NOTE_NAME
  TIME=`date +%X`
  if [ -f "$NOTE" ]; then # if exists open note
    $OPEN_EDITOR $NOTE 
  else
    echo "Good morning $NAME!"
    echo -e "Created at: $TIME Updated at: \n ## Morning Thoughts \n\n ## Tasks \n - [ ] \n - [ ] \n ## Reflection \n\n ## Plan for tomorrow \n *  \n *  \n ## Night Thoughts \n\n " > $NOTE
    echo "Creating from template..."
    $OPEN_EDITOR $NOTE #open note
    echo "Created $NOTE at: "
  fi
}

RandomNote()
{
  NOTE_NAME=`date +%Y-%m-%d-createdAt:%X`.md
  NOTE=$RNOTES/$NOTE_NAME
  lvim $NOTE
}

WeeklyNote()
{
  NOTE_NAME=`date +%Y-week-%V`.md
  NOTE=$WEEKLY/$NOTE_NAME
  TIME=`date +%X`
  if [ -f "$NOTE" ]; then # if exists open note
    $OPEN_EDITOR $NOTE 
  else
    echo -e "Created at: $TIME Updated at: \n ## This weeks thoughts \n\n ## Weekly Tasks \n - [ ] \n - [ ] \n ## Reflection over the week \n\n ## Plans for next week \n *  \n *  \n" > $NOTE
    echo "Creating from template..."
    $OPEN_EDITOR $NOTE #open note
    echo "Created $NOTE at: "
  fi
}
############################################################
############################################################
# Main program                                             #
############################################################
############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":hdwrqeot" option; do
   case $option in
      h) # display Help
        Help
        exit;;
      d) # Start an daily note
        DailyNote 
        exit;;
      w) # weekly note 
        WeeklyNote
        exit;;
      r | q) # random note
        RandomNote
        exit;;
      t) # tech note
        read -p "Name of the file: " TECH_NOTE_NAME 
        ${OPEN_EDITOR} ${OBSIDIAN}/Tech_notes/${TECH_NOTE_NAME}.md
        exit;;
      o) # open week notes folder
        ${OPEN_EDITOR} ${WNOTES}
        exit;;
      e) # Edit noter
        ${OPEN_EDITOR} ~/Desktop/noter/note.sh
        exit;;
      \?) # Invalid option
       echo "Error: Invalid option"
       echo "Type 'noter -h' for help"
       exit;;
   esac
done

