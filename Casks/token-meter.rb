cask "token-meter" do
  version "0.3.6"
  sha256 "9e85d6ad1ad542a1cf00bc3aa7e525d0742572b957b31d19b47c7833317efabc"

  url "https://github.com/younghyundev/token-meter/releases/download/v#{version}/TokenMeter-#{version}.zip"
  name "Token Meter"
  desc "macOS menu bar app for monitoring Claude Code token usage"
  homepage "https://github.com/younghyundev/token-meter"

  depends_on macos: ">= :sonoma"

  app "TokenMeter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/TokenMeter.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.tokenmeter.app.plist",
  ]
end
