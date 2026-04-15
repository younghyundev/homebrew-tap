cask "token-meter" do
  version "0.2.2"
  sha256 "b302088da8702af537bf33ec115bb1a806049485bc725c6b0fbdc5796a61d3d8"

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
