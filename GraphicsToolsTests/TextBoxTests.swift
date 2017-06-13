//
//  TextBoxTests.swift
//  GraphicsTools
//
//  Created by James Bean on 6/13/17.
//
//

import XCTest
import GraphicsTools

class TextBoxTests: XCTestCase {
    
    func testInit() {
        
        let textBox = TextBox(
            text: "109",
            font: "Baskerville-SemiBold",
            textColor: Color.red,
            borderWidth: 1,
            borderColor: Color.blue,
            backgroundColor: Color.green,
            height: 100,
            insets: Insets(10)
        )
        
        let layer = CALayer(textBox)
        layer.renderToPDF(name: "textBox")
    }
}
