//
//  ShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

/// Interface for simple path-based shapes.
///
/// - TODO: Remove dependency on `Quartz`, use GraphicsTools primitives.
///
public protocol ShapeType: Buildable, PathMaking, FrameMaking { }

extension ShapeType where Self: CAShapeLayer {
    
    /// Perform the build phase.
    public func build() {
        print("ShapeType is deprecated in GraphicsTools 0.6")
        frame = makeFrame()
        path = makePath()
    }
}
