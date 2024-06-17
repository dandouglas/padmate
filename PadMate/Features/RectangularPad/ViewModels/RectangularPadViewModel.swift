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
    var coordinator: RectangularPadCoordinator?
    
    init(rectangularPadService: RectangularPadServiceProtocol) {
        self.rectangularPadService = rectangularPadService
    }
    
    func calculateVolume() {
            do {
                // Ensure that width, length, and depth are not nil and can be converted to Int
                guard case let widthString = width, let width = Int(widthString),
                      case let lengthString = length, let length = Int(lengthString),
                      case let depthString = depth, let depth = Int(depthString) else {
                    throw VolumeCalculationError.invalidInput
                }

                // Calculate the volume
                let pad = rectangularPadService.calculateRectangularConcretePadMetric(width: width, length: length, depth: depth)
                volume = pad.volume

                // Navigate to result with the calculated pad
                coordinator?.navigateToResult(pad: pad)
            } catch let error as VolumeCalculationError {
                handleVolumeCalculationError(error)
            } catch {
                handleVolumeCalculationError(.calculationFailed(error))
            }
        }


    private func handleVolumeCalculationError(_ error: VolumeCalculationError) {
        switch error {
        case .invalidInput:
            // TODO: Handle invalid input error, e.g., show an alert to the user
            print("Invalid input. Please enter valid integers for width, length, and depth.")
        case .calculationFailed(let underlyingError):
            // TODO: Handle service calculation error, e.g., show an alert to the user
            print("Calculation failed with error: \(underlyingError.localizedDescription)")
        }
    }
}

