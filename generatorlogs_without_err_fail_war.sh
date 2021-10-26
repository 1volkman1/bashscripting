#! /usr/bin/env bash
# save argument to arrow start with a third arg
myArray=${@:3}
echo $myArray
####################
# check that  arguments are non-numeric strings

for i in ${myArray[@]}; do
# echo $i //using for test 
  if [[ $i  =~ [0-9]+ ]];then
      echo "Upss one of additional arguments get numeric digital in name. Start agin using non-numeric symbol in name";
      exit 1
  fi
done
######################
#Creates a directory $HOME/mylogs

dir=$HOME/mylogs
if [[ ! -e $dir ]]; then
    mkdir $dir
elif [[ ! -d $dir ]]; then
    echo "$dir already exists but is not a directory" 1>&2
fi

######################
#Creates a file called <name>.log in the directory

touch $dir/$1.log

####################
#For <count> times iterates over the list of additional arguments
#And writes a line with a the argument string and a random word (use $RANDOM ) out of the following list
Exceptionlist=(normal request alert notice note)
echo ${Exceptionlist[@]}
for ((i = 1 ; i <= $2 ; i++));do
   for j in ${myArray[@]}; do 
     echo "$j ${Exceptionlist[$((RANDOM % ${#Exceptionlist[@]}))]}" >> $dir/$1.log
   done
done
