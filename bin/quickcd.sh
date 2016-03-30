# Wrapper function that executes a ruby script, the output is captured
# in $TEMPFILE, on ERROR_CODE 99 that temp file is executed
# on all other ERROR_CODEs it displays the contents of $TEMPFILE
# and exits
#
# This is so that any 'cd' commands are executed in the current environment
# and not a new shell, see http://codysoyland.com/2009/jun/15/quick-directory-changing-linux/
# which is the base idea for this functionality
#
#
# TODO is there any other way to get the output with error codes
# using $TEMPFILE seems strange
#
# TODO need checking to see if the config file exists
#
# TODO the algorithm for getting qcd_path is brittle and expects
#     name = value and will fail on name=value
#     for now this should be ok because when that setting is
#     saved by qcd it has spaces around =
#

function qcd {
    # echo "Parameter #1 is $1"
    # echo "Parameter #2 is $2"
  if [[ $QCD_PATH == "" ]]; then
    echo "Setting QCD_PATH environment variable on first run"
    IFS="="
      while read -r name value
      do
        # echo "Content of $name is ${value//\"/}"
        if [ $name == "~setting_qcd_path " ]; then # expects a space after string
          export QCD_PATH=${value//\"/}
          # echo "Found: ${value//\"/}"
        fi
      done < ~/.qcd/config
    unset IFS
  fi

  TEMPFILE=$(mktemp)

  ruby $QCD_PATH $* > $TEMPFILE
  EXIT_CODE=$?

  if [ $EXIT_CODE == 1 ]; then
    echo "qcd.sh: could not run script correctly: $QCD_PATH"
    echo "Check QCD_PATH in your ~/.bashrc file"
    echo "Currently QCD_PATH=$QCD_PATH"
    echo ""
    echo "run this ruby command for information on setting up qcd"
    echo "ruby /path/to/qcd/script/qcd --show-configure"
    return 1
  fi
  # echo "--- display contents of: $TEMPFILE"
  cat $TEMPFILE
  # echo "qcd.sh exit_code: $EXIT_CODE" #debug
  # echo "--- finished displaying $TEMPFILE"

  if [ $EXIT_CODE == 99 ]; then
    # echo "executing $TEMPFILE"
    # need some sanitation of input here to make sure that only the cd
    # command is going to be executed. Anything could be in the $TEMPFILE
    #
    line=$(head -n 1 $TEMPFILE)
    if [[ $line =~ ^cd* ]]
    then
      # echo "executing command: $line" #debug
      . $TEMPFILE
    else
      echo "$line"
      echo "NOT a valid command. Check your qcd settings"
    fi

   # else
     # echo "qcd.sh exit_code: $EXIT_CODE" #debug
  fi

  # delete the $TEMPFILE here to not polute the /tmp directory
  rm $TEMPFILE
}
