#!/bin/bash

# تثبيت أدوات الضغط إذا لم تكن موجودة
if ! command -v pngquant &> /dev/null; then
    echo "تثبيت pngquant..."
    sudo apt-get update && sudo apt-get install -y pngquant optipng
fi

# ضغط الصور الكبيرة
echo "بدء ضغط الصور..."

# ضغط صور PNG
find images -name "*.png" -size +500k -exec pngquant --quality=65-80 --ext .png --force {} \;

# تحسين إضافي
find images -name "*.png" -exec optipng -o2 {} \;

echo "تم ضغط الصور بنجاح!"
