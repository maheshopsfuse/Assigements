import UIKit

class ArcView: UIView {
    override func draw(_ rect: CGRect) {
        let arcLayer = CAShapeLayer()
        let radius = rect.size.width / 2
            /*let radius = rect.size.width / 2
            let lineWidth: CGFloat = 20
            let arcPath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY), radius: radius - lineWidth, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)

            arcLayer.frame = rect
            arcLayer.path = arcPath.cgPath
            arcLayer.lineWidth = lineWidth
            arcLayer.fillColor = UIColor.clear.cgColor
            arcLayer.strokeColor = UIColor.red.cgColor */
        let path = UIBezierPath()
        
        // bottom left
        path.move(to: CGPoint(x: 0, y: bounds.height))
        path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 3 / 2, clockwise: true)
        // top right corner
        path.addArc(withCenter: CGPoint(x: bounds.width - radius, y: radius), radius: radius, startAngle: CGFloat.pi * 3 / 2, endAngle: 0, clockwise: true)
        // bottom right
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        arcLayer.frame = rect
        arcLayer.path = path.cgPath
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = rect
        gradientLayer.colors = [
            UIColor.orange.cgColor,
            UIColor.red.cgColor,
            UIColor.purple.cgColor,
            UIColor.blue.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.layer.addSublayer(gradientLayer)
        gradientLayer.mask = arcLayer
        
        arcLayer.setAffineTransform(CGAffineTransform(rotationAngle: -2.1))
        path.close()
    }
}
