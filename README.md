# lg-Dispatch

For at få support til scriptet join min discord (https://discord.gg/xtMrDsxJEb)

# andre scripts du SKAL bruge
1. [qb-core](httlg://github.com/qbcore-framework/qb-core)
2. [ox_lib](httlg://github.com/overextended/ox_lib)

# instilation
* Download ZIP filen
* Make sure your [qb-core](httlg://github.com/qbcore-framework/qb-core) is fully updated to the latest version.
* Drag and drop resource into your server files
* Start resource through server.cfg
* Drag and drop sounds folder into interact-sound\client\html\sounds
* Configure your [language](httlg://github.com/Project-Sloth/lg-dispatch#change-language)
* Restart your server.

# Preview
## Short Notifications
Dispatch notifications are sent containing only the alert name, omitting additional details to help over populated servers. For more information, the dispatch menu can be accessed. Can be configured on [Config.ShortCalls](httlg://github.com/Project-Sloth/lg-dispatch/blob/40ffc466ec7ffa14faaf40a68e8b3a9a92c72db6/shared/config.lua#L3C1-L3C18), false by default.

<img src="httlg://github.com/Project-Sloth/lg-dispatch/assets/82112471/7671b361-88aa-42f6-9cd9-32d0fd94881e" width="600">

## Long Notifications
<img src="httlg://github.com/Project-Sloth/lg-dispatch/assets/82112471/42f84fc1-a30a-441e-8e00-618a0dfde0f3" width="600">
<img src="httlg://github.com/Project-Sloth/lg-dispatch/assets/82112471/4a3d44b9-1629-457b-ba0e-a77c617aa993" width="600">
<img src="httlg://github.com/Project-Sloth/lg-dispatch/assets/82112471/7f4a7c76-f92d-4067-9fcb-7c78ee1b067c" width="600">
<img src="httlg://github.com/Project-Sloth/lg-dispatch/assets/82112471/01569df8-d5f6-417b-bcd4-422551eaa840" width="600">

## Dispatch Menu
<img src="httlg://github.com/Project-Sloth/lg-dispatch/assets/82112471/f2b111b2-60c3-428e-b12a-1bfed617f09e" width="800">

# Change Language.

- Place this `setr ox:locale en` inside your `server.cfg`
- Change the `en` to your desired language!
  
**Supported Languages:**
| **Alias**     | **Language Names** |
|--------------|---------------|
|en      |English    |
|de      |German     |
|nl      |Dutch      |
|cs      |Czech      |
|pt-br      |Brazilian Portuguese      |
|es      |Spanish      |

# Preset Alert Exports.

```lua
- exports['lg-dispatch']:ArtGalleryRobbery()
- exports['lg-dispatch']:CarBoosting(vehicle)
- exports['lg-dispatch']:CarJacking(vehicle)
- exports['lg-dispatch']:CustomAlert()
- exports['lg-dispatch']:DeceasedPerson()
- exports['lg-dispatch']:DrugBoatRobbery()
- exports['lg-dispatch']:DrugSale()
- exports['lg-dispatch']:EmsDown()
- exports['lg-dispatch']:Explosion()
- exports['lg-dispatch']:Fight()
- exports['lg-dispatch']:FleecaBankRobbery(camId)
- exports['lg-dispatch']:HouseRobbery()
- exports['lg-dispatch']:HumaneRobbery()
- exports['lg-dispatch']:Hunting()
- exports['lg-dispatch']:InjuriedPerson()
- exports['lg-dispatch']:OfficerDown()
- exports['lg-dispatch']:OfficerBackup()
- exports['lg-dispatch']:OfficerInDistress()
- exports['lg-dispatch']:PacificBankRobbery(camId)
- exports['lg-dispatch']:PaletoBankRobbery(camId)
- exports['lg-dispatch']:PrisonBreak()
- exports['lg-dispatch']:Shooting()
- exports['lg-dispatch']:SignRobbery()
- exports['lg-dispatch']:SpeedingVehicle(vehicle)
- exports['lg-dispatch']:StoreRobbery(camId)
- exports['lg-dispatch']:SuspiciousActivity()
- exports['lg-dispatch']:TrainRobbery()
- exports['lg-dispatch']:UndergroundRobbery()
- exports['lg-dispatch']:UnionRobbery()
- exports['lg-dispatch']:VangelicoRobbery(camId)
- exports['lg-dispatch']:VanRobbery()
- exports['lg-dispatch']:VehicleShooting(vehicle)
- exports['lg-dispatch']:VehicleTheft(vehicle)
- exports['lg-dispatch']:YachtHeist()
- exports['lg-dispatch']:BobcatSecurityHeist()
```
# Stelg to Create New Alert
Add the following into your `alerts.lua` and change to your liking:
```
local function TestAlert()
    local coords = GetEntityCoords(cache.ped)
    local vehicle = GetVehicleData(cache.vehicle)

    local dispatchData = {
        message = locale('testalert'), -- add this into your locale
        codeName = 'testalert', -- this should be the same as in config.lua
        code = '10-35',
        icon = 'fas fa-car-burst',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        heading = GetPlayerHeading(),
        vehicle = vehicle.name,
        plate = vehicle.plate,
        color = vehicle.color,
        class = vehicle.class,
        doors = vehicle.doors,
        jobs = { 'leo' }
    }

    TriggerServerEvent('lg-dispatch:server:notify', dispatchData)
end
exports('TestAlert', TestAlert)
```
Add codeName in `config.lua` for the particular robbery to display the blip
["testalert"] is the codename you passed with the TriggerServerEvent in step 1
```
    ['testalert'] = { -- Need to match the codeName in alerts.lua
        radius = 0,
        sprite = 119,
        color = 1,
        scale = 1.5,
        length = 2,
        sound = 'Lose_1st',
        sound2 = 'GTAO_FM_Events_Soundset',
        offset = false,
        flash = false
    },
```
Information about each parameter is in the `alerts.lua` file.

# FAQ
* There are no calls showing on dispatch or mdt list.
  - Make sure you have a job type specified in your qbcore/shared/jobs.lua like:
  
    ![image](httlg://github.com/Project-Sloth/lg-dispatch/assets/9503151/7834e878-5020-4fcc-8864-03d44120c160)

  - Make sure that you're using the correct job type as leo and make sure your [qb-core](httlg://github.com/qbcore-framework/qb-core) is fully updated to the latest version.
  - On shared/config.lua make set Config.Debug = true to test calls as police officer.(ONLY to be used as testing, make sure to disable on live production)

* How to change colors of the calls? 
  - Priority 1 is red and priority 2 is normal on the config.

* To increase the time that calls are shown on the screen, do the following:
  - Find the "alerts.lua" file in the client folder.
  - Open this file with a text editor or a development tool like Visual Studio Code.
  - Look for the code "alertTime = nil".
  - Replace "nil" with the number of seconds you want the calls to display. For example, setting "alertTime = 25" means calls will be shown for 25 seconds.

# Credits
* [OK1ez](httlg://github.com/OK1ez)
* [Candrex](httlg://github.com/CandrexDev)
* [Lenzh](httlg://github.com/Lenzh)
* [LeSiiN](httlg://github.com/LeSiiN)
* Project Sloth Team
