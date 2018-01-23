# AX7-Dev-DB-Switcher
AX7 Dev DB Switcher script developed to quickly switch AxDB instance in the development environment.
Just run, specify target instance number and script will replace web.config file with prepared filed from script's folder.

To use AX7 Dev DB Switcher please do following:
1. Put your web.config files for AxDB instances to underlaying folders (e.g. "./dev/web.config", "./uat/web.config" etc);
2. Modify "switch" area if necessary;
3. Modify "$currentDirectory", "aosWebRootPath" if necessary;
4. Run the script as administrator.
