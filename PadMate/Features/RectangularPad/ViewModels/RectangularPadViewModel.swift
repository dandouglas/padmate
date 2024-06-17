//
//  RectangularPadViewModel.swift
//  PadMate
//
//  Created by Daniel Douglas on 13/06/2024.
//

import Combine
import Foundation

class RectangularPadViewModel: ObservableObject {
    @Published var width: String = ""
    @Published var length: String = ""
    @Published var depth: String = ""
    @Published var volume: Double? = nil

    private let rectangularPadService: RectangularPadServiceProtocol
    
    init(rectangularPadService: RectangularPadServiceProtocol) {
        self.rectangularPadService = rectangularPadService
    }

    func calculateVolume() {
        guard let width = Int(width),
              let length = Int(length),
              let depth = Int(depth) else {
            volume = nil
            return
        }
        let pad = rectangularPadService.calculateRectangularConcretePadMetric(width: width, length: length, depth: depth)
        volume = pad.volume
    }
}

