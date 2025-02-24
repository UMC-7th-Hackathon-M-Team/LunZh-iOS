//
//  CustomTabBar.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class CustomTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    
    // 탭 바의 모양을 그리기 위한 Shape Layer를 추가합니다.
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        // 그림자 설정
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3
        
        // 기존의 Shape Layer를 교체하거나 새로운 Shape Layer를 추가합니다.
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        // draw(_:) 메서드가 호출되면 탭 바의 모양을 그리기 위한 Shape Layer를 추가합니다.
        self.addShape()
    }
    
    // 탭 바의 모양을 정의하기 위한 경로를 생성합니다.
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        // 경로를 그립니다.
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0),
                      controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: height),
                      controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // 탭 바의 클립 영역 안에서만 버튼을 탐지할 수 있도록 구현합니다.
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        
        // 서브뷰들을 탭 바의 위에서부터 역순으로 탐색합니다.
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            
            // 버튼을 탐지하면 해당 뷰를 반환합니다.
            guard let result = member.hitTest(subPoint, with: event) else {
                continue
            }
            
            return result
        }
        
        return nil
    }
}
