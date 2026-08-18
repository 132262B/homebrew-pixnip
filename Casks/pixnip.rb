# Homebrew Cask 템플릿.
#
# scripts/release.sh 가 버전과 체크섬을 채워 탭 저장소(homebrew-pixnip)의
# Casks/pixnip.rb 로 밀어 넣는다. 고칠 일이 있으면 이 파일을 고치고, 만들어진
# 결과물은 손대지 않는다.
#
# 132262B/homebrew-pixnip 는 릴리스 zip 이 올라가는 공개 탭 저장소다. 소스 저장소는 비공개라
# 여기서 참조하지 않는다.
cask "pixnip" do
  version "0.1.6"
  sha256 "23634b250bb781db7767adfdfbb4177d48c14f5efde6b114f0ad522bf0d9d9fc"

  url "https://github.com/132262B/homebrew-pixnip/releases/download/v#{version}/pixnip-#{version}-macos.zip",
      verified: "github.com/132262B/homebrew-pixnip/"
  name "pixnip"
  desc "Screenshot tool with region capture, annotation editor and color picker"
  homepage "https://github.com/132262B/homebrew-pixnip"

  # 문자열 비교(">= :sonoma")는 Homebrew 에서 deprecated 됐다. 심볼만 쓰면
  # 그 버전 이상을 뜻한다. ScreenCaptureKit 의 captureImageWithFilter 가
  # macOS 14 부터라 그 아래로는 내려갈 수 없다.
  depends_on macos: :sonoma

  app "pixnip.app"

  # pixnip 은 Apple 공증을 받지 않았다. 격리 속성을 떼지 않으면 Gatekeeper 가
  # "손상되었기 때문에 열 수 없습니다" 로 막는다. 공식 homebrew-cask 였다면
  # 이런 cask 는 받아 주지 않는다. 개인 탭이라 가능한 처리다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/pixnip.app"]
  end

  # pixnip 은 메뉴 막대에 계속 떠 있는 앱이다. 이게 없으면 brew 가 번들만 갈아
  # 끼우고 돌던 프로세스는 그대로 둬서, 업그레이드해도 예전 버전이 계속 돈다.
  # 사용자 눈에는 "업데이트가 안 되는" 것으로 보인다.
  #
  # quit 을 적어 두면 brew 가 업그레이드 전에 앱을 끄고, 끝난 뒤 다시 띄운다
  # (Homebrew 의 reopen_apps_after_upgrade). 단 이 판단은 **설치돼 있던 쪽**의
  # cask 를 보고 하므로, 이 스탠자가 없던 버전에서 올라올 때는 한 번은 손으로
  # 꺼야 한다.
  #
  # 스탠자 순서(app → postflight → uninstall → zap → caveats)는 brew style 이
  # 강제한다. 순서를 바꾸면 style 검사에서 걸린다.
  uninstall quit: "kr.doweb.pixnip"

  zap trash: [
    "~/Library/Application Support/kr.doweb.pixnip",
    "~/Library/Saved Application State/kr.doweb.pixnip.savedState",
    "~/Library/WebKit/kr.doweb.pixnip",
  ]

  caveats <<~EOS
    pixnip 은 Apple 공증(notarization)을 받지 않았습니다.

    설치 과정에서 Gatekeeper 격리 속성을 떼어 냈습니다. 즉 macOS 가 이 앱을
    검사하지 않고 실행합니다. 설치 스크립트가 하는 일은 아래에서 그대로
    확인하실 수 있습니다.

      https://github.com/132262B/homebrew-pixnip/blob/main/Casks/pixnip.rb

    처음 실행하면 화면 기록 권한을 요청합니다. 허용한 뒤 창의 '다시 시작' 을
    누르면 적용됩니다. macOS 는 앱이 새로 실행될 때 이 권한을 반영합니다.

    업데이트는 이렇게 합니다.

      brew update && brew upgrade --cask pixnip

    지금 돌고 있는 버전은 설정 창 왼쪽 아래에 적혀 있습니다. 업그레이드했는데
    그 숫자가 그대로면 예전 프로세스가 아직 떠 있는 것이니, pixnip 을 완전히
    끄고 다시 실행해 주세요.
  EOS
end
