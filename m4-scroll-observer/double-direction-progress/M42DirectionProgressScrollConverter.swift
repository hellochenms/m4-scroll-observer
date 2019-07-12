//
//  M4Scroll2DirectionProgressConverter.swift
//  m4-scroll-observer
//
//  Created by Chen,Meisong on 2019/7/12.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

class M42DirectionProgressScrollConverter: NSObject {
    public var progress0OffsetX: CGFloat = 0
    public var scrollUpProgress1OffsetX: CGFloat = 0
    public var scrollDownProgress1OffsetX: CGFloat = 0
    
    public func scrollUpProgress(_ scrollView: UIScrollView) -> CGFloat? {
        guard scrollView.contentOffset.y > progress0OffsetX else {
            return nil
        }
        var progress = (scrollView.contentOffset.y - progress0OffsetX) / (scrollUpProgress1OffsetX - progress0OffsetX)
        progress = min(max(0, progress), 1)
        
        return progress
    }
    
    public func scrollDownProgress(_ scrollView: UIScrollView) -> CGFloat? {
        guard scrollView.contentOffset.y <= progress0OffsetX else {
            return nil
        }
        
        var progress = (scrollView.contentOffset.y - progress0OffsetX) / (scrollDownProgress1OffsetX - progress0OffsetX)
        progress = min(max(0, progress), 1)
        
        return progress
    }
}
