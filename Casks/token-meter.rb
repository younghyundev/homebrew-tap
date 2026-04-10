cask "token-meter" do
  version "0.1.2"
  sha256 "51bcb33266a8a5c36163c30d1a64ac984f0e93f57b8b0e69ba9fa551c8728fc7"

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
