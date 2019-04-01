//
//  RoundedViews.swift
//  EcommerceApp
//
//  Created by Qudsia Mehmood on 22/01/2019.
//  Copyright © 2019 Qudsia Mehmood. All rights reserved.
//


import UIKit

class RoundedViews : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedShadowView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColor.Blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
    }
}

class roundedImageView : UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}
