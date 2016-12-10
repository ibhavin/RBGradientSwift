//
//  RBGradientView.swift
//  Music
//
//  Created by Bhavin on 10/12/16.
//  Copyright © 2016 bhavin ramani. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var endColor: UIColor = .black{
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var startLocation: Double = 0.05 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var endLocation: Double = 0.95 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var horizontalMode: Bool = false {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var diagonalMode: Bool = false {
        didSet {
            layoutSubviews()
        }
    }
    
    
    // add border color, width and corner radius properties to your GradientView
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let layer = layer as? CAGradientLayer else { return }
        if horizontalMode {
            if diagonalMode {
                layer.startPoint = CGPoint(x: 1, y: 0)
                layer.endPoint = CGPoint(x: 0, y: 1)
            } else {
                layer.startPoint = CGPoint(x: 0, y: 0.5)
                layer.endPoint = CGPoint(x: 1, y: 0.5)
            }
        } else {
            if diagonalMode {
                layer.startPoint = CGPoint(x: 0, y: 0)
                layer.endPoint = CGPoint(x: 1, y: 1)
            } else {
                layer.startPoint = CGPoint(x: 0.5, y: 0)
                layer.endPoint = CGPoint(x: 0.5, y: 1)
            }
        }
        layer.locations = [startLocation as NSNumber, endLocation as NSNumber]
        layer.colors = [startColor.cgColor, endColor.cgColor]
        
        // add border and corner radius also to your layer
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}

