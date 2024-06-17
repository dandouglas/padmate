//
//  VolumeCalculationError.swift
//  PadMate
//
//  Created by Daniel Douglas on 17/06/2024.
//

import Foundation

enum VolumeCalculationError: Error {
    case invalidInput
    case calculationFailed(Error)
}
