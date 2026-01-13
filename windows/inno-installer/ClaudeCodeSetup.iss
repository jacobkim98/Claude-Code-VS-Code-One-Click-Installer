; Claude Code Installer for Windows
; Inno Setup Script with Download Plugin

#define MyAppName "Claude Code"
#define MyAppVersion "1.0"
#define MyAppPublisher "bkamp"
#define MyAppURL "https://bkamp.ai"

[Setup]
AppId={{B2C3D4E5-F6G7-8901-HIJK-LM2345678901}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
DefaultDirName={tmp}\ClaudeCodeSetup
CreateAppDir=no
OutputDir=output
OutputBaseFilename=ClaudeCodeSetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=commandline
UsedUserAreasWarning=no
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
Uninstallable=no

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"

[Messages]
korean.SetupWindowTitle=Claude Code 설치
korean.WelcomeLabel1=Claude Code 설치 마법사
korean.WelcomeLabel2=바이브 코딩에 필요한 구성 요소를 설치합니다.%n%n다음 항목들이 자동으로 설치됩니다:%n%n  - Node.js%n  - Git%n  - VS Code%n  - Claude Code CLI%n  - VS Code Claude 확장%n%n계속하려면 [다음]을 클릭하세요.
korean.FinishedHeadingLabel=설치 완료
korean.FinishedLabel=모든 설치가 완료되었습니다!%n%n처음 사용하시는 분은 아래 '시작 가이드'를 확인해주세요.%nClaude 실행 방법과 로그인 과정을 안내해드립니다.

#include <idp.iss>

[Run]
Filename: "cmd.exe"; Parameters: "/c code --new-window"; Description: "VS Code 열기"; Flags: postinstall nowait skipifsilent runhidden
Filename: "https://bkamp.ai/ko/showcases/de04a7ec-50d7-4f8e-a741-f2cdb4753543"; Description: "시작 가이드 열기 (Claude 실행 및 로그인 방법 안내)"; Flags: postinstall nowait skipifsilent shellexec

[Code]
var
  StatusLabel: TNewStaticText;
  ItemLabels: array[0..4] of TNewStaticText;
  ItemStatus: array[0..4] of TNewStaticText;
  NeedNodeJS, NeedGit, NeedVSCode, NeedClaudeCLI, NeedVSCodeExt: Boolean;

const
  NodeJSUrl = 'https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi';
  GitUrl = 'https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe';
  VSCodeUrl = 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64';

procedure UpdateItemStatus(Index: Integer; Status: String; Done: Boolean);
begin
  if Done then
  begin
    ItemStatus[Index].Caption := '✓ ' + Status;
    ItemStatus[Index].Font.Color := clGreen;
  end
  else
  begin
    ItemStatus[Index].Caption := Status;
    ItemStatus[Index].Font.Color := clBlue;
  end;
  ItemStatus[Index].Update;
  WizardForm.Refresh;
end;

procedure InitializeWizard;
var
  Page: TWizardPage;
  i: Integer;
  ItemNames: array[0..4] of String;
begin
  ItemNames[0] := 'Node.js';
  ItemNames[1] := 'Git';
  ItemNames[2] := 'VS Code';
  ItemNames[3] := 'Claude Code CLI';
  ItemNames[4] := 'VS Code 확장';

  Page := CreateCustomPage(wpWelcome, '설치 진행 중', '필요한 구성 요소를 다운로드하고 설치합니다.');

  StatusLabel := TNewStaticText.Create(Page);
  StatusLabel.Parent := Page.Surface;
  StatusLabel.Top := 10;
  StatusLabel.Left := 0;
  StatusLabel.Width := Page.SurfaceWidth;
  StatusLabel.Caption := '준비 중...';
  StatusLabel.Font.Style := [fsBold];

  for i := 0 to 4 do
  begin
    ItemLabels[i] := TNewStaticText.Create(Page);
    ItemLabels[i].Parent := Page.Surface;
    ItemLabels[i].Top := 60 + (i * 28);
    ItemLabels[i].Left := 20;
    ItemLabels[i].Width := 150;
    ItemLabels[i].Caption := ItemNames[i];

    ItemStatus[i] := TNewStaticText.Create(Page);
    ItemStatus[i].Parent := Page.Surface;
    ItemStatus[i].Top := 60 + (i * 28);
    ItemStatus[i].Left := 180;
    ItemStatus[i].Width := 250;
    ItemStatus[i].Caption := '확인 중...';
    ItemStatus[i].Font.Color := clGray;
  end;

  idpSetOption('DetailedMode', '1');
  idpSetOption('AllowContinue', '1');
end;

function CheckNodeInstalled: Boolean;
var
  ResultCode: Integer;
begin
  Result := Exec('cmd.exe', '/c node --version', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) and (ResultCode = 0);
end;

function CheckGitInstalled: Boolean;
var
  ResultCode: Integer;
begin
  Result := Exec('cmd.exe', '/c git --version', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) and (ResultCode = 0);
end;

function CheckVSCodeInstalled: Boolean;
var
  ResultCode: Integer;
begin
  // 파일 존재 확인
  if FileExists(ExpandConstant('{localappdata}\Programs\Microsoft VS Code\Code.exe')) then
  begin
    Result := True;
    Exit;
  end;
  if FileExists(ExpandConstant('{pf}\Microsoft VS Code\Code.exe')) then
  begin
    Result := True;
    Exit;
  end;
  // 명령어로 확인
  Result := Exec('cmd.exe', '/c code --version', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) and (ResultCode = 0);
end;

function CheckClaudeCLIInstalled: Boolean;
var
  ResultCode: Integer;
begin
  Result := Exec('cmd.exe', '/c npm list -g @anthropic-ai/claude-code', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) and (ResultCode = 0);
end;

function CheckVSCodeExtInstalled: Boolean;
begin
  // 항상 설치 시도 (이미 있으면 무시됨)
  Result := False;
end;

procedure CheckAllInstallations;
begin
  StatusLabel.Caption := '설치 상태 확인 중...';
  WizardForm.Refresh;

  // Node.js 확인
  NeedNodeJS := not CheckNodeInstalled;
  if NeedNodeJS then
    UpdateItemStatus(0, '설치 대기', False)
  else
    UpdateItemStatus(0, '이미 설치됨', True);

  // Git 확인
  NeedGit := not CheckGitInstalled;
  if NeedGit then
    UpdateItemStatus(1, '설치 대기', False)
  else
    UpdateItemStatus(1, '이미 설치됨', True);

  // VS Code 확인
  NeedVSCode := not CheckVSCodeInstalled;
  if NeedVSCode then
    UpdateItemStatus(2, '설치 대기', False)
  else
    UpdateItemStatus(2, '이미 설치됨', True);

  // Claude CLI (항상 설치/업데이트 시도)
  NeedClaudeCLI := True;
  UpdateItemStatus(3, '설치 대기', False);

  // VS Code Extension (항상 설치 시도 - 이미 있으면 무시됨)
  NeedVSCodeExt := True;
  UpdateItemStatus(4, '설치 대기', False);
end;

procedure AddDownloadsIfNeeded;
begin
  CheckAllInstallations;

  StatusLabel.Caption := '다운로드 준비 중...';
  WizardForm.Refresh;

  if NeedNodeJS then
    idpAddFile(NodeJSUrl, ExpandConstant('{tmp}\node-setup.msi'));

  if NeedGit then
    idpAddFile(GitUrl, ExpandConstant('{tmp}\git-setup.exe'));

  if NeedVSCode then
    idpAddFile(VSCodeUrl, ExpandConstant('{tmp}\vscode-setup.exe'));
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;

  if CurPageID = wpWelcome then
  begin
    AddDownloadsIfNeeded;
    idpDownloadAfter(wpWelcome);
  end;
end;

procedure InstallNodeJS;
var
  ResultCode: Integer;
begin
  if NeedNodeJS and FileExists(ExpandConstant('{tmp}\node-setup.msi')) then
  begin
    StatusLabel.Caption := 'Node.js 설치 중...';
    UpdateItemStatus(0, '설치 중...', False);
    WizardForm.Refresh;
    Exec('msiexec.exe', '/i "' + ExpandConstant('{tmp}\node-setup.msi') + '" /qn', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    UpdateItemStatus(0, '완료', True);
  end;
end;

procedure InstallGit;
var
  ResultCode: Integer;
begin
  if NeedGit and FileExists(ExpandConstant('{tmp}\git-setup.exe')) then
  begin
    StatusLabel.Caption := 'Git 설치 중...';
    UpdateItemStatus(1, '설치 중...', False);
    WizardForm.Refresh;
    Exec(ExpandConstant('{tmp}\git-setup.exe'), '/VERYSILENT /NORESTART', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    UpdateItemStatus(1, '완료', True);
  end;
end;

procedure InstallVSCode;
var
  ResultCode: Integer;
begin
  if NeedVSCode and FileExists(ExpandConstant('{tmp}\vscode-setup.exe')) then
  begin
    StatusLabel.Caption := 'VS Code 설치 중...';
    UpdateItemStatus(2, '설치 중...', False);
    WizardForm.Refresh;
    Exec(ExpandConstant('{tmp}\vscode-setup.exe'), '/VERYSILENT /NORESTART /MERGETASKS=!runcode', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    UpdateItemStatus(2, '완료', True);
  end;
end;

procedure RefreshEnvironment;
var
  ResultCode: Integer;
begin
  // PATH 환경변수 새로고침
  Exec('cmd.exe', '/c setx PATH "%PATH%"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;

procedure InstallClaudeCLI;
var
  ResultCode: Integer;
  NpmPath: String;
begin
  if NeedClaudeCLI then
  begin
    StatusLabel.Caption := 'Claude Code CLI 설치 중...';
    UpdateItemStatus(3, '설치 중...', False);
    WizardForm.Refresh;

    // npm 경로 찾기
    NpmPath := ExpandConstant('{pf}\nodejs\npm.cmd');
    if not FileExists(NpmPath) then
      NpmPath := ExpandConstant('{commonpf}\nodejs\npm.cmd');
    if not FileExists(NpmPath) then
      NpmPath := 'npm';

    Exec('cmd.exe', '/c "' + NpmPath + '" install -g @anthropic-ai/claude-code', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    UpdateItemStatus(3, '완료', True);
  end;
end;

procedure InstallVSCodeExtension;
var
  ResultCode: Integer;
  CodePath: String;
begin
  StatusLabel.Caption := 'VS Code 확장 설치 중...';
  UpdateItemStatus(4, '설치 중...', False);
  WizardForm.Refresh;

  // code 경로 찾기
  CodePath := ExpandConstant('{localappdata}\Programs\Microsoft VS Code\bin\code.cmd');
  if not FileExists(CodePath) then
    CodePath := ExpandConstant('{pf}\Microsoft VS Code\bin\code.cmd');
  if not FileExists(CodePath) then
    CodePath := 'code';

  Exec('cmd.exe', '/c "' + CodePath + '" --install-extension anthropic.claude-code', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  UpdateItemStatus(4, '완료', True);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    InstallNodeJS;
    InstallGit;
    InstallVSCode;
    RefreshEnvironment;
    InstallClaudeCLI;
    InstallVSCodeExtension;
    StatusLabel.Caption := '모든 설치가 완료되었습니다!';
    WizardForm.Refresh;
  end;
end;
