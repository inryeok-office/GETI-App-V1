---
name: pr
description: GitHub Pull Request를 한글 컨벤션에 맞춰 자동 생성하는 스킬 (Windows / PowerShell 환경 전용)
---

# PR 생성 스킬

## 목적

현재 작업 브랜치의 변경 사항을 분석하고, 저장소의 PR 템플릿과 한글 컨벤션을 적용하여 GitHub Pull Request를 생성한다.

## 실행 환경 전제

- 이 스킬의 모든 명령어는 **Windows PowerShell(5.1 이상) 또는 PowerShell 7+(pwsh)** 기준으로 작성되었다.
- macOS/Linux 셸(bash/zsh)에서 호출된 경우, 동일한 논리를 해당 셸의 명령어로 변환하여 실행한다.

## 기본 원칙

- 기본 대상 브랜치는 `develop`이다.
- `main` 또는 `develop` 브랜치에서는 PR을 생성하지 않는다.
- 현재 작업 브랜치에서 `develop` 브랜치로 PR을 생성한다.
- 사용자가 다른 대상 브랜치를 명확하게 요청한 경우에만 대상 브랜치를 변경한다.
- 존재하지 않는 정보는 임의로 작성하지 않는다.
- 테스트하지 않은 항목을 성공했다고 작성하지 않는다.

## PR 제목 규칙

PR 제목은 반드시 다음 형식을 사용한다.

```text
🔀 :: (#이슈번호) - 제목
```

### 제목 작성 규칙

- 반드시 한글로 작성한다.
- 작업의 핵심 내용만 간결하게 작성한다.
- 불필요한 설명이나 마침표를 넣지 않는다.
- 브랜치명, 커밋 메시지, 변경 파일을 바탕으로 제목을 작성한다.
- 이슈 번호를 찾지 못하면 임의로 생성하지 않고 사용자에게 확인한다.

### 제목 예시

```text
🔀 :: (#123) - 로그인 화면 구현
🔀 :: (#239) - 사용 내역 완료 시간 오류 수정
```

## PR 본문 규칙

- 저장소에 존재하는 PR 템플릿을 그대로 사용한다.
- 템플릿의 제목, 순서, 체크박스 구조를 임의로 변경하거나 삭제하지 않는다.
- 모든 설명은 한글로 작성한다.
- 코드, 파일명, 명령어, 기술 이름에는 영어를 사용할 수 있다.
- 관련 이슈 항목에는 다음 형식을 삽입한다.

```text
Closes #이슈번호
```

- 작업 내용은 글머리표를 사용하여 구체적으로 작성한다.
- 변경된 파일 이름만 나열하지 말고 실제 변경 목적과 동작을 설명한다.
- 테스트 방법과 결과는 실제로 실행한 내용을 기준으로 작성한다.
- 실행하지 않은 테스트는 실행했다고 작성하지 않는다.
- 테스트가 실패한 경우 실패 내용을 숨기지 않고 정확하게 작성한다.
- PR 본문 파일은 반드시 **BOM 없는 UTF-8**로 저장한다.
- GitHub CLI에는 본문 문자열을 직접 전달하지 않고 `--body-file`을 사용한다.

## PR 템플릿 탐색 순서

다음 위치를 순서대로 확인하여 가장 먼저 발견되는 템플릿을 사용한다.

```text
.github/PULL_REQUEST_TEMPLATE.md
.github/pull_request_template.md
.github/PULL_REQUEST_TEMPLATE/*.md
PULL_REQUEST_TEMPLATE.md
```

### 템플릿 탐색 명령어

```powershell
$templatePath = $null

$candidates = @(
    ".github/PULL_REQUEST_TEMPLATE.md",
    ".github/pull_request_template.md"
)

foreach ($path in $candidates) {
    if (Test-Path $path) {
        $templatePath = $path
        break
    }
}

if (-not $templatePath) {
    $multiTemplates = Get-ChildItem -Path ".github/PULL_REQUEST_TEMPLATE" -Filter "*.md" -ErrorAction SilentlyContinue
    if ($multiTemplates -and $multiTemplates.Count -eq 1) {
        $templatePath = $multiTemplates[0].FullName
    } elseif ($multiTemplates -and $multiTemplates.Count -gt 1) {
        # 템플릿이 여러 개면 임의로 선택하지 않고 사용자에게 확인한다.
        Write-Host "여러 개의 PR 템플릿이 발견되었습니다. 어떤 템플릿을 사용할지 확인이 필요합니다."
    }
}

if (-not $templatePath -and (Test-Path "PULL_REQUEST_TEMPLATE.md")) {
    $templatePath = "PULL_REQUEST_TEMPLATE.md"
}
```

- 템플릿이 여러 개 발견되면 임의로 하나를 선택하지 않고 사용자에게 어떤 템플릿을 사용할지 확인한다.
- 템플릿을 하나도 찾지 못하면 임의의 템플릿으로 PR을 생성하지 않고 사용자에게 알린다.

## 이슈 번호 추출 규칙

현재 브랜치명에서 `#숫자` 형식의 이슈 번호를 추출한다.

### 브랜치명 예시

```text
feature/#123-login
fix/#239-history-complete-time
chore/#15-initial-setting
```

위 브랜치에서 각각 다음 번호를 추출한다.

```text
123
239
15
```

### 이슈 번호 추출 명령어

```powershell
$currentBranch = git branch --show-current
$matches = [regex]::Matches($currentBranch, '#(\d+)')

if ($matches.Count -eq 0) {
    Write-Host "브랜치명에서 이슈 번호를 찾을 수 없습니다. 이슈 번호를 확인해주세요."
} elseif ($matches.Count -gt 1) {
    Write-Host "브랜치명에서 여러 개의 이슈 번호가 발견되었습니다. 어떤 번호를 사용할지 확인이 필요합니다."
} else {
    $issueNumber = $matches[0].Groups[1].Value
}
```

- 이슈 번호가 여러 개 발견되면 PR 생성을 중단하고 사용자에게 확인한다.
- 이슈 번호가 발견되지 않으면 임의의 번호를 사용하지 않는다.
- 가능하면 `gh issue view $issueNumber`로 해당 이슈가 실제로 존재하는지 확인한다.

## PR 생성 전 확인

PR을 생성하기 전에 다음 내용을 순서대로 확인한다.

1. Git 저장소 내부인지 확인한다.
2. 현재 브랜치를 확인한다.
3. 현재 브랜치가 `main` 또는 `develop`인지 확인한다.
4. 브랜치명에서 이슈 번호를 추출한다.
5. GitHub CLI 로그인 상태를 확인한다.
6. 커밋되지 않은 변경 사항이 있는지 확인한다.
7. 원격 저장소 정보를 최신화한다.
8. 현재 브랜치가 원격 저장소에 올라가 있는지 확인한다. (이 단계는 확인만 하며, 실제 push는 템플릿 확인·검사 실행 이후 단계에서 수행한다.)
9. 동일한 브랜치로 열린 PR이 이미 존재하는지 확인한다.
10. PR 템플릿이 존재하는지 확인한다.
11. 변경 내용과 커밋 기록을 확인한다.
12. 프로젝트 유형을 판별하고, 해당하는 코드 검사와 테스트를 실행한다.

## 사용 명령어

### Git 저장소 확인

```powershell
git rev-parse --is-inside-work-tree
```

### 현재 브랜치 확인

```powershell
git branch --show-current
```

### GitHub CLI 로그인 확인

```powershell
gh auth status
```

로그인되어 있지 않으면 PR 생성을 중단하고 다음 명령어를 안내한다.

```powershell
gh auth login
```

### 작업 상태 확인

```powershell
git status --short
```

커밋되지 않은 변경 사항이 있으면 PR을 생성하지 않고 먼저 커밋하도록 안내한다.

### 원격 저장소 최신화

```powershell
git fetch origin
```

### 원격 브랜치 존재 여부 확인

```powershell
$currentBranch = git branch --show-current
$remoteExists = git ls-remote --heads origin $currentBranch

if (-not $remoteExists) {
    Write-Host "현재 브랜치가 원격 저장소에 없습니다. 검사 완료 후 push가 필요합니다."
}
```

### 커밋 확인

```powershell
git log origin/develop..HEAD --oneline
```

### 변경 내용 확인

```powershell
git diff --stat origin/develop...HEAD
git diff origin/develop...HEAD
```

### 중복 PR 확인

```powershell
gh pr list --head 현재브랜치 --base develop --state open
```

동일한 브랜치의 열린 PR이 이미 존재하면 새 PR을 생성하지 않고 기존 PR 주소를 전달한다.

### 원격 브랜치 업로드

현재 브랜치가 원격 저장소에 없으면 다음 명령어로 업로드한다.

```powershell
git push -u origin HEAD
```

## 프로젝트 유형 판별 및 검사 규칙

검사를 실행하기 전, 저장소가 어떤 프로젝트 유형인지 먼저 판별한다. 판별되지 않는 유형이면 임의로 특정 스택의 명령어(예: `flutter`)를 실행하지 않는다.

```powershell
$isFlutter = Test-Path "pubspec.yaml"
```

- `pubspec.yaml`이 없으면 Flutter 프로젝트가 아니므로 아래 Flutter 검사 규칙을 적용하지 않는다.
- Flutter가 아닌 프로젝트의 경우, 저장소에 정의된 검사/테스트 명령(예: `package.json`의 스크립트, `Makefile` 등)이 있는지 확인하고, 명확한 검사 방법을 찾지 못하면 사용자에게 어떤 검사를 실행해야 하는지 확인한다. 임의로 검사를 생략하거나 임의의 명령을 지어내지 않는다.

### Flutter 검사 규칙

Flutter 프로젝트(`pubspec.yaml` 존재)에서는 PR 생성 전에 다음 명령어를 순서대로 실행한다.

```powershell
flutter pub get
flutter analyze
flutter test
```

### 검사 결과 처리

- 모든 검사가 성공하면 결과를 PR 본문에 작성한다.
- 테스트 파일이 없어 `flutter test`를 실행할 수 없는 경우 그 사실을 작성한다.
- `flutter analyze` 또는 `flutter test`가 실패하면 성공한 것처럼 작성하지 않는다.
- 검사가 실패한 경우 일반 PR 생성을 중단하고 오류 내용을 사용자에게 전달한다.
- 사용자가 명시적으로 요청한 경우에만 초안 PR을 생성한다.

## PowerShell UTF-8 (BOM 없음) 규칙

PR 템플릿을 읽을 때 반드시 UTF-8 인코딩을 지정한다.

```powershell
$template = Get-Content `
  -Path $templatePath `
  -Raw `
  -Encoding utf8
```

PR 본문을 저장할 때는 **BOM이 포함되지 않도록** 다음 중 하나의 방식을 사용한다.

PowerShell 7+ (pwsh) 환경:

```powershell
$bodyPath = Join-Path $env:TEMP "geti-pr-body.md"

Set-Content `
  -Path $bodyPath `
  -Value $body `
  -Encoding utf8NoBOM
```

Windows PowerShell 5.1 환경 (`utf8NoBOM` 옵션이 없는 경우):

```powershell
$bodyPath = Join-Path $env:TEMP "geti-pr-body.md"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($bodyPath, $body, $utf8NoBom)
```

- `Set-Content -Encoding utf8`은 PowerShell 5.1 기준 BOM이 포함된 UTF-8로 저장되므로, `--body-file`로 전달 시 PR 본문 앞에 불필요한 문자가 남을 수 있다. 반드시 BOM 없는 방식을 사용한다.
- 저장소 내부에 임시 PR 본문 파일을 생성하지 않는다.

## PR 본문 작성 방법

1. PR 템플릿 전체 내용을 UTF-8로 읽는다.
2. 템플릿의 기존 제목과 항목을 유지한다.
3. 관련 이슈 항목에 `Closes #이슈번호`를 작성한다.
4. 커밋과 변경 내용을 분석하여 작업 내용을 작성한다.
5. 실제로 실행한 검사 명령어와 결과를 테스트 항목에 작성한다.
6. 작성한 본문을 BOM 없는 UTF-8 임시 파일로 저장한다.

### 작업 내용 작성 예시

```md
- 로그인 API 요청 기능을 구현했습니다.
- 로그인 성공 시 반환된 토큰을 안전한 저장소에 저장하도록 처리했습니다.
- 로그인 실패 상태에 따른 오류 메시지를 표시하도록 수정했습니다.
```

### 테스트 작성 예시

```md
- `flutter pub get` 실행 완료
- `flutter analyze` 실행 결과 오류 없음
- `flutter test` 실행 결과 전체 테스트 통과
```

## PR 생성 명령어

다음과 같이 GitHub CLI의 `--body-file`을 사용하여 PR을 생성한다.

```powershell
gh pr create `
  --base develop `
  --head 현재브랜치 `
  --title "🔀 :: (#이슈번호) - 제목" `
  --body-file $bodyPath
```

PR 생성 후 임시 본문 파일을 삭제한다.

```powershell
Remove-Item $bodyPath -ErrorAction SilentlyContinue
```

## 전체 동작 순서

1. `git rev-parse --is-inside-work-tree`로 Git 저장소 내부인지 확인한다.
2. `git branch --show-current`로 현재 브랜치를 확인한다.
3. 현재 브랜치가 `main` 또는 `develop`이면 작업을 중단한다.
4. 브랜치명에서 정규식으로 이슈 번호를 추출한다.
5. 이슈 번호가 없거나 여러 개이면 사용자에게 확인한다.
6. `gh auth status`로 GitHub CLI 로그인 상태를 확인한다.
7. `git status --short`로 커밋되지 않은 변경 사항을 확인한다.
8. `git fetch origin`으로 원격 정보를 최신화한다.
9. `git ls-remote --heads origin`으로 현재 브랜치가 원격에 있는지 확인한다.
10. `git log origin/develop..HEAD`로 커밋을 확인한다.
11. `git diff origin/develop...HEAD`로 변경 내용을 분석한다.
12. 동일한 브랜치의 열린 PR이 있는지 확인한다.
13. PR 템플릿을 탐색 순서에 따라 UTF-8로 읽는다. 템플릿이 없거나 여러 개면 사용자에게 확인한다.
14. `pubspec.yaml` 존재 여부로 Flutter 프로젝트인지 판별한다.
    - Flutter 프로젝트면 `flutter pub get`, `flutter analyze`, `flutter test`를 실행한다.
    - Flutter 프로젝트가 아니면 저장소에 정의된 검사 방법을 확인하고, 없으면 사용자에게 확인한다.
15. 규칙에 맞는 한글 PR 제목을 생성한다.
16. 템플릿을 유지하면서 한글 PR 본문을 작성한다.
17. PR 본문을 BOM 없는 UTF-8 임시 파일로 저장한다.
18. 현재 브랜치가 원격에 없으면 push한다.
19. `gh pr create`와 `--body-file`을 사용하여 PR을 생성한다.
20. 임시 본문 파일을 삭제한다.
21. 생성된 PR의 제목, 대상 브랜치, 주소를 사용자에게 전달한다.

## 금지 사항

- 이슈 번호를 임의로 생성하지 않는다.
- 테스트 결과를 거짓으로 작성하지 않는다.
- `main`이나 `develop`에서 직접 PR을 생성하지 않는다.
- 기존 PR 템플릿의 항목을 임의로 삭제하지 않는다.
- PR 본문을 `--body`로 직접 전달하지 않는다.
- 동일한 브랜치에서 중복 PR을 생성하지 않는다.
- 커밋되지 않은 변경 사항이 있는 상태로 PR을 생성하지 않는다.
- 사용자 확인 없이 대상 브랜치를 `main`으로 지정하지 않는다.
- 오류가 발생한 상태에서 성공했다고 보고하지 않는다.
- 프로젝트 유형을 확인하지 않고 특정 스택(Flutter 등) 전용 검사 명령을 임의로 실행하지 않는다.
- PR 본문 임시 파일을 BOM 포함 인코딩으로 저장하지 않는다.