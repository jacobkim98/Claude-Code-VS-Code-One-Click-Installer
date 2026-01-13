# 바이브 코딩 시작하기: Claude Code 완전 초보 가이드

> 코딩을 전혀 몰라도 괜찮아요! 이 가이드를 따라하면 10분 안에 AI와 함께 코딩할 준비가 됩니다.

---

## 바이브 코딩이 뭔가요?

"바이브 코딩"은 AI에게 **말로 설명하면 AI가 코드를 짜주는** 새로운 개발 방식이에요.

예를 들어:
- "버튼 색상을 파란색으로 바꿔줘"
- "로그인 페이지 만들어줘"
- "이 에러 고쳐줘"

이렇게 말하면 AI가 알아서 코드를 작성해줍니다!

---

## STEP 1: Claude 계정 만들기

### 1-1. Claude 웹사이트 가기

1. 인터넷 브라우저(크롬, 엣지 등)를 열어요
2. 주소창에 **claude.ai** 를 입력하고 Enter

### 1-2. 회원가입하기

1. **"Sign Up"** 또는 **"Get started"** 버튼 클릭
2. 이메일 주소 입력
3. 받은 인증 메일 확인하고 링크 클릭
4. 비밀번호 설정
5. 회원가입 완료!

---

## STEP 2: Claude Code 결제하기 (Pro 플랜)

> Claude Code를 사용하려면 **Pro 플랜** 구독이 필요해요 (월 $20, 약 27,000원)

### 2-1. 구독 페이지로 이동

1. claude.ai에 로그인한 상태에서
2. 왼쪽 하단의 **프로필 아이콘** 클릭
3. **"Upgrade to Pro"** 또는 **"Settings"** → **"Subscription"** 클릭

### 2-2. Pro 플랜 선택

1. **"Pro"** 플랜 선택 (월 $20)
2. **"Subscribe"** 버튼 클릭

### 2-3. 결제 정보 입력

1. **카드 번호** 입력 (해외결제 가능한 카드 필요)
   - 비자(Visa), 마스터(Mastercard) 카드 사용 가능
   - 체크카드도 해외결제 가능하면 OK
2. **유효기간** 입력 (MM/YY 형식)
3. **CVC** 입력 (카드 뒷면 3자리 숫자)
4. **결제 완료!**

> 💡 **팁**: 토스, 카카오뱅크 등 앱에서 해외결제 활성화 필요할 수 있어요

---

## STEP 3: Claude Code 설치하기 (원클릭!)

이제 가장 중요한 단계! 아래 방법 중 하나만 따라하면 돼요.

### 방법 A: 가장 쉬운 방법 (복사-붙여넣기)

#### Windows 사용자

1. 키보드에서 **Windows키 + R** 을 동시에 누르세요
   - (Windows키는 키보드 왼쪽 하단 깃발 모양)

2. 작은 창이 뜨면 아래 명령어를 **복사해서 붙여넣기** 하세요:

```
powershell -ep bypass -c "irm https://raw.githubusercontent.com/jacobkim98/Claude-Code-VS-Code-One-Click-Installer/main/windows/web-install.ps1|iex"
```

3. **확인** 버튼 클릭
4. 파란 창(PowerShell)이 뜨고 자동으로 설치가 시작돼요
5. 설치 완료될 때까지 기다리세요 (약 5분)

#### Mac 사용자

1. **Spotlight** 열기: **Command + Space** 누르기
2. "terminal" 입력하고 Enter
3. 터미널 창에 아래 명령어를 **복사해서 붙여넣기**:

```bash
curl -fsSL https://raw.githubusercontent.com/jacobkim98/Claude-Code-VS-Code-One-Click-Installer/main/mac/install.sh | bash
```

4. Enter 누르고 기다리세요

### 방법 B: 설치 파일 다운로드 (Windows만)

1. 아래 링크에서 설치 파일 다운로드:
   - [ClaudeCodeSetup.exe 다운로드](https://github.com/jacobkim98/Claude-Code-VS-Code-One-Click-Installer/raw/main/windows/inno-installer/output/ClaudeCodeSetup.exe)
2. 다운로드된 파일 더블클릭
3. "다음" 버튼 계속 클릭해서 설치 완료

---

## STEP 4: Claude Code 로그인하기

설치가 끝나면 VS Code가 자동으로 열려요.

### 4-1. VS Code에서 Claude 찾기

1. VS Code 왼쪽에 **Claude 아이콘** (동그란 로고) 클릭
2. 또는 상단에서 **View** → **Claude Code** 클릭

### 4-2. 로그인하기

1. **"Login"** 버튼 클릭
2. 브라우저가 열리면서 Claude 로그인 페이지로 이동
3. 아까 만든 계정으로 로그인
4. **"Allow"** 또는 **"허용"** 버튼 클릭
5. "인증 성공" 메시지가 뜨면 완료!

---

## STEP 5: 첫 번째 바이브 코딩 해보기!

이제 준비 끝! 직접 해볼까요?

### 5-1. 새 프로젝트 시작하기

1. VS Code에서 **File** → **Open Folder** 클릭
2. 바탕화면에 **새 폴더** 만들기 (예: "my-first-project")
3. 만든 폴더 선택하고 **열기**

### 5-2. Claude에게 말 걸기

1. 왼쪽의 Claude 아이콘 클릭
2. 채팅창에 이렇게 입력해보세요:

```
안녕! 간단한 HTML 웹페이지 하나 만들어줘.
"Hello World"라는 제목이 있고,
버튼을 누르면 알림창이 뜨게 해줘.
```

3. Enter 누르면 Claude가 코드를 만들어줘요!

### 5-3. 결과 확인하기

1. Claude가 만든 파일(index.html)을 클릭
2. **마우스 오른쪽 버튼** → **Open with Live Server**
3. 또는 파일을 브라우저로 드래그해서 열기
4. 와! 내가 만든 첫 웹페이지!

---

## 자주 묻는 질문 (FAQ)

### Q: 설치 중 "관리자 권한" 요청이 떠요
A: **"예"** 또는 **"허용"** 을 클릭하세요. 프로그램 설치에 필요한 권한이에요.

### Q: "Windows 보호" 경고가 떠요
A: **"추가 정보"** 클릭 → **"실행"** 클릭하세요. 안전한 프로그램이에요.

### Q: 해외결제가 안 돼요
A: 은행 앱에서 해외결제 활성화가 필요해요:
- 토스: 토스 앱 → 카드 → 설정 → 해외결제 켜기
- 카카오뱅크: 앱 → 카드 → 해외결제 설정

### Q: Pro 플랜 말고 무료로 쓸 수 있나요?
A: 현재 Claude Code는 Pro 플랜($20/월) 이상에서만 사용 가능해요.

### Q: 설치했는데 Claude 아이콘이 안 보여요
A: VS Code를 완전히 껐다가 다시 열어보세요.

### Q: 영어를 잘 못해요
A: 걱정 마세요! Claude는 한국어를 완벽하게 이해해요. 편하게 한국어로 대화하세요.

---

## 유용한 프롬프트 예시

Claude에게 이렇게 말해보세요:

| 하고 싶은 것 | 이렇게 말해보세요 |
|-------------|-------------------|
| 웹사이트 만들기 | "포트폴리오 웹사이트 만들어줘" |
| 버튼 추가 | "로그인 버튼 추가해줘" |
| 디자인 변경 | "배경색을 연한 파란색으로 바꿔줘" |
| 에러 해결 | "이 에러 뭔지 설명해주고 고쳐줘" |
| 코드 설명 | "이 코드가 뭘 하는지 설명해줘" |

---

## 다음 단계

축하해요! 이제 바이브 코딩을 시작할 준비가 됐어요.

더 배우고 싶다면:
- Claude에게 "Flutter로 앱 만드는 법 알려줘" 라고 물어보세요
- 유튜브에서 "바이브 코딩" 검색해보세요
- 작은 프로젝트부터 하나씩 만들어보세요

**가장 중요한 건 직접 해보는 거예요. 실수해도 괜찮아요, Claude가 도와줄 거예요!**

---

## 문제가 생겼나요?

- GitHub Issues: https://github.com/jacobkim98/Claude-Code-VS-Code-One-Click-Installer/issues
- Claude 공식 문서: https://docs.anthropic.com/claude-code

---

*이 가이드는 bkamp 쇼케이스를 위해 작성되었습니다.*
