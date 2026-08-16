# homebrew-pixnip

[pixnip](https://github.com/132262B/pixnip) 설치용 Homebrew 탭입니다.

```bash
brew tap 132262b/pixnip
brew trust --cask 132262b/pixnip/pixnip
brew install --cask pixnip
```

가운데 `brew trust` 는 Homebrew 가 서드파티 탭에 요구하는 단계입니다. 이 cask 는
설치 후 Gatekeeper 격리 속성을 떼는 코드를 담고 있어서, 신뢰를 명시하지 않으면
Homebrew 가 실행을 거부합니다.

pixnip 은 Apple 공증(notarization)을 받지 않아 공식 homebrew-cask 에 올릴 수
없습니다. 공증 없이는 격리 속성을 떼지 않으면 앱이 아예 열리지 않습니다.
무엇을 하는 코드인지는 [Casks/pixnip.rb](Casks/pixnip.rb) 에서 그대로 보실 수
있고, 앱 소스는 위 저장소에 있습니다.
