//
//  ViewController.swift
//  17_02_2025_TableViewDemo_Version2
//
//  Created by Vishal Jagtap on 17/03/25.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var menuTableView: UITableView!
    var menuTableViewCell : MenuTableViewCell?
    
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
    
    @IBAction func btnAddMenuItem(_ sender: UIButton) {
        menuTableView.beginUpdates()
//        self.menuItems.append(Menu(menuItem: "A", menuDescription: "A", menuPrice: 3423.12, menuImage: UIImage(named: "test_image_1")!))
        
        self.menuItems.insert(Menu(menuItem: "A", menuDescription: "A", menuPrice: 3423.12, menuImage: UIImage(named: "test_image_1")!), at: 0)
        self.menuTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        menuTableView.endUpdates()
    }
}

//MARK : Implementation of UITableViewDataSource
extension ViewController : UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if(editingStyle == .delete){
//            menuTableView.beginUpdates()
//            self.menuTableView.deleteRows(at: [indexPath], with: .fade)
//            self.menuItems.remove(at: indexPath.row)
//            menuTableView.endUpdates()
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        menuTableViewCell = self.menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        menuTableViewCell!.menuItemLabel.text = menuItems[indexPath.row].menuItem
        menuTableViewCell!.menuItemDescriptionLabel.text = menuItems[indexPath.row].menuDescription
        menuTableViewCell!.menuItemPriceLabel.text = "\(menuItems[indexPath.row].menuPrice)"
        menuTableViewCell!.menuImageView.image = menuItems[indexPath.row].menuImage
        
        menuTableViewCell?.btnDeleteMenuItem.addTarget(self, action: #selector(deleteMenuItem), for: .touchUpInside)
        
        return menuTableViewCell!
    }
}

//MARK : Implementation of UITableViewDelegate
extension ViewController : UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuTableViewCell?.btnDeleteMenuItem.addTarget(self, action: #selector(deleteMenuItem), for: .touchUpInside)
    }
    
    @objc func deleteMenuItem(sender : UIButton){
        menuTableView.beginUpdates()
        let point = sender.convert(CGPoint.zero, to: menuTableView)
        print(point)
        
        let indexPath1 = menuTableView.indexPathForRow(at: point)! as IndexPath
        self.menuTableView.deleteRows(at: [indexPath1], with: .fade)
        self.menuItems.remove(at: indexPath1.row)
        menuTableView.endUpdates()
    }
}
