//
//  UIView+extension.swift
//  design-parts
//
//  Created by hicka04 on 2019/01/05.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

extension UIView {
    
    private var nibName: String {
        return String(describing: type(of: self))
    }
    
    func loadNib(){
        let view = Bundle(for: type(of: self)).loadNibNamed(nibName,
                                                            owner: self,
                                                            options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
