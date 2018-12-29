//
//  Button.swift
//  design-parts
//
//  Created by hicka04 on 2018/12/29.
//  Copyright © 2018 hicka04. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {

    @IBInspectable var style: String = "fill" {
        didSet {
            guard let style = Style(rawValue: style) else {
                fatalError()
            }
            
            switch style {
            case .fill:
                backgroundColor = .red
                setTitleColor(.white, for: .normal)
            case .border:
                backgroundColor = .white
                setTitleColor(.red, for: .normal)
            }
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        
        size.height = 48
        if let titleLabel = titleLabel {
            size.width = titleLabel.intrinsicContentSize.width + 48
        }
        
        return size
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
    }
}

extension Button {
    
    enum Style: String {
        case fill
        case border
    }
}
