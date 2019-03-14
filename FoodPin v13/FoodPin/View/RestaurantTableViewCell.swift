//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by rd on 2019/2/26.
//  Copyright © 2019 aaron. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    //TEST1
    @IBOutlet var heartImageView: UIImageView!
    
    //更改thumbnailImageView圖案圓角半徑 方法1=課本173頁
    /* 更改thumbnailImageView圖案圓角半徑 方法2
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 30.0
            thumbnailImageView.clipsToBounds = true
        }
    }
    */
    
    /* 更改thumbnailImageView圖案圓角半徑 方法3
     用圖片視角的寬度來計算值
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2
            thumbnailImageView.clipsToBounds = true

        }
    }
    */

}
