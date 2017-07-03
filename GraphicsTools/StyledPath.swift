//
//  StyledPath.swift
//  GraphicsTools
//
//  Created by James Bean on 6/18/17.
//
//

import GeometryTools
import PathTools

public struct StyledPath {
    
    public let frame: Rectangle
    public let path: Path
    public let styling: Styling
    
    public init(
        frame: Rectangle = .zero,
        path: Path = .unit,
        styling: Styling = Styling()
    )
    {
        self.frame = frame
        self.path = path
        self.styling = styling
    }
}

extension StyledPath {

    public var resizedToFitContents: StyledPath {
        let frame = path.axisAlignedBoundingBox
        return StyledPath(
            frame: frame,
            path: path.translated(by: -frame.origin),
            styling: styling
        )
    }

    public func translated(by point: Point) -> StyledPath {
        return StyledPath(frame: frame.translated(by: point), path: path, styling: styling)
    }

    public func scaled(by value: Double) -> StyledPath {

        let fill = styling.fill
        let stroke = styling.stroke

        let newStroke = Stroke(
            width: stroke.width * value,
            color: stroke.color,
            join: stroke.join,
            cap: stroke.cap,
            dashes: stroke.dashes
        )

        let newStyle = Styling(fill: fill, stroke: newStroke)

        return StyledPath(frame: frame, path: path.scaled(by: value), styling: newStyle)
    }
}

extension StyledPath: CustomStringConvertible {

    public var description: String {
        var result = "StyledPath:\n"
        result += "Frame: \(frame)\n"
        result += "\(path)\n"
        result += "\(styling)"
        return result
    }
}
