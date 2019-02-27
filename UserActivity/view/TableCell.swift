import UIKit

class TableCell: UITableViewCell {
    
    var dayDate: String?
    var stepsCounter: Int?
    var stepsTarget: Int?
    var walkSteps: Int?
    var aerobicSteps: Int?
    var runSteps: Int?
    
    var dayDateView: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var totalStepsCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var targetStepsCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let targetStepsLabelView: UILabel = {
        var textView = UILabel()
        textView.text = "steps"
        return textView
    }()
    var walkCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var aerobicCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var runCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var lineBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 10, height: 2)
        return view
    }()
   
    let walkLabelView: UILabel = {
        var textView = UILabel()
        textView.text = "walk"
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    let aerobicLabelView: UILabel = {
        var textView = UILabel()
        textView.text = "aerobic"
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    let runLabelView: UILabel = {
        var textView = UILabel()
        textView.text = "run"
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    // Actual
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let innerView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 90))
        innerView.addTopBorder(borderColor: UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.0), borderHeight: 0.5)
        innerView.addBottomBorder(borderColor: UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.0), borderHeight: 0.5)
        // Product color below
        innerView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
//        innerView.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
        innerView.layer.masksToBounds = true
        self.contentView.addSubview(innerView)
        self.contentView.sendSubviewToBack(innerView)
        
        self.contentView.addSubview(dayDateView)
        self.contentView.addSubview(walkCounterView)
        self.contentView.addSubview(aerobicCounterView)
        self.contentView.addSubview(runCounterView)
        
        self.contentView.addSubview(walkLabelView)
        self.contentView.addSubview(aerobicLabelView)
        
        self.contentView.addSubview(targetStepsLabelView)
        self.contentView.addSubview(targetStepsCounterView)
        self.contentView.addSubview(totalStepsCounterView)
        
        self.contentView.addSubview(runLabelView)
        self.contentView.addSubview(lineBarView)
        

        // Constraints        
        // Date
        dayDateView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil)
        
        // Walk
        walkCounterView.anchor(top: nil, leading: nil, bottom: walkLabelView.topAnchor, trailing: nil)
        walkCounterView.centerXAnchor.constraint(equalTo: walkLabelView.centerXAnchor, constant: 0.0).isActive = true
        walkLabelView.anchor(top: nil, leading: innerView.leadingAnchor, bottom: innerView.bottomAnchor, trailing: nil, padding: 45)
//        walkLabelView.centerXAnchor.constraint(equalTo: stepsCounterView.centerXAnchor).isActive = true
        
        // Aerobic
          // Label
        aerobicLabelView.anchor(  top: nil, leading: nil, bottom: innerView.bottomAnchor, trailing: nil)
        aerobicLabelView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor).isActive = true
          // Counter
        aerobicCounterView.anchor(top: nil, leading: nil, bottom: aerobicLabelView.topAnchor, trailing: nil)
        aerobicCounterView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor).isActive = true
        
        // Run
        runLabelView.anchor(top: nil, leading: nil, bottom: innerView.bottomAnchor, trailing: innerView.trailingAnchor, padding: 45)
        runCounterView.anchor(top: nil, leading: nil, bottom: runLabelView.topAnchor, trailing: nil)
        runCounterView.centerXAnchor.constraint(equalTo: runLabelView.centerXAnchor, constant: 0.0).isActive = true
        
        // Total steps
        targetStepsLabelView.anchor(top: self.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor)
        targetStepsCounterView.anchor(top: targetStepsLabelView.topAnchor, leading: nil, bottom: nil, trailing: targetStepsLabelView.leadingAnchor, padding:  0.0)
        totalStepsCounterView.anchor(top: targetStepsLabelView.topAnchor, leading: nil, bottom: nil, trailing: targetStepsCounterView.leadingAnchor, padding: 0.0)
        
        // Line bar
//        lineBarView.centerXAnchor.constraint(equalTo: aerobicLabelView.centerXAnchor).isActive = true
//        lineBarView.anchor(top: dayDateView.bottomAnchor, leading: innerView.leadingAnchor, bottom: nil, trailing: innerView.trailingAnchor)
        lineBarView.centerYAnchor.constraint(equalTo: innerView.centerYAnchor).isActive = true
        lineBarView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20).isActive = true
        lineBarView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20).isActive = true
        lineBarView.heightAnchor.constraint(equalToConstant: 2).isActive = true
//        lineBarView.anchor(top: dayDateView.bottomAnchor, leading: innerView.leadingAnchor, bottom: walkCounterView.topAnchor, trailing: nil)
//        lineBarView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let dDate = dayDate {
            dayDateView.text = dDate
        }
        if let sCounter = walkSteps {
            walkCounterView.text = "\(sCounter)"
        }
        if let aCounter = aerobicSteps {
            aerobicCounterView.text = "\(aCounter)"
        }
        if let rCounter = runSteps {
            runCounterView.text = "\(rCounter)"
        }
        if let tsCounter = stepsTarget {
            targetStepsCounterView.text = " / \(tsCounter) "
        }
        if let totalsCounter = stepsCounter {
            totalStepsCounterView.text = "\(totalsCounter)"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: CGFloat = 20.0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: 0).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: 0).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding).isActive = true
        }
    }
    
    func addTopBorder(borderColor: UIColor, borderHeight: CGFloat) {
        let border = CALayer()
        border.backgroundColor = borderColor.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: borderHeight)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorder(borderColor: UIColor, borderHeight: CGFloat) {
        let border = CALayer()
        border.backgroundColor = borderColor.cgColor
//        border.frame = CGRect(x:0, y:0, width: borderWidth, height: self.frame.size.height)
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderHeight, width: self.frame.size.width, height: borderHeight)
        self.layer.addSublayer(border)
    }
}

