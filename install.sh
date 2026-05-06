#!/data/data/com.termux/files/usr/bin/bash
echo "=== FamilyPickTool v3.0.3 - Sesion 2 ==="
DIR="$HOME/familypicktool2"
REPO="https://github.com/durannahir313-design/familypicktool2.git"
CMD="familypicktool2"

pkg install -y php git > /dev/null 2>&1

if [ -d "$DIR/.git" ]; then
  echo "[*] Actualizando repositorio..."
  cd "$DIR" && git pull --quiet
else
  [ -d "$DIR" ] && rm -rf "$DIR"
  echo "[*] Clonando repositorio..."
  git clone "$REPO" "$DIR"
fi

echo "[*] Creando comando..."
echo "#!/data/data/com.termux/files/usr/bin/sh" > $PREFIX/bin/$CMD
echo "php $DIR/launcher.php \"$@\"" >> $PREFIX/bin/$CMD
chmod +x $PREFIX/bin/$CMD

echo ""
echo "[✓] Instalado. Cierra Termux, abre de nuevo y escribe: $CMD"
