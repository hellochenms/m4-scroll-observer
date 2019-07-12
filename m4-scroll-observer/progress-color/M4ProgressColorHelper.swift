//
//  M4ProgressColorHelper.swift
//  m4-scroll-observer
//
//  Created by Chen,Meisong on 2019/7/12.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit
import CoreGraphics

class M4ProgressColorHelper: NSObject {
    public var progress0Color: UIColor = {
        let color = UIColor.black
        return color
    }()
    public var progress1Color: UIColor = {
        let color = UIColor.white
        return color
    }()
    
    public func color(_ progress: CGFloat) -> UIColor? {
        var p = min(max(0, progress), 1)
        guard var progress0ColorComs = progress0Color.cgColor.components,
            var progress1ColorComs = progress1Color.cgColor.components
            else { return nil }
        
        if progress0Color.cgColor.numberOfComponents == 2 {
            progress0ColorComs = [progress0ColorComs[0], progress0ColorComs[0], progress0ColorComs[0], progress0ColorComs[1]]
        }
        
        if progress1Color.cgColor.numberOfComponents == 2 {
            progress1ColorComs = [progress1ColorComs[0], progress1ColorComs[0], progress1ColorComs[0], progress1ColorComs[1]]
        }
        let deltaComs = [progress1ColorComs[0] - progress0ColorComs[0], progress1ColorComs[1] - progress0ColorComs[1], progress1ColorComs[2] - progress0ColorComs[2], progress1ColorComs[3] - progress0ColorComs[3]]
        
        let color = UIColor(red: progress0ColorComs[0] + deltaComs[0] * progress,
                            green: progress0ColorComs[1] + deltaComs[1] * progress,
                            blue: progress0ColorComs[2] + deltaComs[2] * progress,
                            alpha: progress0ColorComs[3] + deltaComs[3] * progress)
        
        return color
    }
}
