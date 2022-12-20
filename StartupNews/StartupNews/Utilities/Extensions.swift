//
//  Extensions.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import UIKit

extension UIImageView {
    
    ///  Gives a circular aspect to the image
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}

