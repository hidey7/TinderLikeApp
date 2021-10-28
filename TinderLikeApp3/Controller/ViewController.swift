//
//  ViewController.swift
//  TinderLikeApp3
//
//  Created by 始関秀弥 on 2021/10/22.
//

import UIKit

protocol PanGestureSender {
    func nope(view: MoveView)
    func good(view: MoveView)
}


class ViewController: UIViewController  {
    
    
    
    
    
    
    
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var middleView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    //    let imageString = ["easyKanta", "banana", "taki", "line"]
    //    let nameString = ["Kanta", "BANANA", "SYOU", "Alian"]
    
    let personString = ["easyKanta":"Kanta",
                        "banana":"BANANA",
                        "taki":"SYOU",
                        "line":"Alian"]
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    var delegate: PanGestureSender?
    
    var isMoveAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        middleView.layer.zPosition = 1
        
        setUpButtons()
        
        self.delegate = MoveView()
    }
    
   
    
    
    @IBAction func nopeButtonTapped(_ sender: Any) {
        
        let moveview = middleView.subviews.last as! MoveView
        if !isMoveAnimating && (!middleView.subviews.isEmpty){
            isMoveAnimating = true
            
//            delegate?.nope(view: middleView.subviews.last as! MoveView)
            moveview.nopeLabel.alpha = 1
            self.middleView.subviews.last?.removeMoveViewAnimation(x: -600, completion: {
                self.isMoveAnimating = false
            })
        }
        
        //        self.middleView.subviews.last?.removeMoveViewAnimation(x: -600)
        
    }
    
    @IBAction func goodButtonTapped(_ sender: Any) {
        let moveview = middleView.subviews.last as! MoveView
        if !isMoveAnimating  && (!middleView.subviews.isEmpty){
            isMoveAnimating = true
//            delegate?.good(view: middleView.subviews.last as! MoveView)
            moveview.goodLabel.alpha = 1
            self.middleView.subviews.last?.removeMoveViewAnimation(x: 600, completion: {
                self.isMoveAnimating = false
            })
        }
        
    }
    
    @IBAction func reloatButtonTapped(_ sender: Any) {
        if middleView.subviews.isEmpty {
            setUpMoveView()
        }
        
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
    
    
    func setUpButtons() {
        button1.layer.cornerRadius = button1.bounds.height / 2
        button2.layer.cornerRadius = button2.bounds.height / 2
        button3.layer.cornerRadius = button3.bounds.height / 2
        button4.layer.cornerRadius = button4.bounds.height / 2
        button5.layer.cornerRadius = button5.bounds.height / 2
        
        
        button1.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button2.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button3.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button4.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button5.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowRadius = 3
        button1.layer.shadowOffset = CGSize(width: 1, height: 1)
        button1.layer.shadowOpacity = 0.5
        
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowRadius = 3
        button2.layer.shadowOffset = CGSize(width: 1, height: 1)
        button2.layer.shadowOpacity = 0.5
        
        button3.layer.shadowColor = UIColor.black.cgColor
        button3.layer.shadowRadius = 3
        button3.layer.shadowOffset = CGSize(width: 1, height: 1)
        button3.layer.shadowOpacity = 0.5
        
        button4.layer.shadowColor = UIColor.black.cgColor
        button4.layer.shadowRadius = 3
        button4.layer.shadowOffset = CGSize(width: 1, height: 1)
        button4.layer.shadowOpacity = 0.5
        
        button5.layer.shadowColor = UIColor.black.cgColor
        button5.layer.shadowRadius = 3
        button5.layer.shadowOffset = CGSize(width: 1, height: 1)
        button5.layer.shadowOpacity = 0.5
    }
    
    
}

