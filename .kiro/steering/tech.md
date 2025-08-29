# Technology Stack

## Platform & Language
- **Platform**: Garmin Connect IQ SDK
- **Language**: Monkey C (.mc files)
- **API Level**: Minimum 3.0.0
- **Build System**: Garmin Connect IQ SDK with Visual Studio Code extension

## Key Libraries & Imports
```monkeyc
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Weather;
import Toybox.Position;
import Toybox.Math;
```

## Project Configuration
- **Manifest**: `manifest.xml` (auto-generated, edit via VS Code commands)
- **Build Config**: `monkey.jungle`
- **Resources**: XML-based resource definitions in `resources/` folder

## Common Commands

### Development
```bash
# Use VS Code Command Palette for most operations:
# - "Monkey C: Edit Application" - Update app attributes
# - "Monkey C: Set Products by Product Category" - Add device targets
# - "Monkey C: Edit Products" - Manage supported devices
# - "Monkey C: Edit Permissions" - Update app permissions
# - "Monkey C: Edit Languages" - Configure supported languages
```

### Build & Deploy
- Build and deployment handled through Garmin Connect IQ extension in VS Code
- Generated files appear in `bin/` and `gen/` directories
- Use simulator or physical device testing through Connect IQ app

## Resource Management
- **Drawables**: PNG images and SVG icons in `resources/drawables/`
- **Fonts**: Custom font files (.fnt) with associated bitmap textures
- **Strings**: Localized text in `resources/strings/strings.xml`
- **Settings**: App properties in `resources/settings/properties.xml`
- **Layouts**: UI layouts defined in `resources/layouts/`