cask "token-meter" do
  version "0.1.0"
  sha256 "cefbc1e8ee3c76c29a968e41ce6fa4275383615f4ae175d50d6d2caded73dc74"

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
