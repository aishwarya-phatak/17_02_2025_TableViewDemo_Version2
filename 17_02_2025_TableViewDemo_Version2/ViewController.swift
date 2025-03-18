//
//  ViewController.swift
//  17_02_2025_TableViewDemo_Version2
//
//  Created by Vishal Jagtap on 17/03/25.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var menuItems : [Menu] = [
        Menu(menuItem: "Dosa", menuDescription: "delicious", menuPrice: 75.00,
             menuImage: UIImage(named: "test_image_1")!),
        Menu(menuItem: "Idli", menuDescription: "delicious", menuPrice: 40.00, menuImage: UIImage(named: "test_image_2")!),
        Menu(menuItem: "Samosa", menuDescription: "delicious", menuPrice: 20.00, menuImage: UIImage(named: "test_image_3")!),
        Menu(menuItem: "Upma", menuDescription: "delicious", menuPrice: 30.00, menuImage: UIImage(named: "test_image_1")!),
        Menu(menuItem: "Vada", menuDescription: "delicious", menuPrice: 40.00, menuImage: UIImage(named: "test_image_2")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        registerCellWithXIB()
    }
    
    private func registerCellWithXIB(){
        let uiNib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        self.menuTableView.register(uiNib, forCellReuseIdentifier: "MenuTableViewCell")
    }
}

//MARK : Implementation of UITableViewDataSource
extension ViewController : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let menuTableViewCell = self.menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        menuTableViewCell.menuItemLabel.text = menuItems[indexPath.row].menuItem
        menuTableViewCell.menuItemDescriptionLabel.text = menuItems[indexPath.row].menuDescription
        menuTableViewCell.menuItemPriceLabel.text = "\(menuItems[indexPath.row].menuPrice)"
        menuTableViewCell.menuImageView.image = menuItems[indexPath.row].menuImage
        
        return menuTableViewCell
    }
}

//MARK : Implementation of UITableViewDelegate
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}
