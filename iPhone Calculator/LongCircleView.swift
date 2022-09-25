//
//  longCircleView.swift
//  iPhone Calculator
//
//  Created by Oleksandr Smakhtin on 25.09.2022.
//

import UIKit

class LongCircleView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 40
        clipsToBounds = true
    }

}
