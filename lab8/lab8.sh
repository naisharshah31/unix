echo "Name: Naishar Shah"
echo "Reg.No: 1947258"
while true
do
echo ""
echo ""
echo "1. Write a shell program to find the number of unique words and vowels in a file along with line number. "
echo "2. shell script to display the frequency of occurrence of each character present in the text document and display the character which has the maximum frequency of occurrences and store it in a separate fil"
echo "3. Write a shell script to replace the string Christ University as CHRIST (Deemed to be University) in the given text document."
echo "4. EXIT"
echo "Enter your choice"
read choice
case $choice in
   1) echo -n "enter the file name:"
      read fname
      echo "these are the unique words:"
      grep -oEn '\w+' $fname | sort | uniq
      echo -n "the the total uniq words are:"
      grep -oE '\w+' $fname | sort | uniq | wc -l
      echo "the vowels along with the line number:"
      grep -on [aeiouAEIOU] $fname 
      echo -n "the the total vowels are:"
      grep -o [aeiouAEIOU] $fname | wc -l
      ;;
   2) echo "enter the file name:"
      read fname
      echo -n "enter the seperate file name to store character and their occurences:"
      read sep
      largest=0
      for ch in {a..z}
      do 
         echo "$ch - `grep -io "$ch" $fname | wc -l`"
         echo "$ch - `grep -io "$ch" $fname | wc -l`">>$sep
         chcount=`grep -io "$ch" $fname | wc -l`
         if [[ $chcount -ge $largest ]]
         then
               largest=$chcount
         else
             continue
         fi
      done
     #echo "$largest"
      for ch in {a..z}
      do
         if [[ `grep -io "$ch" $fname | wc -l` -eq $largest ]]
         then
              echo "the $largest(largest) occurence of character is:$ch"
         fi
       done
      ;;
   3) echo -n "enter the file name:"
      read fname
      echo -n "Enter the string which is going to be replaced:"
      read old
      echo -n "enter the new string which is going to take place of old string:"
      read new
      if [[ `grep "$old" $fname` ]]
      then
         echo "string found"
         echo ""
         sed -io "s/$old/$new/g" $fname
         cat $fname
      else 
         echo "string not found"
      fi
      echo ""
      ;;
   4) break
     ;;
   *) echo "Invalid Choice"
     ;;
esac
done
