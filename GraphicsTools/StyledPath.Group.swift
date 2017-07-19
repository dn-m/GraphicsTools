//
//  StyledPath.Group.swift
//  GraphicsTools
//
//  Created by James Bean on 7/19/17.
//
//

import GeometryTools

extension StyledPath {

    public struct Group {

        public let identifier: String
        public let frame: Rectangle

        public init(_ identifier: String = "root", frame: Rectangle = .zero) {
            self.identifier = identifier
            self.frame = frame
        }

        public func translated(by point: Point) -> Group {
            return Group(identifier, frame: frame.translated(by: point))
        }
    }
}
