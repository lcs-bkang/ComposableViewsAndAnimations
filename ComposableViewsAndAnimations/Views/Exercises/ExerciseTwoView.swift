//
//  ExerciseTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseTwoView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"

    // Whether to apply the animation
    @State private var useAnimation = true
    
    // Controls color of text
    @State private var hue: Color = .red

    // MARK: Computed properties

    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text(typeFace)
                    .foregroundColor(hue)
                    .font(.custom(typeFace, size: 30.0))
                    .onTapGesture {
                        withAnimation(.default) {
                                hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                            saturation: 0.8,
                                            brightness: 0.8)
                        }
                    }
            }
            .navigationTitle("Exercise 2")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwoView(showThisView: .constant(true))
    }
}
