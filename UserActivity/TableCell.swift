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
    var targetStepsCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var totalStepsCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var walkCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var aerobicCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var runCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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
    let targetStepsLabelView: UILabel = {
        var textView = UILabel()
        textView.text = "steps"
        return textView
    }()
    
    // Actual
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(dayDateView)
        self.addSubview(walkCounterView)
        self.addSubview(aerobicCounterView)
        self.addSubview(runCounterView)
        
        self.addSubview(walkLabelView)
        self.addSubview(aerobicLabelView)
        self.addSubview(runLabelView)
        
        self.addSubview(targetStepsLabelView)
        self.addSubview(targetStepsCounterView)
        self.addSubview(totalStepsCounterView)
        
        // Constraints
        // Date
        dayDateView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil)
        // Walk
        walkCounterView.anchor(top: nil, leading: nil, bottom: walkLabelView.topAnchor, trailing: nil)
        walkLabelView.anchor(top: nil, leading: nil, bottom: self.bottomAnchor, trailing: nil)
//        walkLabelView.centerXAnchor.constraint(equalTo: stepsCounterView.centerXAnchor).isActive = true
        // Aerobic
        aerobicLabelView.anchor(top: nil, leading: nil, bottom: self.bottomAnchor, trailing: nil)
        aerobicLabelView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        aerobicCounterView.anchor(top: nil, leading: nil, bottom: aerobicLabelView.topAnchor, trailing: nil)
        aerobicCounterView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        // Run
        runLabelView.anchor(top: nil, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
        runCounterView.anchor(top: nil, leading: nil, bottom: runLabelView.topAnchor, trailing: self.trailingAnchor)
        // Total steps
        targetStepsLabelView.anchor(top: self.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor)
        targetStepsCounterView.anchor(top: targetStepsLabelView.topAnchor, leading: nil, bottom: nil, trailing: targetStepsLabelView.leadingAnchor)
        totalStepsCounterView.anchor(top: targetStepsLabelView.topAnchor, leading: nil, bottom: nil, trailing: targetStepsCounterView.leadingAnchor)
        
        
        
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
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
    }
}
