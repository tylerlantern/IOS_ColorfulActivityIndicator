//
//  ColorfulActivityIndicator.swift
//  ColorfulActivityIndicator
//
//  Created by Nattapong Unaregul on 19/09/2016.
//  Copyright © 2016 Nattapong. All rights reserved.
//

import UIKit
@IBDesignable
class ColorfulActivityIndicator: UIControl {
    let ring = RingLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInitialization()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.clear
        drawLayers()
    
    }
    func drawLayers() {
        setConstraints(length: squareLength)
        ring.bounds = self.bounds
        ring.position = CGPoint(x: squareLength/2, y: squareLength/2)
    }
    private func setConstraints(length : CGFloat){
        self.bounds = CGRect(x: 0, y: 0, width: length, height: length)
        NSLayoutConstraint.activate(
            [self.widthAnchor.constraint(equalToConstant: length)
                ,self.heightAnchor.constraint(equalToConstant: length)]
        )
    }
    private func sharedInitialization() {
        backgroundColor = UIColor.black
        layer.addSublayer(ring)
        ring.backgroundColor = UIColor.clear.cgColor
        ring.ringBackgroundColor = ringBackgroundColor.cgColor
        ring.ringWidth = ringWidth
        setColorForRing(Fcolor: UIColor.green,Scolor: UIColor.white)
    }
    @IBInspectable
    var ringWidth : CGFloat = 10.0 {
        didSet {
            ring.ringWidth = ringWidth
        }
    }
    @IBInspectable
    var ringBackgroundColor : UIColor = UIColor.darkGray {
        didSet {
            ring.ringBackgroundColor = ringBackgroundColor.cgColor
        }
    }
    @IBInspectable
    var ringColor1 : UIColor = UIColor.darkGray {
        didSet {
           setColorForRing(Fcolor: ringColor1, Scolor: ringColor2)
        }
    }
    @IBInspectable
    var ringColor2 : UIColor = UIColor.darkGray {
        didSet {
            setColorForRing(Fcolor: ringColor1, Scolor: ringColor2)
        }
    }
    @IBInspectable
    var squareLength : CGFloat = 30 {
        didSet{
            setConstraints(length: squareLength)
        }
    }
    func start(){
        ring.start()
    }
    func stop(){
        ring.stop()
        
    }
    private func setColorForRing(Fcolor: UIColor,Scolor: UIColor) {
        ring.ringColors = (Fcolor.cgColor, Scolor.cgColor)
    }
    
}
