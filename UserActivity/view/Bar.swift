import UIKit

class Bar: UIView {
    var shouldSetupConstraints = true
    var title: UILabel!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let textStartX = Int((title.frame.minX))
        let textEndX = Int((title.frame.maxX))
        let midY = Int(self.frame.midY)
        self.drawLine(startX: 8, toEndingX: textStartX - 8, startingY: midY, toEndingY: midY, ofColor: UIColor.white, widthOfLine: 1, inView: self)
        self.drawLine(startX: textEndX + 8, toEndingX: Int(self.frame.maxX) - 8, startingY: midY, toEndingY: midY, ofColor: UIColor.white, widthOfLine: 1, inView: self)
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        title = UILabel()
        self.addSubview(title)
        
        title.textAlignment = .center
        title.textColor = UIColor.white
        title.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            let xConstraint = NSLayoutConstraint(item: title, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: title, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
            self.addConstraints([xConstraint, yConstraint])
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func drawLine(startX: Int, toEndingX endX: Int, startingY startY: Int, toEndingY endY: Int, ofColor lineColor: UIColor, widthOfLine lineWidth: CGFloat, inView view: UIView) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: startX, y: startY))
        path.addLine(to: CGPoint(x: endX, y: endY))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        
        view.layer.addSublayer(shapeLayer)
        
    }
}
