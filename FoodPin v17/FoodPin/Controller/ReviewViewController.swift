//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by rd on 2019/3/23.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit


class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
        
        //模糊效果
        //style: .dark;.light;.extraLight
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //讓按鈕往外移動X軸600
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        //讓圖片變大5倍
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        

        
        for rateButton in rateButtons {
            //讓按鈕隱藏
            rateButton.alpha = 0
            //把按鈕移動到畫面外
            rateButton.transform = moveScaleTransform
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var rateButtons: [UIButton]!
    
    override func viewWillAppear(_ animated: Bool) {
            //渲染動畫方法1
//        UIView.animate(withDuration: 2.0) {
//            self.rateButtons[0].alpha = 1.0 //Love
//            self.rateButtons[1].alpha = 1.0 //Cool
//            self.rateButtons[2].alpha = 1.0 //Happy
//            self.rateButtons[3].alpha = 1.0 //Sad
//            self.rateButtons[4].alpha = 1.0 //Angry

            //渲染動畫方法2
//        UIView.animate(withDuration:  0.4, delay: 0.1, options: [], animations: {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[0].transform = .identity
//        }, completion: nil)

        //彈跳動畫
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[1].transform = .identity

        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity

        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[3].transform = .identity

        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
            self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity

        }, completion: nil)
        
        }
}

