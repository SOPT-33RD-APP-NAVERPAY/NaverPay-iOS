//
//  NPLabel.swift
//  NaverPay
//
//  Created by 곽성준 on 11/22/23.
//

import UIKit

final class NPLabel: UILabel {
    init(
        font: UIFont,
        color: UIColor
    ) {
        super.init(frame: .zero)
        self.font = font
        self.textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
