#!/bin/bash

# DMG 빌드 스크립트 (Mac에서 실행)

# 실행 권한 부여
chmod +x "ClaudeCodeInstaller.app/Contents/MacOS/ClaudeCodeInstaller"
chmod +x "ClaudeCodeInstaller.app/Contents/Resources/install.sh"

# 기존 DMG 삭제
rm -f ClaudeCodeInstaller.dmg

# DMG 생성
hdiutil create -volname "Claude Code 설치" \
    -srcfolder "ClaudeCodeInstaller.app" \
    -ov -format UDZO \
    "ClaudeCodeInstaller.dmg"

echo ""
echo "DMG 생성 완료: ClaudeCodeInstaller.dmg"
