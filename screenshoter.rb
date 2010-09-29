class Screenshoter
  attr_accessor :screen_size

  include Java

  import java.io.File
  import java.awt.Robot
  import java.awt.Toolkit
  import java.awt.Rectangle
  import javax.imageio.ImageIO

  def self.shoot!(file_name = "screenshot.png")
    new.save file_name
  end

  def initialize
    @screen_size = Toolkit.default_toolkit.screen_size
  end

  def save(file_name)
    ImageIO::write capture, "png", File.new(file_name)
  end

  def capture
    area = Rectangle.new 0, 0, @screen_size.width, @screen_size.height
    Robot.new.create_screen_capture(area)
  end
end
