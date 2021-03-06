; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define Version "1.3.6"
#define Release "-beta20080514"

[Setup]
AppName=GPSBabel
AppVerName=GPSBabel-{#Version}{#Release}
RestartIfNeededByRun=false
DefaultDirName={pf}\GPSBabel
ShowLanguageDialog=auto
OutputDir=C:\TEMP
SourceDir=.\
DefaultGroupName=GPSBabel
AlwaysUsePersonalGroup=true
UserInfoPage=false
EnableDirDoesntExistWarning=true
VersionInfoVersion={#Version}
VersionInfoCompany=GPSBabel makers
AllowRootDirectory=true
AlwaysShowGroupOnReadyPage=true
InternalCompressLevel=fast
WindowVisible=false
SetupIconFile=GPSBabelGUI.ico
DisableFinishedPage=false
AppVersion={#Version}{#Release}
UninstallDisplayIcon={app}\GPSBabelGUI.exe
UninstallDisplayName=GPSBabel {#Version}
AppPublisherURL=http://www.gpsbabel.org
AppUpdatesURL=http://sourceforge.net/project/showfiles.php?group_id=58972
DisableStartupPrompt=true
AppID={{E25E9E85-2244-4AB0-B00D-7F44C6E9F635}
AppMutex=GPSBabelGUI_mutex
OutputBaseFilename=iGPSBabel-{#Version}{#Release}
UsePreviousAppDir=false

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: GPSBabelGUI.exe; DestDir: {app}; Flags: replacesameversion
Source: README.gui; DestDir: {app}
Source: ..\..\mingw\libexpat.dll; DestDir: {app}
; Source: ..\..\mingw\sqlite3.dll; DestDir: {app}
Source: ..\..\gpsbabel.exe; DestDir: {app}; Flags: comparetimestamp ignoreversion; Languages: 
Source: ..\..\gpsbabel.html; DestDir: {app}; Tasks: ; Languages: 
Source: ..\..\COPYING; DestDir: {app}
Source: ..\..\README.contrib; DestDir: {app}
Source: ..\..\AUTHORS; DestDir: {app}; Tasks: ; Languages: 
Source: ..\..\CHANGELOG; DestDir: {app}

[Dirs]
Name: {app}

[Languages]
Name: en; MessagesFile: compiler:Default.isl
Name: de; MessagesFile: compiler:Languages\German.isl
Name: fr; MessagesFile: compiler:Languages\French.isl

[Icons]
Name: {group}\GPSBabelGUI; Filename: {app}\GPSBabelGUI.exe; WorkingDir: {app}; IconFilename: {app}\GPSBabelGUI.exe; IconIndex: 0; Flags: useapppaths
Name: {group}\{cm:UninstallProgram, GPSBabel}; Filename: {uninstallexe}
Name: {userdesktop}\GPSBabelGUI; Filename: {app}\GPSBabelGUI.exe; WorkingDir: {app}; Tasks: desktopicon; IconIndex: 0
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\GPSBabelGUI; Filename: {app}\GPSBabelGUI.exe; Tasks: quicklaunchicon; WorkingDir: {app}; IconFilename: {app}\GPSBabelGUI.exe; IconIndex: 0

[Run]
Filename: {app}\GPSBabelGUI.exe; WorkingDir: {app}; Flags: postinstall unchecked skipifsilent; Description: {cm:LaunchProgram,GPSBabelBUI}

[Code]
var
  GPSBabelPathRead: Boolean;
  GPSBabelPath: string;

function InitializeSetup(): Boolean;
begin
  GPSBabelPathRead := False;
  Result := True;
end;

function GetGPSBabelPath(): String;
var
  GPSBabelPathKeyName, GPSBabelPathValueName: String;
begin
  if not GPSBabelPathRead then
  begin
    GPSBabelPathRead := True;
    GPSBabelPathKeyName := 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{E25E9E85-2244-4AB0-B00D-7F44C6E9F635}_is1';
    GPSBabelPathValueName := 'Inno Setup: App Path';
    if not(RegQueryStringValue(HKLM, GPSBabelPathKeyName, GPSBabelPathValueName, GPSBabelPath)) then
    begin
      Result := '';
      GPSBabelPath := Result;
    end;
  end;
  Result := GPSBabelPath;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  s: string;
begin
//  PageID's (wpSelectDir, wpSelectProgramGroup, wpReady)
  Result := True;
  if (CurPageID = wpSelectDir) then
  begin
    s := GetGPSBabelPath();
    if (s <> '') and (CompareText(s, WizardDirValue()) = 0) then
    begin
      Result := (
        MsgBox('GPSBabel seems to be installed in this path!' + #13#13 +
        'Overwrite previous installation?', mbConfirmation, mb_YesNo) = mrYes);
    end;
  end;
end;
