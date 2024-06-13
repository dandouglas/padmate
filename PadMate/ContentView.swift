//
//  ContentView.swift
//  PadMate
//
//  Created by Daniel Douglas on 13/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let service = RectangularPadService()
        let viewModel = RectangularPadViewModel(rectangularPadService: service)
        RectangularFormView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

