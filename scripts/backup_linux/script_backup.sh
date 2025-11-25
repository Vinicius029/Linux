#!/bin/bash

DIR_PEN_DRIVE="/media/$USER/D44B-ED09"
DIR_ORIGIN_BACKUP="/home/$USER/Documentos/linux"
ARQUIVO_BACKUP="backup_Linux_$(date +%d-%m-%Y).tar.gz"

if [ ! -d "$DIR_PEN_DRIVE"  ]; then
  echo "Pen-Drive não está conectado. Conecte e tente novamente!"
  exit 1
fi

clear

echo "======= Realizar backup =========="

if tar -czvf $ARQUIVO_BACKUP $DIR_ORIGIN_BACKUP; then
  echo "Backup criado com sucesso"
else  
  echo "Error ao gerar backup..."
  exit 1
fi

echo "======= Mover backup =========="

if mv -i $ARQUIVO_BACKUP $DIR_PEN_DRIVE; then
  echo "Arquivo de backup movido para $DIR_PEN_DRIVE com sucesso"
else
  echo "Error ao mover arquivo de backup..."
  exit 1
fi

echo "Backup finalizado com sucesso!"
