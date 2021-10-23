//
//  MoveView.swift
//  TinderLikeApp3
//
//  Created by 始関秀弥 on 2021/10/22.
//

import UIKit

class MoveView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var goodLabel: UILabel!
    
    @IBOutlet weak var nopeLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var rigionLabel: UILabel!
    
    @IBOutlet weak var syumiLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    
    let gradientLayer = CAGradientLayer()
    
    let imageString = ["easyKanta", "banana", "taki", "line"]
    let nameString = ["Kanta", "BANANA", "SYOU", "Alian"]
    
    let personString = ["easyKanta":"Kanta",
                        "banana":"BANANA",
                        "taki":"SYOU",
                        "line":"Alian"]
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        rigionLabel.adjustsFontSizeToFitWidth = true
        syumiLabel.adjustsFontSizeToFitWidth = true
        
        goodLabel.textColor = .rgb(red: 137, green: 223, blue: 86)
        goodLabel.layer.borderColor = UIColor.rgb(red: 137, green: 223, blue: 86).cgColor
        goodLabel.layer.borderWidth = 3
        goodLabel.layer.cornerRadius = 10
        nopeLabel.textColor = .rgb(red: 222, green: 110, blue: 110)
        nopeLabel.layer.borderColor = UIColor.rgb(red: 222, green: 110, blue: 110).cgColor
        nopeLabel.layer.borderWidth = 3
        nopeLabel.layer.cornerRadius = 10
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let view = UINib(nibName: "MoveView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        addSubview(view)
        setupGradientLayer()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panMoveView))
        view.addGestureRecognizer(panGesture)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.bounds
    }
    
    func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.3, 1.1]
        imageView.layer.addSublayer(gradientLayer)
    }
    
    
    
    @objc func panMoveView(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        
        guard let view = gesture.view else { return }
        
        if gesture.state == .changed {
            let dgree: CGFloat = translation.x / 20
            let angle = dgree * .pi / 100
            let rotateTranslation = CGAffineTransform(rotationAngle: angle)
            self.transform = rotateTranslation.translatedBy(x: translation.x, y: translation.y)
            
            let ratio: CGFloat = 1 / 100
            let ratioValue = ratio * translation.x
            
            if translation.x > 0 {
                self.goodLabel.alpha = ratioValue
            }else if translation.x < 0 {
                self.nopeLabel.alpha = -ratioValue
            }
            
        }else if gesture.state == .ended {
            if translation.x <= -120 {
                self.removeMoveViewAnimation(x: -600)
            } else if translation.x >= 120 {
                self.removeMoveViewAnimation(x: 600)
            } else {
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
                    self.transform = .identity
                    self.layoutIfNeeded()
                    self.goodLabel.alpha = 0
                    self.nopeLabel.alpha = 0
                }
            }
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
