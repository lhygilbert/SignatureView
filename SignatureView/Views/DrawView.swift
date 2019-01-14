//
//  DrawView.swift
//  SignatureView
//
//  Created by Gilbert Lo on 1/13/19.
//  Copyright © 2019 Gilbert Lo. All rights reserved.
//

import UIKit

class DrawView: UIView {
    typealias Line = [CGPoint]
    
    private var lines = [Line]()
    var strokeColor: UIColor = .black
    var strokeWidth: CGFloat = 3
    var lineCap: CGLineCap = .square
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .white
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineCap(lineCap)
        context.setLineWidth(strokeWidth)
        context.setStrokeColor(strokeColor.cgColor)
        
        for line in lines {
            for point in line {
                if point == line.first {
                    // Move to the first point
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self),
            var lastLine = lines.popLast() else { return }
                
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    func captureImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image { context in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
    
}
