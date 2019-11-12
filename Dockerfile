FROM elgalu/selenium

RUN sudo apt -y update && sudo apt -y install libnss3-tools

COPY intermed.cer /home/seluser/
RUN  [ -d ~/.pki/nssdb ] || mkdir -p ~/.pki/nssdb 
RUN certutil -d sql:$HOME/.pki/nssdb -N --empty-password
RUN certutil -d sql:$HOME/.pki/nssdb -A -n 'handelsbanken ft cert authority' -i intermed.cer -t TCP,TCP,TCP