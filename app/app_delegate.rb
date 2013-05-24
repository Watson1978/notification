class AppDelegate
  # def application(sender, openFiles:args)
  #   Notification.send("title", "text")
  # end

  def applicationDidFinishLaunching(notification)

    args = NSProcessInfo.processInfo.arguments
    message = args[1] || "test"

    self.send("Notification", message)
  end

  def send(title, text)
    notification = NSUserNotification.alloc.init
    notification.title = title
    notification.informativeText = text

    center = NSUserNotificationCenter.defaultUserNotificationCenter
    center.delegate = self
    center.scheduleNotification(notification)
  end

  def userNotificationCenter(center,
        didDeliverNotification:userNotification)
    exit
  end

end
