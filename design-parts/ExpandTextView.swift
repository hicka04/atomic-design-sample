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
                expand()
                return
            }
        }
    }
    
    @IBAction private func expandButtonDidTap() {
        expand()
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
        
        configureHeight()
        expandButton.titleLabel?.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        
        configureHeight()
        
        expandButton.titleLabel?.backgroundColor = .white
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configureHeight()
    }
    
    private func configureHeight() {
        guard minimumRows > 0 else {
            return
        }
        
        let height = frame.size.height
        collapse()
        if frame.size.height < height {
            expand()
        }
    }
    
    private func expand() {
        UIView.animate(withDuration: 0.2) {
            self.expandSwitchView.isHidden = true
            self.expandButton.isHidden = true
        }
    }
    
    private func collapse() {
        expandSwitchView.isHidden = false
        expandButton.isHidden = false
        minimumHeightConstraint.constant = minimumHeight
    }
}

extension ExpandTextView {
    
    public func setText(_ text: String) {
        textView.text = text
    }
}
