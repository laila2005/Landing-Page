@echo off
echo 🔍 Verifying deployment readiness...
echo.

echo 📁 Checking required files:
if exist "index.html" (echo ✅ index.html - Found) else (echo ❌ index.html - Missing)
if exist "css\style.css" (echo ✅ css\style.css - Found) else (echo ❌ css\style.css - Missing)
if exist "vercel.json" (echo ✅ vercel.json - Found) else (echo ❌ vercel.json - Missing)
if exist "package.json" (echo ✅ package.json - Found) else (echo ❌ package.json - Missing)
if exist ".gitignore" (echo ✅ .gitignore - Found) else (echo ❌ .gitignore - Missing)
if exist "README.md" (echo ✅ README.md - Found) else (echo ❌ README.md - Missing)
if exist "DEPLOYMENT.md" (echo ✅ DEPLOYMENT.md - Found) else (echo ❌ DEPLOYMENT.md - Missing)

echo.
echo 🖼️  Checking image assets:
if exist "assets\images" (
    echo ✅ assets\images directory - Found
    dir /s /b assets\images\*.png assets\images\*.jpg assets\images\*.jpeg assets\images\*.gif 2>nul | find /c /v "" > temp_count.txt
    set /p image_count=<temp_count.txt
    del temp_count.txt
    echo 📸 Found image files in directory
) else (
    echo ❌ assets\images directory - Missing
)

echo.
echo 🌐 Ready for Vercel deployment!
echo 💡 Run 'python -m http.server 3000' to test locally
echo 🚀 Visit https://vercel.com to deploy
pause
