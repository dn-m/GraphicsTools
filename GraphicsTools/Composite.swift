//
//  Composite.swift
//  GraphicsTools
//
//  Created by James Bean on 7/25/17.
//
//

import Collections
import GeometryTools

public typealias Composite = Tree<Group,Item>

// TODO: Use extension StyledPath.Composite when Swift allows it.
extension Tree where Branch == Group, Leaf == Item {

    public var frame: Rectangle {
        switch self {
        case .leaf(let styledPath):
            return styledPath.frame
        case .branch(let group, _):
            return group.frame
        }
    }

    public var resizedToFitContents: Composite {

        switch self {

        case .leaf(let item):
            let resized = item.resizedToFitContents
            return .leaf(resized.translated(by: -item.frame.origin))

        case let .branch(group, trees):
            let frame: Rectangle = trees.map { $0.frame }.nonEmptySum ?? .zero
            let group = Group(group.identifier, frame: frame)
            return .branch(group, trees.map { $0.translated(by: -frame.origin) })
        }
    }

    public var axisAlignedBoundingBox: Rectangle {

        switch self {

        // Encapsulate in Item
        case .leaf(let item):
            switch item {
            case .path(let styledPath):
                return styledPath.path
                    .axisAlignedBoundingBox
                    .translated(by: -item.frame.origin)
            case .text:
                fatalError()
            }

        case let .branch(group, trees):
            let bbox = trees.map { $0.axisAlignedBoundingBox }.nonEmptySum ?? .zero
            return bbox.translated(by: -group.frame.origin)
        }
    }

    public func translated(by point: Point) -> Composite {
        switch self {
        case let .leaf(styledPath):
            return .leaf(styledPath.translated(by: point))
        case let .branch(group, trees):
            // TODO: Group.translated(by: Point)
            let group = Group(group.identifier, frame: group.frame.translated(by: point))
            return .branch(group, trees)
        }
    }
}
