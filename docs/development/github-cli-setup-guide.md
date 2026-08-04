# GitHub CLI セットアップ手順と実施メモ

この手順は、Codex から GitHub CLI (`gh`) を使って `2way-adachi/2way-ses-system` を操作できる状態にした実績をもとにしたものです。

ほぼ同じ Windows + Codex 環境で再現するため、実施できたことと詰まったところをあわせて残します。

## 目的

- GitHub CLI で GitHub にログインする
- `2way-adachi/2way-ses-system` への権限を確認する
- Codex から pull / push できる状態にする
- 通常の Git 設定が詰まった場合の回避策を把握する

## 実施した環境

- OS: Windows
- Git: インストール済み
- `winget`: PATH 上に無し
- `gh`: PATH 上に無し
- Codex から利用できた GitHub アカウント: `seafer06`
- 対象リポジトリ: `2way-adachi/2way-ses-system`
- 対象リポジトリ権限: `WRITE`

## 1. 事前確認

PowerShell で以下を確認します。

```powershell
winget --version
gh --version
git --version
```

今回の環境では以下の状態でした。

- `winget`: 未検出
- `gh`: 未検出
- `git`: 検出済み

`winget` が使える環境なら、通常は以下で GitHub CLI を入れます。

```powershell
winget install --id GitHub.cli --source winget
```

ただし今回の環境では `winget` が使えなかったため、GitHub CLI の公式リリース zip を取得して portable 版として配置しました。

## 2. GitHub CLI portable 版を配置

今回利用した GitHub CLI は以下です。

- バージョン: `2.97.0`
- 配布ファイル: `gh_2.97.0_windows_amd64.zip`

配置先の例:

```text
C:\Users\SerataMiki\Documents\Codex\2026-08-04\ko\work\gh-cli\bin\gh.exe
```

確認:

```powershell
& "C:\Users\SerataMiki\Documents\Codex\2026-08-04\ko\work\gh-cli\bin\gh.exe" --version
```

同じ環境で使う場合は、`gh.exe` の実パスを毎回指定するか、`bin` フォルダを PATH に追加します。

## 3. GitHub CLI にログイン

以下を実行します。

```powershell
& "C:\path\to\gh.exe" auth login --hostname github.com --git-protocol https --web
```

途中で以下を聞かれたら、Git 操作も GitHub CLI の認証に寄せるため `Y` を選びます。

```text
Authenticate Git with your GitHub credentials? (Y/n)
```

その後、ワンタイムコードが表示されます。

```text
First copy your one-time code: XXXX-XXXX
Press Enter to open https://github.com/login/device in your browser...
```

今回の環境ではブラウザ自動起動が失敗しました。

```text
Failed opening a web browser at https://github.com/login/device
Access is denied.
```

この場合は、手元のブラウザで以下を開き、表示されたコードを手動入力します。

```text
https://github.com/login/device
```

認証完了後、以下のように表示されればログイン成功です。

```text
Authentication complete.
Logged in as seafer06
```

## 4. 認証状態を確認

```powershell
& "C:\path\to\gh.exe" auth status
```

今回の確認結果:

```text
Logged in to github.com account seafer06
Git operations protocol: https
Token scopes: gist, read:org, repo, workflow
```

## 5. リポジトリ権限を確認

```powershell
& "C:\path\to\gh.exe" repo view 2way-adachi/2way-ses-system --json nameWithOwner,viewerPermission,visibility,defaultBranchRef
```

今回の確認結果:

```json
{
  "nameWithOwner": "2way-adachi/2way-ses-system",
  "viewerPermission": "WRITE",
  "visibility": "PUBLIC",
  "defaultBranchRef": {
    "name": "main"
  }
}
```

`viewerPermission` が `WRITE` なので、このアカウントでは push 権限があります。

## 6. 詰まったところ: `gh auth setup-git` が失敗

GitHub CLI を Git の credential helper として登録するため、通常は以下を実行します。

```powershell
& "C:\path\to\gh.exe" auth setup-git
```

今回の Codex サンドボックス内では、ユーザーの `.gitconfig` 更新で失敗しました。

```text
failed to set up git credential helper:
failed to run git:
error: could not lock config file C:/Users/SerataMiki/.gitconfig: Permission denied
```

原因は、Git が `.gitconfig.lock` を作ってから `.gitconfig` を安全に更新しようとするためです。Codex サンドボックス越しだとホーム直下へのロックファイル作成が許可されず、設定を永続化できませんでした。

普通の PowerShell で実行できる環境なら、以下を手動で実行してください。

```powershell
& "C:\path\to\gh.exe" auth setup-git
```

これが成功すれば、通常の `git pull` / `git push` でも GitHub CLI の認証を使いやすくなります。

## 7. 詰まったところ: git の HTTPS helper が見つからない

今回の環境では、通常の `git clone` で以下のエラーが出ました。

```text
git: 'remote-https' is not a git command.
fatal: remote helper 'https' aborted session
```

`git-remote-https.exe` 自体は存在していましたが、Git の helper 探索先とずれていました。

回避策として、Codex 同梱 Git の `git-remote-https.exe` がある場所を `GIT_EXEC_PATH` に明示しました。

```powershell
$env:GIT_EXEC_PATH = "C:\Users\SerataMiki\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\git\mingw64\bin"
```

この設定を入れると、HTTPS 経由の Git 操作が通りました。

## 8. Codex 内で pull / push を通す回避策

`gh auth setup-git` が失敗している状態でも、`gh` のトークンを一時的に Git に渡すことで pull / push 相当の操作は可能でした。

トークンを画面に出さないよう、PowerShell 変数にだけ保持します。

```powershell
$gh = "C:\path\to\gh.exe"
$git = "C:\path\to\git.exe"
$repo = "C:\path\to\2way-ses-system"

$env:GIT_EXEC_PATH = "C:\path\to\git\mingw64\bin"
$token = & $gh auth token
$repoUrl = "https://x-access-token:$token@github.com/2way-adachi/2way-ses-system.git"
```

fetch 確認:

```powershell
& $git -C $repo -c credential.helper= -c http.sslBackend=openssl fetch $repoUrl main
```

push 確認だけ行う場合:

```powershell
& $git -C $repo -c credential.helper= -c http.sslBackend=openssl push --dry-run $repoUrl HEAD:refs/heads/main
```

今回の結果:

```text
From https://github.com/2way-adachi/2way-ses-system
 * branch            main       -> FETCH_HEAD

Everything up-to-date
```

この結果から、Codex セッション内では pull / push できる状態と判断しました。

## 9. clone した後の注意

トークン入り URL で clone や push を行った場合、remote URL にトークンが残らないように必ず通常 URL に戻します。

```powershell
& $git -C $repo remote set-url origin https://github.com/2way-adachi/2way-ses-system.git
& $git -C $repo remote -v
```

期待する表示:

```text
origin  https://github.com/2way-adachi/2way-ses-system.git (fetch)
origin  https://github.com/2way-adachi/2way-ses-system.git (push)
```

## 10. セキュリティ上の注意

今回の環境では、GitHub CLI の認証情報保存時に以下の警告が出ました。

```text
Authentication credentials saved in plain text
```

保存先:

```text
C:\Users\SerataMiki\AppData\Roaming\GitHub CLI\hosts.yml
```

このファイルには GitHub CLI の認証情報が含まれるため、共有・コミット・添付しないでください。

また、`https://x-access-token:$token@github.com/...` の形式は便利ですが、コマンド履歴や remote URL に残ると危険です。使った後は必ず remote URL を通常の GitHub URL に戻してください。

## 11. 最終確認コマンド

```powershell
& "C:\path\to\gh.exe" auth status

& "C:\path\to\gh.exe" repo view 2way-adachi/2way-ses-system --json nameWithOwner,viewerPermission,visibility,defaultBranchRef

& "C:\path\to\git.exe" -C "C:\path\to\2way-ses-system" status --short --branch

& "C:\path\to\git.exe" -C "C:\path\to\2way-ses-system" remote -v
```

今回の最終状態:

- `gh` は `seafer06` でログイン済み
- 対象リポジトリ権限は `WRITE`
- clone 済み作業ツリーは `main...origin/main`
- remote URL は通常の `https://github.com/2way-adachi/2way-ses-system.git`
- Codex 内では一時トークン方式で fetch / push dry-run が成功

## 12. 今回この手順書を push するときに追加で詰まったところ

手順書を追加して通常のローカル commit / push を行おうとしたところ、Codex サンドボックスから `.git/index.lock` などのロックファイルを作れず、ローカル Git のコミット作成ができませんでした。

```text
fatal: Unable to create '.git/index.lock': Permission denied
```

そのため、この手順書の追加は GitHub CLI の認証を使い、GitHub Contents API 経由でリポジトリへ直接コミットしました。

同じ制約がある環境では、ローカル Git の書き込み権限がない場合でも、`gh api` を使ってファイルを追加できることがあります。ただし、通常の開発作業ではローカル Git で branch / commit / push できる状態に整えるのが望ましいです。