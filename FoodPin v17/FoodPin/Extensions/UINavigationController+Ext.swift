//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by rd on 2019/3/14.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
