//
//  RectangularForm.swift
//  PadMate
//
//  Created by Daniel Douglas on 13/06/2024.
//

import Foundation
import SwiftUI

struct RectangularFormView: View {
    @StateObject private var viewModel: RectangularPadViewModel

    init(viewModel: RectangularPadViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Distance Measurements")) {
                    TextField("Width", text: $viewModel.width)
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.width) { viewModel.width = viewModel.width.filter { "0123456789".contains($0) }
                        }
                    
                    TextField("Length", text: $viewModel.length)
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.length) { viewModel.length = viewModel.length.filter { "0123456789".contains($0) }
                        }
                    
                    TextField("Depth", text: $viewModel.depth)
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.depth) { viewModel.depth = viewModel.depth.filter { "0123456789".contains($0) }
                        }
                }
                
                Button(action: {
                    viewModel.calculateVolume()
                }) {
                    Text("Calculate Volume")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if let volume = viewModel.volume {
                    Section(header: Text("Volume")) {
                        Text("Volume: \(volume) cubic units")
                    }
                }
            }
            .navigationTitle("Concrete Pad Calculator")
        }
    }
}

