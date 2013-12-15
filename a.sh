:
mkdir -p Disabled/Library/StartupItems
mkdir -p Disabled/etc
mkdir -p Disabled/Library/McAfee
mkdir -p Disabled/Library/Application\ Support/McAfee
mkdir -p Disabled/usr/local
mkdir -p Disabled/Library/LaunchAgents
mkdir -p Disabled/Library/LaunchDaemons
mkdir -p Disabled/Library/Preferences

mv Library/StartupItems/cma Disabled/Library/StartupItems/

mv etc/cma.d                Disabled/etc/
mv etc/cma.conf             Disabled/etc/
mv Library/McAfee           Disabled/Library/
mv Library/.McAfee          Disabled/Library/
mv Library/Application\ Support/McAfee  Disabled/Library/Application\ Support/
mv usr/local/McAfee         Disabled/usr/local

mv Library/LaunchAgents/com.mcafee.menulet.plist        Disabled/Library/LaunchAgents/
mv Library/LaunchAgents/com.mcafee.reporter.plist       Disabled/Library/LaunchAgents/
mv Library/LaunchDaemons/com.mcafee.ssm.Eupdate.plist   Disabled/Library/LaunchDaemons/
mv Library/LaunchDaemons/com.mcafee.ssm.ScanManager.plist  Disabled/Library/LaunchDaemons/
mv Library/LaunchDaemons/com.mcafee.virusscan.fmpd.plist   Disabled/Library/LaunchDaemons/

mv Library/Preferences/.com.mcafee.antimalware.license Disabled/Library/Preferences/
mv Library/Preferences/com.mcafee.ssm.antimalware.plist Disabled/Library/Preferences/

# employer-specific to prevent accidental automated reinstall during benchmarking.
mkdir -p Disabled/opt
mv Library/StartupItems/mdc Disabled/Library/StartupItems/
mv opt/desktop              Disabled/opt/
