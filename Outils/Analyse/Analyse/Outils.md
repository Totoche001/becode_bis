upx
PE tools
    depends
    PE Explorer
    PEid
    pestudio
    PEview
    ResourceHacker
Regshot x64-unicode
apateDNS
TCPview
Wireshark
Ghidra
Ollydbg
IDA
Autoruns
HxD
HashTab
KAPE
Autopsy
FTK Imager
AccessData's Registry Viewer
Zimmerman's Registry Explorer
RegRipper
EZViewer

TL;DR

    READ the Requirements and troubleshooting section!!
    Use Get-ZimmermanTools to download all programs at once and keep your tool set current
        Use -Dest to control where the tools ends up, else things end up in same directory as the script (recommended!)
        Use -NetVersion to control which flavor of tool you get: 4 for .net 4.6.2 and 6 for .net 6 (recommended!)
    All GUI tools will be updated to use .net 6 only but the legacy version will be kept in place as well (just not updated anymore)
    All CLI tools will continue to be built for both .net 4.6.2 and .net 6

Contribute/support opportunities

Donate
GitHub Sponsors

Donate
PayPal

Donate
Patreon
Forensic tools

Need everything at once? Here are ALL the tools as a single zip file: .net 4 | .net 6
Name 	Version (.net 4 | 6) 	Purpose
AmcacheParser 	1.5.1.0 | 1.5.1.0 	Amcache.hve parser with lots of extra features. Handles locked files
AppCompatCacheParser 	1.5.0.0 | 1.5.0.0 	AppCompatCache aka ShimCache parser. Handles locked files
bstrings 	1.5.2.0 | 1.5.2.0 	Find them strings yo. Built in regex patterns. Handles locked files
EvtxECmd 	1.5.0.0 | 1.5.0.0 	Event log (evtx) parser with standardized CSV, XML, and json output! Custom maps, locked file support, and more!
EZViewer 	1.0.0.0 | 2.0.0.0 	Standalone, zero dependency viewer for .doc, .docx, .xls, .xlsx, .txt, .log, .rtf, .otd, .htm, .html, .mht, .csv, and .pdf. Any non-supported files are shown in a hex editor (with data interpreter!)
Hasher 	2.0.0.0 | - 	Hash all the things
JLECmd 	1.5.0.0 | 1.5.0.0 	Jump List parser
JumpList Explorer 	1.4.0.0 | 2.0.0.0 	GUI based Jump List viewer
LECmd 	1.5.0.0 | 1.5.0.0 	Parse lnk files
MFTECmd 	1.2.2.0 | 1.2.2.0 	$MFT, $Boot, $J, $SDS, $I30, and $LogFile (coming soon) parser. Handles locked files
MFTExplorer 	0.5.1.0 | 2.0.0.0 	Graphical $MFT viewer
pecheck
PECmd 	1.5.0.0 | 1.5.0.0 	Prefetch parser
RBCmd 	1.5.0.0 | 1.5.0.0 	Recycle Bin artifact (INFO2/$I) parser
RecentFileCacheParser 	1.5.0.0 | 1.5.0.0 	RecentFileCache parser
RECmd 	1.6.0.0 | 2.0.0.0 	Powerful command line Registry tool searching, multi-hive support, plugins, and more
Registry Explorer 	1.6.0.0 | 2.0.0.0 	Registry viewer with searching, multi-hive support, plugins, and more. Handles locked files
RLA 	2.0.0.0 | 2.0.0.0 	Replay transaction logs and update Registry hives so they are no longer dirty. Useful when tools do not know how to handle transaction logs
SDB Explorer 	1.0.0.0 | 2.0.0.0 	Shim database GUI
SBECmd 	2.0.0.0 | 2.0.0.0 	ShellBags Explorer, command line edition, for exporting shellbag data
ShellBags Explorer 	1.4.0.0 | 2.0.0.0 	GUI for browsing shellbags data. Handles locked files
SQLECmd 	1.0.0.0 | 1.0.0.0 	Find and process SQLite files according to your needs with maps!
SrumECmd 	0.5.1.0 | 0.5.1.0 	Process SRUDB.dat and (optionally) SOFTWARE hive for network, process, and energy info!
SumECmd 	0.5.2.0 | 0.5.2.0 	Process Microsoft User Access Logs found under 'C:\Windows\System32\LogFiles\SUM'
Timeline Explorer 	1.3.0.0 | 2.0.0.0 	View CSV and Excel files, filter, group, sort, etc. with ease
VSCMount 	1.5.0.0 | 1.5.0.0 	Mount all VSCs on a drive letter to a given mount point
WxTCmd 	1.0.0.0 | 1.0.0.0 	Windows 10 Timeline database parser
Other tools
Name 	Version (.net 4 | 6) 	Purpose
Get-ZimmermanTools 	NA 	PowerShell script to auto discover and update everything above.
iisGeoLocate 	2.2.0.0 | 2.2.0.0 	Geolocate IP addresses found in IIS logs, extracts unique IPs, records bad data from logs
KAPE 	NA 	Kroll Artifact Parser/Extractor: Flexible, high speed collection of files as well as processing of files. Many many features
TimeApp 	NA | na 	A simple app that shows current time (local and UTC) and optionally, public IP address. Great for testing
XWFIM 	NA | na 	X-Ways Forensics installation manager
Other files
Name 	Version 	Purpose
Change log 	NA
Requirements and troubleshooting

    .net 4 software requires at least Microsoft .net 4.6.2 or newer! You will get errors running these without at least 4.6.2. When in doubt, install it!
    .net 6 software requires at least Microsoft .net 6 or newer! You will get errors running these without at least .net 6. When in doubt, install it! NOTE: Make sure you get the Desktop runtime if you plan on running any of the GUI programs
    DO NOT RUN ANYTHING FOUND HERE FROM 'C:\PROGRAM FILES' DIRECTORY (unless you run them as administrator)!
    DO NOT USE WINDOWS TO EXTRACT THINGS. Use 7-Zip or WinRAR as Windows will block the DLLs!
    All software is digitally signed. Once you verify the signature as coming from me, any anti-virus hits are false positives. When in doubt, download the files directly from here!
    If you get DPI scaling issues, make a shortcut (or directly against the exe), edit the properties, then click Compatibility. Under Change high DPI settings, check Override high DPI scaling behavior at bottom and choose System, then click OK out of the dialog
