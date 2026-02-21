# حل مشكلة بطء تحميل الصور

## المشكلة
الصور في الموقع كبيرة جداً (بعضها 2.5 ميغابايت) مما يسبب بطء في التحميل.

## الحلول المطبقة

### 1. Lazy Loading ✅
تم إضافة `loading="lazy"` لجميع الصور في الموقع.
هذا يجعل الصور تتحمل فقط عندما يقترب المستخدم منها.

### 2. Preconnect & Preload ✅
تم إضافة:
- `preconnect` للخطوط و CDN
- `preload` لصورة اللوغو الرئيسية

### 3. ضغط الصور (يدوي)

#### الطريقة الأولى: استخدام السكريبت
```bash
./compress-images.sh
```

#### الطريقة الثانية: ضغط يدوي
استخدم أدوات أونلاين:
- https://tinypng.com
- https://squoosh.app
- https://compressor.io

#### الطريقة الثالثة: تثبيت الأدوات يدوياً
```bash
# تثبيت pngquant
sudo apt-get install pngquant optipng

# ضغط صورة واحدة
pngquant --quality=65-80 images/background.png --ext .png --force

# ضغط جميع الصور الكبيرة
find images -name "*.png" -size +500k -exec pngquant --quality=65-80 --ext .png --force {} \;
```

## الصور التي تحتاج ضغط عاجل
- `images/background.png` - 2.5 MB
- `images/CBL/22.png` - 2.2 MB
- `images/CBL/qq.png` - 1.3 MB
- `images/3خلفية.png` - 1.2 MB
- `images/الخدمات/*.png` - حوالي 1 MB لكل واحدة

## نصائح إضافية

1. **استخدم WebP بدلاً من PNG**
   - WebP أخف بـ 25-35% من PNG
   - معظم المتصفحات تدعمه الآن

2. **استخدم CDN**
   - Cloudflare (مجاني)
   - AWS CloudFront
   - يسرع تحميل الصور عالمياً

3. **حجم الصور المثالي**
   - صور الخلفية: أقل من 200 KB
   - صور المحتوى: أقل من 100 KB
   - الأيقونات: أقل من 50 KB

## التحقق من النتائج
بعد الضغط، تحقق من:
```bash
find images -type f -name "*.png" -exec du -h {} \; | sort -rh | head -10
```
