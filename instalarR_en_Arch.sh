
echo "Este script invoca a R e instala los paquetes necesarios para analizar datasets económicos para Arch Linux"
sudo Pacman -S R 
echo "Funciona mejor para mi el binario"
yaourt -S rstudio-desktop-bin
