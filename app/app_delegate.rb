class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    mainController = MainController.alloc.initWithNibName(nil, bundle:nil)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = mainController
    @window.makeKeyAndVisible

    true
  end
end
