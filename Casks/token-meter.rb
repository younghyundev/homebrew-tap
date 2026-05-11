cask "token-meter" do
  version "0.3.5"
  sha256 "c152d47577c36713d3210a3d4e40c1a65a6bdf1fc5f47a5b3d68bef815ff1367"

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
