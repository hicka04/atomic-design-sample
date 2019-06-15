//
//  ExpandLabelView.swift
//  design-parts
//
//  Created by hicka04 on 2019/01/05.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

@IBDesignable
public class ExpandTextView: UIView {

    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var expandButton: UIButton!
    @IBOutlet private weak var expandSwitchView: UIView!
    @IBOutlet private weak var minimumHeightConstraint: NSLayoutConstraint!
    
    @IBInspectable var defaultText: String = "" {
        didSet {
            textView.text = defaultText
        }
    }
    @IBInspectable var minimumRows: Int = 1 {
        didSet {
            guard minimumRows > 0 else {
                // 0ならすべて表示させる
                collapseTextView()
                return
            }
            
            print(minimumHeight)
            minimumHeightConstraint.constant = minimumHeight
        }
    }
    
    @IBAction private func expandButtonDidTap() {
        collapseTextView()
    }
    
    private var minimumHeight: CGFloat {
        guard let lineHeight = textView.font?.lineHeight else {
            assertionFailure("failed to get font size")
            return 0
        }
        
        return lineHeight * CGFloat(minimumRows + 1)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        
        expandButton.titleLabel?.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        
        expandButton.titleLabel?.backgroundColor = .white
        let numberOfLines = textView.contentSize.height / textView.font!.lineHeight
        print(numberOfLines)
    }
    
    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        
        size.height = minimumHeight + 16
        
        return size
    }
    
    private func collapseTextView() {
        UIView.animate(withDuration: 0.2) {
//            self.expandButton.isHidden = true
            self.expandSwitchView.isHidden.toggle()
        }
    }
}

extension ExpandTextView {
    
    public func setText(_ text: String) {
        textView.text = text
    }
}
