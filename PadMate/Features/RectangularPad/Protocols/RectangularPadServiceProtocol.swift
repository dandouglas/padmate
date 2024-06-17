//
//  RectangularPadServiceProtocol.swift
//  PadMate
//
//  Created by Daniel Douglas on 13/06/2024.
//

import Foundation

protocol RectangularPadServiceProtocol {
    func calculateRectangularConcretePadMetric(width: Int, length: Int, depth: Int) -> RectangularPad
}
