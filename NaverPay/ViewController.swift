//
//  ViewController.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "Font Test"
        label.textColor = UIColor.gray
        label.font = UIFont.font(.number_bold_27)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.addSubview(label1)
        
    }
    


}
