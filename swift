//
//  ViewController.swift
//  Harry Pokker
//
//  Created by Bilguun Batbold on 26/3/19.
//  Copyright © 2019 Bilguun. All rights reserved.
//

import UIKit
import SwiftUI

class LoafTypes{
    var loafName: String?
    var loafType: [String]?
    var loafAnimation: [String]?
    var loafImage: [String]?
    
    init(loafName: String?, loafType: [String], loafAnimation: [String], loafImage: [String]) {
        self.loafName = loafName
        self.loafType = loafType
        self.loafAnimation = loafAnimation
        self.loafImage = loafImage
    }
}

class ViewController: UIViewController {
  
    @IBOutlet weak var buttinTapped: UIButton!
    @IBAction func buttonTapped(_ sender: UIButton) {
           print("HAMID")
          
       }

    var loafTypes = [LoafTypes]()
    let customGreen:UIColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        let customYellow:UIColor = #colorLiteral(red: 0.9541172385, green: 0.8875228763, blue: 0, alpha: 1)
        let customRed:UIColor = #colorLiteral(red: 0.8431372549, green: 0.1725490196, blue: 0.2549019608, alpha: 0.8483028791)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loafTypes.append(LoafTypes.init(loafName: "Plain Loaf", loafType: ["Top","Centre", "Centre","Bottom"], loafAnimation: ["Top -> Bottom", "Left -> Right", "Right -> Left","Bottom -> Top"], loafImage: ["top","mid","mid","bottom"]))
              loafTypes.append(LoafTypes.init(loafName: "Gradient Loaf", loafType: ["Top","Centre", "Centre","Bottom"], loafAnimation: ["Top -> Bottom", "Left -> Right", "Right -> Left","Bottom -> Top"], loafImage: ["top","mid","mid","bottom"]))
              loafTypes.append(LoafTypes.init(loafName: "Popup Card", loafType: ["Centre","Centre"], loafAnimation: ["Blur Background","Without Blur effect"], loafImage: ["pop","pop"]))
              loafTypes.append(LoafTypes.init(loafName: "Dash Board", loafType: ["Loafjet proprietary Style","Successful Style","Information Style","Alert Style"], loafAnimation: ["Bottom","Bottom","Bottom","Bottom"], loafImage: ["Dash","Dash","Dash","Dash"]))
              loafTypes.append(LoafTypes.init(loafName: "Loaf Wheel", loafType: ["Centre"], loafAnimation: ["Only one type of animation"], loafImage: ["wheel"]))
              loafTypes.append(LoafTypes.init(loafName: "Customized Loafs", loafType: ["Xcode","Airpods","Error","Sucessful","Warning","Information","Do Not Disturb"], loafAnimation: ["Optional","Optional","Optional","Optional","Optional","Optional","Optional"], loafImage: ["bottom","bottom","bottom","bottom","bottom","bottom","bottom"]))

        if let loadedUserData = DataManager.shared.loadUserData() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyboard.instantiateViewController(withIdentifier: "NewViewControllerIdentifier")
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true, completion: nil)
        } else {
            let hostingController = UIHostingController(rootView: ContentView(viewController: self))
                    addChild(hostingController)
                    view.addSubview(hostingController.view)
                    hostingController.didMove(toParent: self)

                    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                    ])
        }
        
        
       
        
    }
    func authenticateUserGuest(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "NewViewControllerIdentifier")
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        
    }
    func authenticateUser(username: String, password: String, showError: @escaping (String) -> Void,showLogin: @escaping (String) -> Void) {
        if !username.isEmpty {
          
            if !password.isEmpty {
                AuthService.shared.login(email: username, password: password) { success in
                    if success {
                        // Login successful, navigate to home controller
                        
                        showLogin("true")
                     
                    } else {
                        showError("User Or Password is not true")
                        DispatchQueue.main.async {
                            Loaf.GradientLoaf(message: "User Or Password is not true", position: .top, loafWidth: 350, loafHeight: 45, cornerRadius: 5, fontStyle: "Avenir-Heavy", fontSize: 17, bgColor1: .darkBlueSky, bgColor2: .blue, fontColor: .white, animationDirection: .top, duration: 2, loafjetView: self.view)
                        }
                        // Handle unsuccessful login
                    }
                }
            } else {
                
            }
        } else {
           
        }
    }

}
