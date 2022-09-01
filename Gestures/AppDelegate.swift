//
//  AppDelegate.swift
//  Gestures
//
//  Created by Pavankumar Arepu on 30/08/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Gestures")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


//    @IBOutlet weak var iPhoneImageView: UIImageView!
    
    /*
    var panGesture  = UIPanGestureRecognizer()

    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupImageView()
        
        // Double Tap
        let doubleTap = UITapGestureRecognizer(target: self,
                  action: #selector(ViewController.tapDetected as
                        (ViewController) -> () -> ()))
        doubleTap.numberOfTapsRequired = 2

        self.view.addGestureRecognizer(doubleTap)
        
        
//        let pinchRecognizer = UIPinchGestureRecognizer(target: self,
//                    action: #selector(ViewController.pinchDetected as
//                    (ViewController) -> () -> ()))
//        self.imageView.addGestureRecognizer(pinchRecognizer)
        
        
        let rotationRecognizer = UIRotationGestureRecognizer(target: self,
                         action: #selector(ViewController.rotationDetected as
                                 (ViewController) -> () -> ()))
        self.view.addGestureRecognizer(rotationRecognizer)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panGestureAction(_:)))
        self.imageView.addGestureRecognizer(panRecognizer)
        
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self,
                     action: #selector(ViewController.swipeDetected as
                (ViewController) -> () -> ()))
        swipeRecognizer.direction = .up
        self.view.addGestureRecognizer(swipeRecognizer)
        
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self,
                   action: #selector(ViewController.longPressDetected as
                (ViewController) -> () -> ()))
        longPressRecognizer.minimumPressDuration = 3
        longPressRecognizer.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(longPressRecognizer)
        
        
    }
    
    @objc func tapDetected() {
        // Code to respond to gesture here
        print("Double Tap Gesture recognised")
    }
    
    @objc func pinchDetected() {
        // Code to respond to gesture here
        print("Pinch Gesture recognised")
    }
    
    @objc func rotationDetected() {
        // Code to respond to gesture here
        print("rotation Gesture recognised")
    }
    
    func setupImageView() {
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(panGesture)
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.image = UIImage(named: "iPhone")
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
                view.addSubview(imageView)
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
            }
    
    @objc func panGestureAction(_ recognizer: UIPanGestureRecognizer) {
        // Code to respond to gesture here
        print("panGesture recognised")
        
        self.view.bringSubviewToFront(imageView)
        let translation = recognizer.translation(in: self.view)
        imageView.center = CGPoint(x: imageView.center.x + translation.x, y: imageView.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    
    @objc func swipeDetected() {
        // Code to respond to gesture here
        print("Swipe Gesture recognised")
    }
    
   
    @objc func longPressDetected() {
        // Code to respond to gesture here
        print("longPress recognised")
    }
    
   
    */
    
