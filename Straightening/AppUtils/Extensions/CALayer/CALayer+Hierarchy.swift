//
//  CALayer+Hierarchy.swift
//  Straightening
//
//  Created by Josicleison Elves on 08/09/1401 AP.
//

import UIKit

extension CALayer {
    func removeSubLayers<T>(ofType: T.Type) {
        guard let sublayers = sublayers else {return}
        for layer in sublayers where (layer as? T) != nil {
            layer.removeFromSuperlayer()
        }
    }
    func removeSubLayers() {
        guard let sublayers = sublayers else {return}
        for layer in sublayers {
            layer.removeFromSuperlayer()
        }
    }
}
