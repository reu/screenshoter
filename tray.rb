class Tray
  attr_accessor :name, :items

  include Java

  import java.awt.TrayIcon
  import java.awt.Toolkit
  import java.awt.MenuItem
  import java.awt.SystemTray
  import java.awt.PopupMenu

  def initialize(name)
    @name = name
    @items = []
  end

  def item(name, &block)
    item = MenuItem.new name
    item.add_action_listener block
    @items << item
  end

  def run
    SystemTray.system_tray.add(tray_icon)
  end

  protected

    def tray_icon
      image = Toolkit.default_toolkit.get_image("camera.png")
      @tray_icon = TrayIcon.new(image, name, popup)
      @tray_icon.image_auto_size = true
      @tray_icon
    end

    def popup
      @popup = PopupMenu.new
      items.each { |item| @popup.add item }
      @popup
    end
end
