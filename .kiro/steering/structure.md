# Project Structure

## Core Application Files
```
source/
├── EIDGarminWatchFaceApp.mc     # Main application entry point
├── EIDGarminWatchFaceView.mc    # Watch face view and UI logic
├── Tools.mc                     # Utility functions for data and drawing
└── CustomBackgroundDrawable.mc # Custom background rendering
```

## Resource Organization
```
resources/
├── drawables/
│   ├── background/              # Background color variants (7 themes)
│   ├── weather/                 # Weather condition icons (10 states)
│   ├── drawables.xml           # Drawable resource definitions
│   └── launcher_icon.svg       # App launcher icon
├── fonts/                       # Custom Rubik font variants
├── layouts/                     # UI layout definitions
├── settings/
│   ├── properties.xml          # App configuration properties
│   └── settings.xml            # User-configurable settings
└── strings/
    └── strings.xml             # Localized text resources
```

## Generated & Build Files
```
bin/                            # Compiled application binaries
gen/                            # Generated resource files
├── gen/006-B3992-00/source/    # Device-specific generated code
└── gen/resources/cache/        # Compiled resource cache files
mir/                            # Intermediate representation files
internal-mir/                   # Internal build artifacts
```

## Configuration Files
- `manifest.xml` - App metadata and device compatibility (auto-generated)
- `monkey.jungle` - Build configuration
- `eid_developer_key` - Developer signing key

## Architecture Patterns

### MVC Structure
- **Model**: Data fetching in `Tools.mc` (system stats, weather, etc.)
- **View**: UI rendering in `EIDGarminWatchFaceView.mc`
- **Controller**: App lifecycle in `EIDGarminWatchFaceApp.mc`

### Resource Naming
- Use descriptive IDs: `WeatherIcon`, `StepCount`, `Battery`
- Background themes numbered 1-7 (white, green, blue, red, purple, orange, pink)
- Weather conditions mapped to specific drawable resources

### Code Organization
- Utility functions centralized in `Tools.mc`
- UI update methods prefixed with `set` (e.g., `setStepCount()`)
- Drawing methods prefixed with `draw` (e.g., `drawBatteryArc()`)
- System data getters prefixed with `getSystem` (e.g., `getSystemBattery()`)