//
//  CustomView.swift
//  iPhone Calculator
//
//  Created by Oleksandr Smakhtin on 25.09.2022.
//

import UIKit

class CircleView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }

}
