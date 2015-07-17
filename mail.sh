#!/bin/sh

#definiamo il percorso dell'eseguibile di mail

MAIL=/usr/bin/mail

#oggetto della mail

OGGETTO="Torrent completato!"

#creiamo i file temporanei per il testo da inviare per mail...
#notare i backquotes perchÃ¨ eseguono il comando che contengono

#TMPFILE=`mktemp -t rtorrent.XXXXXXXXXX`
#TMPFILE2=`mktemp -t rtorrent.A`

#testo della mail

echo "rTorrent ha completato il download di $@ " > /home/pi/rtorrent-mail.txt #    $TMPFILE
#echo "puoi trovarlo al seguente indirizzo:">>$TMPFILE
#echo "ftp://192.168.1.10/downloads/TORRENT/$TR_TORRENT_NAME" | sed 's/ /%20/g'>>$TMPFILE

#invio la mail ai destinatari indicati qui sotto dal mittente indicato...

mail -s "$OGGETTO" -r rtorrent@paz.pi pasettodavide@gmail.com < /home/pi/rtorrent-mail.txt

#attribuisco al file appena scaricato i permessi di lettura, scrittura ed esecuzione
#per tutti gli utenti di tutti i gruppi, risolvendo il problema dei permessi per i file
#scaricati dall'utente debian-transmission di transmission-daemon.

#echo "$TR_TORRENT_NAME" | sed 's/ /\\ /g'>>$TMPFILE2
#chmod -R 777 /media/TORRHDD/  #$TMPFILE2
rm -f /home/pi/rtorrent-mail.txt
#rimuovo i file temporanei!

#rm $TMPFILE
#rm $TMPFILE2
