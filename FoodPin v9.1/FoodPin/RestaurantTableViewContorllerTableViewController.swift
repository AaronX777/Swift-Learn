//
//  RestaurantTableViewContorllerTableViewController.swift
//  FoodPin
//
//  Created by rd on 2019/2/25.
//  Copyright © 2019 aaron. All rights reserved.
//

import UIKit

class RestaurantTableViewContorllerTableViewController: UITableViewController {
 

    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantLocation = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantType = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]

    var restorationIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        //28:as! RestaurantTableViewCell 強制轉型
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

/*
        cell.textLabel?.text = restaurantNames[indexPath.row]
        //cell.imageView?.image = UIImage(named: "restaurant")
        cell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
*/
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel?.text = restaurantLocation[indexPath.row]
        cell.typLabel?.text = restaurantType[indexPath.row]

        
        //課本190
        //如果restorationIsVisited=true,就會在Cell顯示打勾,否則就不顯示
        if restorationIsVisited[indexPath.row]{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    //課本181
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //建立一個動作至選單
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
    /*顯示呈現與上不同actionSheet N+ alert
         let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .alert)

    */
       //加入動作至選單
        let cancelAction = UIAlertAction(title: "Canel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
 
        //課本185
        //打電話的動作
        let callActionHandler = { (action: UIAlertAction!)  -> Void in
        let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retyry Later.", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertMessage, animated: true,completion: nil)
        }
        
        //打電話
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        //課本186
        //打卡動作
        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {(action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            //課本190
            //在Boolean存值
            self.restorationIsVisited[indexPath.row] = true
            
        })
        optionMenu.addAction(checkInAction)
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
            popoverController.sourceView = cell
            popoverController.sourceRect = cell.bounds
            }
        }
        
        //呈現出表單
        present(optionMenu, animated: true,completion: nil)
        
        //取消列的選取
        tableView.deselectRow(at: indexPath, animated: false)
    }
}