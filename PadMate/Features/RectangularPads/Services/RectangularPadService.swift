//
//  RectangularPadService.swift
//  PadMate
//
//  Created by Daniel Douglas on 13/06/2024.
//

import Foundation

class RectangularPadService: RectangularPadServiceProtocol {
    func calculateRectangularConcretePadMetric(width: Int, length: Int, depth: Int) -> RectangularPad {
        let volume = (Double(width) * Double(length) * Double(depth) / 1000000);
        return RectangularPad(width: width, length: length, depth: depth, volume: volume)
    }
}

