//
//  TopBarA.swift
//  m4-scroll-observer
//
//  Created by Chen,Meisong on 2019/7/12.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

class TopBarA: UIView {
    public lazy var label: UILabel = {
        let label = UILabel()
        label.text = "随便什么文字"
        
        return label
    }()
    
    
    // init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
//        makeLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopBarA {
    private func addSubViews() {
        addSubview(label)
    }
//    private func makeLayout() {
//
//    }
}

extension TopBarA {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var frame = self.bounds
        frame.size.width -= 100
        label.frame = frame
    }
    
    public func scrollUp(_ progress: CGFloat) {
        if progress > 0.5 {
            backgroundColor = .white
            label.textColor = .red
        } else {
            backgroundColor = .clear
            label.textColor = .black
        }
    }
    public func scrollDown(_ progress: CGFloat) {
        self.alpha = 1 - progress
    }
}
