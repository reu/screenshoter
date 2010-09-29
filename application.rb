require "tray"
require "screenshoter"

application = Tray.new("Screenshoter!")

application.item "Take Screenshot" do
  Screenshoter.shoot!
end

application.item "Exit" do
  java.lang.System::exit(0)
end

application.run
