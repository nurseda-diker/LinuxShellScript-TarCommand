#!/bin/sh

zenity --info --width=450 --height=400 --title="Tar Komutu Hakkında" --text '<span color="royalblue" font="20">Tar komutu görsel arayüzüne hoşgeldiniz.Linux tar komutu sıkıştırma için en çok kullanılan Linux komutlarından biridir.Tar’ın açılımı Tape archive’dir ve bir veya birden fazla dosya ve klasörlerin sıkıştırılması için kullanılır.Linux tar komutu ile dosyaları sıkıştırabilir ve sıkıştırma işlemini geri alabilirsiniz.Hadi başlayalım...</span>'



zenity --info --width=600 --height=500 --title="Tar Komutu Parametreleri" --text '<span color="royalblue" font="20">Tar komutu parametreleri:

-c (Create): Tar dosyasının yaratılacağını belirtir.
-x (Extract): Bir tar dosyasının açılacağını belirtir.
-v (Verbose): Bir tar dosyasının yaratılırken ya da açılırken elden geçen dosyaların isimlerini ekrana listelemek icin kullanılır.
-f (File): Yaratılacak,açılacak ya da içindekiler tablosu listelenecek tar dosyasının adının komut satırında verileceğini belirtir.
-t: Arşivlenmiş dosyadaki dosyaları görüntüler veya listeler.</span>'    



FILE=`zenity --file-selection --title="Dosya Secme"` 

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac



ans=$(zenity  --list --width=650 --height=400  --text "Istediginiz parametreleri seciniz" --checklist  --column "Pick" --column "options" FALSE "cvf" FALSE "xvf" FALSE "cvzf" FALSE "xvzf" FALSE "tvf"  --separator="-" ); echo $ans

IFS='-' read -a myarr <<< "${ans}"


for i in "${myarr[@]}"
do
   if [ $i == "cvf" ]
   then 
      echo "Dosya olusturma-bilgileri goruntuleme-verilen dosya adıyla arşiv oluşturma" 
      tar -cvf archive.tar $FILE
   fi
   if [ $i == "xvf" ]
   then 
      echo "Tar dosyasını açma-bilgileri goruntuleme-verilen dosya adıyla arşiv oluşturma"
      tar -xvf $FILE




      
   fi
   if [ $i == "cvzf" ]
   then 
      echo "tar ile .gz olarak sıkıstırma"
      tar -cvzf  archive.tar.gz $FILE
   fi
   if [ $i == "xvzf" ]
   then 
      echo "tar.gz dosyasını açmak"
      tar -xvzf $FILE
   fi
   if [ $i == "tvf" ]
   then 
      echo "Arşivlenmiş dosyadaki dosyaları listeler"
      tar -tvf $FILE 
   fi
   
   
done

zenity --info --width=300 --height=200 --title="Son" --text '<span color="royalblue" font="50">THE END</span>'




























