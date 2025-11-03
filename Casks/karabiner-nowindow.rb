cask "karabiner-nowindow" do
  on_monterey :or_older do
    on_catalina :or_older do
      version "13.7.0"
      sha256 "9ac5e53a71f3a00d7bdb2f5f5f001f70b6b8b7b2680e10a929e0e4c488c8734b"

      livecheck do
        skip "Legacy version"
      end
    end
    on_big_sur do
      version "14.13.0"
      sha256 "826270a21b7f4df9b9a8c79c9aad4de8f48021f58eaacbee1d4f150c963c6cbc"

      livecheck do
        skip "Legacy version"
      end
    end
    on_monterey do
      version "14.13.0"
      sha256 "826270a21b7f4df9b9a8c79c9aad4de8f48021f58eaacbee1d4f150c963c6cbc"

      livecheck do
        skip "Legacy version"
      end
    end
  end
  on_ventura :or_newer do
    version "15.5.90"
    sha256 "ed83676edbfb264f211bfb2d49314acead5c55a4b36969925dfd41ba51ae7e45"

    pkg "Karabiner-Elements.pkg"

    uninstall early_script: {
                executable: "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/scripts/uninstall/remove_files.sh",
                sudo:       true,
              },
              launchctl:    [
                "org.pqrs.karabiner.agent.karabiner_grabber",
                "org.pqrs.karabiner.agent.karabiner_observer",
                "org.pqrs.karabiner.karabiner_console_user_server",
                "org.pqrs.karabiner.karabiner_grabber",
                "org.pqrs.karabiner.karabiner_observer",
                "org.pqrs.karabiner.karabiner_session_monitor",
                "org.pqrs.karabiner.NotificationWindow",
              ],
              signal:       [
                ["TERM", "org.pqrs.Karabiner-Menu"],
                ["TERM", "org.pqrs.Karabiner-NotificationWindow"],
              ],
              script:       {
                executable: "/Library/Application Support/org.pqrs/Karabiner-Elements/uninstall_core.sh",
                sudo:       true,
              },
              pkgutil:      [
                "org.pqrs.Karabiner-DriverKit-VirtualHIDDevice",
                "org.pqrs.Karabiner-Elements",
              ],
              delete:       "/Library/Application Support/org.pqrs"
    # The system extension 'org.pqrs.Karabiner-DriverKit-VirtualHIDDevice*' should not be uninstalled by Cask
  end

  url "https://github.com/AdoPi/Karabiner-Elements/releases/download/v15.5.90-no-window/Karabiner-Elements-15.5.90.dmg",
      verified: "github.com/AdoPi/Karabiner-Elements/"
  name "Karabiner Elements (nowindow)"
  desc "Keyboard customiser"
  homepage "https://karabiner-elements.pqrs.org/"

  auto_updates true

  binary "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"

  zap trash: [
    "~/.config/karabiner",
    "~/.local/share/karabiner",
    "~/Library/Application Scripts/org.pqrs.Karabiner-VirtualHIDDevice-Manager",
    "~/Library/Application Support/Karabiner-Elements",
    "~/Library/Caches/org.pqrs.Karabiner-Elements.Updater",
    "~/Library/Containers/org.pqrs.Karabiner-VirtualHIDDevice-Manager",
    "~/Library/HTTPStorages/org.pqrs.Karabiner-Elements.Settings",
    "~/Library/Preferences/org.pqrs.Karabiner-Elements.Updater.plist",
  ]
end
