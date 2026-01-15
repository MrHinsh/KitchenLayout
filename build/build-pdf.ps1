# Kitchen Layout PDF Build Script
# Requires: Pandoc
# Note: For PDF generation, you need one of these installed:
#   - MiKTeX or TeX Live (for pdflatex/xelatex)
#   - wkhtmltopdf (https://wkhtmltopdf.org/)
#   - Or use: pandoc --to docx instead to generate Word documents

$ErrorActionPreference = "Stop"

# Navigate to repository root
Set-Location $PSScriptRoot\..

# Create output directory if it doesn't exist
$outputDir = "output"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
    Write-Host "Created output directory: $outputDir" -ForegroundColor Cyan
}

# Check if pandoc is installed
if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "Pandoc is not installed. Install from: https://pandoc.org/installing.html"
    exit 1
}

Write-Host "Building Kitchen Layout Documents (English & Spanish)..." -ForegroundColor Cyan
Write-Host ""

# Build English document
Write-Host "Building English document..." -ForegroundColor Yellow
$outputFileEN = "$outputDir/kitchen-layout-en.docx"

pandoc `
    --metadata title="Kitchen Layout Specification" `
    --metadata author="Martin Hinshelwood" `
    --metadata date="January 14, 2026" `
    sections/01-tall-cabinetry-wall.md `
    sections/02-continuous-base-cabinetry.md `
    sections/03-island.md `
    specifications/materials.md `
    specifications/electrical.md `
    specifications/plumbing.md `
    specifications/appliances-list.md `
    -o $outputFileEN `
    --toc `
    --toc-depth=3 `
    2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ English document generated successfully: $outputFileEN" -ForegroundColor Green
}
else {
    Write-Error "Failed to generate English document. Check pandoc output above."
    exit 1
}

Write-Host ""

# Build Spanish document
Write-Host "Building Spanish document..." -ForegroundColor Yellow
$outputFileES = "$outputDir/kitchen-layout-es.docx"

pandoc `
    --metadata title="Especificación de Diseño de Cocina" `
    --metadata author="Martin Hinshelwood" `
    --metadata date="14 de enero de 2026" `
    sections/01-tall-cabinetry-wall.es.md `
    sections/02-continuous-base-cabinetry.es.md `
    sections/03-island.es.md `
    specifications/materials.es.md `
    specifications/electrical.es.md `
    specifications/plumbing.es.md `
    specifications/appliances-list.es.md `
    -o $outputFileES `
    --toc `
    --toc-depth=3 `
    2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Spanish document generated successfully: $outputFileES" -ForegroundColor Green
}
else {
    Write-Error "Failed to generate Spanish document. Check pandoc output above."
    exit 1
}

Write-Host ""
Write-Host "✓ All documents generated successfully!" -ForegroundColor Green
Write-Host "  - $outputFileEN" -ForegroundColor Cyan
Write-Host "  - $outputFileES" -ForegroundColor Cyan
Write-Host ""
Write-Host "Opening English document..." -ForegroundColor Cyan
Start-Process $outputFileEN
