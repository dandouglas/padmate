//
//  RectangularForm.swift
//  PadMate
//
//  Created by Daniel Douglas on 13/06/2024.
//

import Foundation
import SwiftUI

struct RectangularFormView: View {
    @StateObject private var rectangularPadViewModel: RectangularPadViewModel

    init(viewModel: RectangularPadViewModel) {
        _rectangularPadViewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Distance Measurements")) {
                    TextField("Width", text: $rectangularPadViewModel.width)
                        .keyboardType(.numberPad)
                        .onChange(of: rectangularPadViewModel.width) { rectangularPadViewModel.width = rectangularPadViewModel.width.filter { "0123456789".contains($0) }
                        }
                    
                    TextField("Length", text: $rectangularPadViewModel.length)
                        .keyboardType(.numberPad)
                        .onChange(of: rectangularPadViewModel.length) { rectangularPadViewModel.length = rectangularPadViewModel.length.filter { "0123456789".contains($0) }
                        }
                    
                    TextField("Depth", text: $rectangularPadViewModel.depth)
                        .keyboardType(.numberPad)
                        .onChange(of: rectangularPadViewModel.depth) { rectangularPadViewModel.depth = rectangularPadViewModel.depth.filter { "0123456789".contains($0) }
                        }
                }
                
                Button(action: {
                    rectangularPadViewModel.calculateVolume()
                }) {
                    Text("Calculate Volume")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if let volume = rectangularPadViewModel.volume {
                    Section(header: Text("Volume")) {
                        Text("Volume: \(volume) cubic units")
                    }
                }
            }
            .navigationTitle("Concrete Pad Calculator")
        }
    }
}

