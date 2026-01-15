# GitHub Copilot Instructions for KitchenLayout Repository

## Repository Purpose
This repository documents a kitchen design and cabinetry specification organized by construction sections. It's intended for cabinet makers, contractors, and appliance installers working on a kitchen renovation in Mexico.

## Critical Structural Rules

### 1. Dual-Language System (English/Spanish)
**ALWAYS maintain both languages when editing content.**

- **English files:** Standard markdown files (e.g., `README.md`, `sections/01-tall-cabinetry-wall.md`)
- **Spanish files:** Add `.es` before `.md` extension (e.g., `README.es.md`, `sections/01-tall-cabinetry-wall.es.md`)

**When editing:**
- If a user edits an English file, ALWAYS update the corresponding `.es.md` file with a Spanish translation
- If a user edits a Spanish file, ALWAYS update the corresponding English file
- Keep structure, formatting, and technical specifications identical between languages
- Translate content naturally, not literally
- Keep brand names, model numbers, and measurements unchanged

### 2. Document Organization

#### Section-Based Structure
Kitchen is organized by **construction sections**, not arbitrary walls:

```
sections/
├── 01-tall-cabinetry-wall.md (and .es.md)
├── 02-continuous-base-cabinetry.md (and .es.md)
└── 03-island.md (and .es.md)
```

Each section:
- Is self-contained with all subsections
- Includes dimensional specifications
- References relevant appliances
- Contains cabinet maker instructions

#### Specifications Structure
```
specifications/
├── materials.md (and .es.md)
├── electrical.md (and .es.md)
├── plumbing.md (and .es.md)
└── appliances-list.md (and .es.md)
```

### 3. Appliance Specification Format
**Always use this structure for appliances:**

```markdown
## [Appliance Name]

**Make:** [Brand]  
**Model:** **[Model Number]**  
**Type:** [Description]  
**Location:** [Section reference]  
**Installation type:** [Built-in/Freestanding/etc.]

### Dimensions (external/overall)
* **Width:** [mm]
* **Height:** [mm]
* **Depth:** [mm]

### Installation requirements
* **Electrical:** [Voltage, circuit type]
* **Water/Gas:** [If applicable]
* **Clearances:** [Specific requirements]

### Cabinet maker instructions
* [Specific, actionable instructions]
* [Use bullet points]
* [Include critical measurements]
* [Warn about critical constraints]
```

### 4. Measurement Standards
- **Always use metric (mm, cm, m)**
- **Always include units**
- Use "mm" for appliances and cabinets, not "cm"
- Voltage: 110V or 220V (not 120V/240V unless manufacturer specifies)

### 5. Key Constraints to Remember
- **Electrical:** Limited ability to add circuits. Only NEW circuit is 220V for oven. All others use existing.
- **Plumbing:** NO new plumbing locations possible. Cabinet layout must accommodate existing locations.
- **Island:** No electrical circuits, no plumbing available.
- **Environment:** All materials and hardware must be suitable for **humid tropical/coastal conditions** (Cancún, Mexico)

### 6. Material Specifications
- **Wood:** Parota - dark natural tone
- **Finish:** Handleless, flat, modern
- **Hardware:** Always specify "soft-close" and "suitable for humid tropical conditions"
- **Countertops:** Existing granite retained (no replacement)

### 7. Image References
Format for renders:
```markdown
![Descriptive Alt Text](images/renders/section-##-name/filename.png)
```

Image folder structure:
```
images/
├── renders/
│   ├── section-01-tall-wall/
│   ├── section-02-continuous-base/
│   ├── section-03-island/
│   └── complete-kitchen/
└── floor-plans/
```

### 8. PDF Build System
The `build/build-pdf.ps1` script generates PDFs in both languages.

**When adding new markdown files:**
1. Create both English (.md) and Spanish (.es.md) versions
2. Update build-pdf.ps1 to include both versions in appropriate builds
3. Test both English and Spanish PDF generation

### 9. Formatting Standards

#### Headers
- Use `##` for main appliances/sections
- Use `###` for subsections
- Use `####` sparingly

#### Bold Usage
- **Model numbers** in bold: **RF32CGSN10B1**
- **Critical measurements** in bold when emphasis needed
- **Important warnings** in bold

#### Lists
- Use `*` for unordered lists (not `-`)
- Use `-` only in older files for backward compatibility
- Indent with 2 spaces for nested lists

#### Technical Terms
- "Hob" (British English) = Cooktop (American English) - use "Hob (Cooktop)" for clarity
- Always use "cabinet maker" not "carpenter" or "fabricator" when referring to cabinetry work

### 10. Code Compliance
- All electrical work must comply with **Mexican electrical codes**
- All plumbing work must comply with **Mexican plumbing codes**
- Always reference local codes when specifying installations

### 11. Version Control Best Practices
When making changes:
- Update related files together (English + Spanish)
- Keep specifications synchronized across sections
- Update appliances-list.md when mentioning appliances in sections
- Maintain consistency in terminology across all files
- **ALWAYS run the build script after making changes:** `.\build\build-pdf.ps1`

### 12. Build Process
**CRITICAL: After any markdown file changes, ALWAYS run the build script:**

```powershell
.\build\build-pdf.ps1
```

This generates:
- `output/kitchen-layout-en.docx` (English)
- `output/kitchen-layout-es.docx` (Spanish)

Run the build to verify:
- No pandoc errors
- Both language versions generate successfully
- Image paths are correct
- Content renders properly

## Common Tasks

### Adding a New Appliance
1. Add to `specifications/appliances-list.md` using standard format
2. Add Spanish version to `specifications/appliances-list.es.md`
3. Include "Cabinet maker instructions" section
4. Reference in relevant section file (e.g., `sections/01-tall-cabinetry-wall.md`)
5. Update Spanish section file as well
6. **Run build script:** `.\build\build-pdf.ps1`

### Adding a New Section
1. Create `sections/##-section-name.md`
2. Create `sections/##-section-name.es.md`
3. Update `index.md` to include the section
4. Update `index.es.md` with Spanish reference
5. Update `build/build-pdf.ps1` to include both files
6. Update README.md and README.es.md
7. **Run build script:** `.\build\build-pdf.ps1`

### Updating Specifications
1. Edit specification file (e.g., `electrical.md`)
2. Update corresponding `.es.md` file
3. Check if change affects any section files
4. Update all affected files in both languages
5. **Run build script:** `.\build\build-pdf.ps1`

## Language-Specific Translations

### Common Kitchen Terms
| English | Spanish |
|---------|---------|
| Cabinet maker | Ebanista / Fabricante de gabinetes |
| Countertop | Encimera / Cubierta |
| Hob/Cooktop | Placa / Estufa |
| Sink | Fregadero / Lavabo |
| Dishwasher | Lavavajillas |
| Drawer | Cajón |
| Door | Puerta |
| Handleless | Sin manijas / Sin tiradores |
| Soft-close | Cierre suave / Amortiguado |
| Built-in | Empotrado / Integrado |
| Freestanding | Independiente |
| Installation | Instalación |
| Clearance | Holgura / Espacio libre |
| Ventilation | Ventilación |
| Circuit | Circuito |

## Tone and Style
- **Professional and precise** - for contractors and tradespeople
- **Directive, not suggestive** - use "must" and "to be" rather than "should" or "could"
- **Metric measurements only** - this is for work in Mexico
- **Bilingual by default** - always think "both languages"
- **Action-oriented** - especially in "Cabinet maker instructions" sections

## Testing Changes
After making changes:
1. Verify both language files exist and are synchronized
2. Check that build-pdf.ps1 references all files
3. Ensure cross-references between files are accurate
4. Verify image paths are correct
5. Check that measurements and specifications are consistent across all references

---

**Last Updated:** January 14, 2026
