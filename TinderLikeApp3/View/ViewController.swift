//
//  ViewController.swift
//  TinderLikeApp3
//
//  Created by 始関秀弥 on 2021/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var middleView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
//    let imageString = ["easyKanta", "banana", "taki", "line"]
//    let nameString = ["Kanta", "BANANA", "SYOU", "Alian"]
    
    let personString = ["easyKanta":"Kanta",
                        "banana":"BANANA",
                        "taki":"SYOU",
                        "line":"Alian"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
    }
    
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpMoveView()
    }

    
    
    
    func setUpMoveView() {
        

        let frame = CGRect(x: 0, y: 0, width: middleView.bounds.width * 0.9, height: middleView.bounds.height)

        
        
        for (photoName, personName) in personString {
            let moveView = MoveView(frame: frame)
            
            self.middleView.addSubview(moveView)
            
            moveView.imageView.image = UIImage(named: photoName)
            moveView.nameLabel.text = personName
            
            moveView.center.x = self.middleView.center.x
            moveView.center.y = self.middleView.bounds.height / 2
            moveView.goodLabel.alpha = 0
            moveView.nopeLabel.alpha = 0
                        
        }
        
            
        
        
    }
}

