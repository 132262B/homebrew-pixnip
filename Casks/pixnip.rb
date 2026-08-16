# Homebrew Cask 템플릿.
#
# scripts/release.sh 가 버전과 체크섬을 채워 탭 저장소(homebrew-pixnip)의
# Casks/pixnip.rb 로 밀어 넣는다. 고칠 일이 있으면 이 파일을 고치고, 만들어진
# 결과물은 손대지 않는다.
cask "pixnip" do
  version "0.1.1"
  sha256 "690a89d1e6225568a496bd2519f7d02d23f703abac90cf2e49c9dbbfe7da60dd"

  url "https://github.com/132262B/pixnip/releases/download/v#{version}/pixnip-#{version}-macos.zip",
      verified: "github.com/132262B/pixnip/"
  name "pixnip"
  desc "Screenshot tool with region capture, annotation editor and color picker"
  homepage "https://github.com/132262B/pixnip"

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

  caveats <<~EOS
    pixnip 은 Apple 공증(notarization)을 받지 않았습니다.

    설치 과정에서 Gatekeeper 격리 속성을 떼어 냈습니다. 즉 macOS 가 이 앱을
    검사하지 않고 실행합니다. 소스는 아래에서 직접 확인하실 수 있습니다.

      https://github.com/132262B/pixnip

    처음 실행하면 화면 기록 권한을 요청합니다. 허용한 뒤 창의 '다시 시작' 을
    누르면 적용됩니다. macOS 는 앱이 새로 실행될 때 이 권한을 반영합니다.
  EOS

  zap trash: [
    "~/Library/Application Support/kr.doweb.pixnip",
    "~/Library/Saved Application State/kr.doweb.pixnip.savedState",
    "~/Library/WebKit/kr.doweb.pixnip",
  ]
end
