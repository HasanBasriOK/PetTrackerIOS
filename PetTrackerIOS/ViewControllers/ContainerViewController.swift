//
//  ContainerViewController.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import Foundation
import UIKit

class ContainerViewController : UIViewController {
    
    private var menuState: MenuState = .closed

    let menuViewController = MenuViewController()
    let homeViewController = HomeViewController()
    let dashboardViewController = DashboardViewController()
    let vaccineViewController = VaccineViewController()
    let treatmentViewController = TreatmentViewController()
    let medicineViewController = MedicineViewController()
    let coiffeurViewController = CoiffeurViewController()
    let foodViewController = FoodViewController()
    let settingsViewController = SettingsViewController()
    let profileViewController = ProfileViewController()
    var navController: UINavigationController?
    //lazy var infoViewController = MyPropertiesViewController()
    //lazy var appRatingViewController = ProfileViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addChildVCs()
        addDashboard()
        
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addChildVCs() {
        //Menu
        menuViewController.delegate = self
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
        
        //Home
        homeViewController.delegate = self
        let navContoller = UINavigationController(rootViewController: homeViewController)
        addChild(navContoller)
        view.addSubview(navContoller.view)
        navContoller.didMove(toParent: self)
        self.navController = navContoller
    }
    
}

extension ContainerViewController : HomeViewControllerDelegate {
    func didTapMenuButton() {
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        //Animation the menu
        switch menuState {
        case .closed:
            //open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navController?.view.frame.origin.x = self.homeViewController.view.frame.size.width - 150
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }

        case .opened:
            //close it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navController?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate {
    func didSelect(menuItem: MenuOptions) {
        toggleMenu(completion: nil)
            switch menuItem {
            case .dashboard:
                self.resetToHome()
            case .vaccines:
                self.addPage(viewController: vaccineViewController )
                break
            case .treatments:
                self.addPage(viewController: treatmentViewController)
                break
            case .medicines:
                self.addPage(viewController: medicineViewController)
                break
            case .coiffeur:
                self.addPage(viewController: coiffeurViewController)
                break
            case .foods:
                self.addPage(viewController: foodViewController)
                break
            case .settings:
                self.addPage(viewController: settingsViewController)
                break
            case .profile:
                self.addPage(viewController: profileViewController)
                break
            }
    }
    
    func addDashboard(){
        let viewController = dashboardViewController
        homeViewController.addChild(viewController)
        homeViewController.view.addSubview(viewController.view)
        viewController.view.frame = view.frame
        viewController.didMove(toParent: homeViewController)
        homeViewController.title = viewController.title
        
    }
    
    func addPage(viewController : UIViewController){
        
        let viewController = treatmentViewController
        
        homeViewController.addChild(viewController)
        homeViewController.view.addSubview(viewController.view)
        viewController.view.frame = view.frame
        viewController.didMove(toParent: homeViewController)
        homeViewController.title = viewController.title
    }
    
    func resetToHome() {
        addDashboard()
    }
}
