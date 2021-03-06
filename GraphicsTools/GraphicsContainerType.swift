//
//  GraphicsContainerType.swift
//  GraphicsTools
//
//  Created by James Bean on 6/14/16.
//
//

import QuartzCore

/// Interface for graphical objects that are composites of others.
///
/// > These are assumed to be a `CALayer` or `CAShapeLayer`.
///
/// - TODO: Remove dependency on `Quartz`, use GraphicsTools primitives.
///
public protocol GraphicsContainerType: Buildable, FrameMaking {
    
    // MARK: - Instance Properties
    
    /// Components that need to built and commited
    var components: [CALayer] { get set }
    
    // MARK: - Instance Methods
    
    /// Create the components contained herein.
    func createComponents()
    
    /// Commit the components as sublayers.
    func commitComponents()
}

extension GraphicsContainerType where Self: CALayer {
    
    /// Perform the build phase.
    public func build() {
        print("GraphicsContainerType is deprecated in GraphicsTools 0.6")
        createComponents()
        commitComponents()
        frame = makeFrame()
    }
    
    /// Commit the components as sublayers.
    public func commitComponents() {
        print("GraphicsContainerType is deprecated in GraphicsTools 0.6")
        components.forEach(addSublayer)
    }
}
