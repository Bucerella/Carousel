//
//  LikeButton.swift
//  CarouselEffect
//
//  Created by Buse ERKUŞ on 9.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    func initButton(){
        layer.borderWidth = 2.0
        layer.borderColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        layer.cornerRadius = frame.size.height / 2
        
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        addTarget(self, action: #selector(LikeButton.buttonPressed), for: .touchUpInside)
    }
    @objc func buttonPressed(){
        activateButton(bool: !isOn)
    }
    func activateButton(bool: Bool){
        isOn = bool
        
        let color = bool ? #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1) : .clear
        let title = bool ? "+1" : ""
        let titleColor = bool ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
}
