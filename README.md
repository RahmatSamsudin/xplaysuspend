# xplaysuspend
## Cara Pakai


Buka Terminal lalu jalankan perintah berikut:  
````bash
sudo curl -o setup-disable-xhci-wake.sh https://raw.githubusercontent.com/RahmatSamsudin/xplaysuspend/main/setup-disable-xhci-wake.sh
````
Jalankan:  
````bash
sudo chmod +x setup-disable-xhci-wake.sh
sudo ./setup-disable-xhci-wake.sh
````

### Apa yang dilakukan script ini?  
✅ Membuat systemd service file yang mendisable wake device dengan nama XHC0, XHC1, XHC3, XHC4, GPP6, GPP7, GP11.  
✅ Reloads systemd.  
✅ Menyalakan dan menjalankan service yang dibuat.

Sekarang xplay pakai bazzite bisa di suspend deh pakai tombol power. untuk tombol lain buat bangunin devicenya. 🚀😎  

## DO IT AT YOUR OWN RISK ya Gaes.
