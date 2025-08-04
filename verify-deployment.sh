#!/bin/bash
# Local testing script for the solar landing page

echo "🔍 Verifying deployment readiness..."

# Check if all required files exist
files=(
    "index.html"
    "css/style.css"
    "package.json"
    ".gitignore"
    "README.md"
    "DEPLOYMENT.md"
)

echo "📁 Checking required files:"
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file - Found"
    else
        echo "❌ $file - Missing"
    fi
done

echo ""
echo "🖼️  Checking image assets:"
if [ -d "assets/images" ]; then
    echo "✅ assets/images directory - Found"
    image_count=$(find assets/images -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" | wc -l)
    echo "📸 Found $image_count image files"
else
    echo "❌ assets/images directory - Missing"
fi

echo ""
echo "🌐 Ready for Vercel deployment!"
echo "💡 Run 'python -m http.server 3000' to test locally"
echo "🚀 Visit https://vercel.com to deploy"
