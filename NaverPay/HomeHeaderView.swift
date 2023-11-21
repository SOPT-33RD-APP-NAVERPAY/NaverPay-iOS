//
//  MainHeaderView.swift
//  NaverPay
//
//  Created by Seonwoo Kim on 2023/11/21.
//

import UIKit

class HomeHeaderView: UIView {

    static let identifier: String = "HomeHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 랜덤으로 배경색 지정
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
