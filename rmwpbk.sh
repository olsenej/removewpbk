
#Go through a list of domains and delete contents of wpcontent/backup/
#Works with both public_html and without public_html
#Has you manually continue the process for MAXIMUM CONTROL.
#Written by Edward Olsen 1/16/13
#!/bin/bash

for i in $(cat ~/bloglist);do
 if [ -d "/home/httpd/html/$i/public_html/wp-content" ]; then
  cd /home/httpd/html/$i/public_html/wp-content/
  ll
  read -p "Enter to proceed, x to break." watdo 
  if [ "$watdo" = "x" ]; then
   break
  else
   echo "Moving on."
  fi

  rm -rf backup/*
  cd /home/httpd/html/
 else
  cd /home/httpd/html/$i/wp-content
  ll
  read -p "Enter to proceed, x to break." watdo
  if [ "$watdo" = "x" ]
  then
   break
  else
   echo "Moving on."
  fi

  rm -rf backup/*
  cd /home/httpd/html/
 fi
done
