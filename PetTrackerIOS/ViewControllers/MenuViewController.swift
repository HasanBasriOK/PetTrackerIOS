//
//  MenuViewController.swift
//  PetTrackerIOS
//
//  Created by HasanBasriOk on 6.07.2023.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuItem: MenuOptions)
}

class MenuViewController : UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    weak var delegate: MenuViewControllerDelegate?
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = nil
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //view.backgroundColor = greyColor
        
        tableView.register(HamburgerMenuTableViewCell.self, forCellReuseIdentifier: "HamburgerMenuTableViewCell")         // register cell name
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
}

extension MenuViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MenuHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: 100, height: 500)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HamburgerMenuTableViewCell", for: indexPath) as! HamburgerMenuTableViewCell
        cell.customImageView.image = UIImage(named: "homesymbol")!
        cell.menuItemNameLabel.attributedText = NSMutableAttributedString(string: MenuOptions.allCases[indexPath.row].rawValue, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.black])
        
        
        if MenuOptions.allCases[indexPath.row] == MenuOptions.dashboard{
            cell.backgroundColor = UIColor(red: 231/255, green: 245/255, blue: 204/255, alpha: 1)
        }

        /*let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.backgroundColor = greyColor
        cell.contentView.backgroundColor = greyColor*/
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOptions.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
    
}
