//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by rd on 2019/3/7.
//  Copyright © 2019 aaron. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantNamesLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    
    
    var restaurantImageName = ""
    var restaurantNames = ""
    var restaurantLocation = ""
    var restaurantType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        restaurantImageView.image = UIImage(named: restaurantImageName)
        restaurantNamesLabel.text = restaurantImageName
        restaurantLocationLabel.text = restaurantLocation
        restaurantTypeLabel.text = restaurantType
    }
    


}
