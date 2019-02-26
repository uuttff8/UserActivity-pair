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
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var targetStepsCounterView: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 22)
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
    var lineBarView: UIView = {
        let view = UIView()
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 2)
        view.backgroundColor = UIColor.blue
        return view
    }()
    let progressBarView: UIProgressView = {
        let view = UIProgressView()
        view.progress = 50
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
        let innerView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70))
        //        innerView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        innerView.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
        innerView.layer.masksToBounds = true
        self.contentView.addSubview(innerView)
        self.contentView.sendSubviewToBack(innerView)
        
        self.contentView.addSubview(dayDateView)
        self.contentView.addSubview(walkCounterView)
        self.contentView.addSubview(aerobicCounterView)
        self.contentView.addSubview(runCounterView)
        
        self.contentView.addSubview(walkLabelView)
        self.contentView.addSubview(aerobicLabelView)
//        self.addSubview(runLabelView)
        
        self.addSubview(targetStepsLabelView)
        self.contentView.addSubview(targetStepsCounterView)
        self.contentView.addSubview(totalStepsCounterView)
        
        self.contentView.addSubview(runLabelView)
        
//        self.addSubview(lineBarView)
//        self.addSubview(progressBarView)
        // Constraints
        
        // Date
        dayDateView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil)
        
        // Walk
        walkCounterView.anchor(top: nil, leading: innerView.leadingAnchor, bottom: walkLabelView.topAnchor, trailing: nil)
        walkLabelView.anchor(top: nil, leading: innerView.leadingAnchor, bottom: innerView.bottomAnchor, trailing: nil)
//        walkLabelView.centerXAnchor.constraint(equalTo: stepsCounterView.centerXAnchor).isActive = true
        
        // Aerobic
          // Label
        aerobicLabelView.anchor(  top: nil, leading: nil, bottom: innerView.bottomAnchor, trailing: nil)
        aerobicLabelView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor).isActive = true
          // Counter
        aerobicCounterView.anchor(top: nil, leading: nil, bottom: aerobicLabelView.topAnchor, trailing: nil)
        aerobicCounterView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor).isActive = true
        
        // Run
        runLabelView.anchor(top: nil, leading: nil, bottom: innerView.bottomAnchor, trailing: innerView.trailingAnchor)
        runCounterView.anchor(top: nil, leading: nil, bottom: runLabelView.topAnchor, trailing: innerView.trailingAnchor)
        
        // Total steps
        targetStepsLabelView.anchor(top: self.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor)
        targetStepsCounterView.anchor(top: targetStepsLabelView.topAnchor, leading: nil, bottom: nil, trailing: targetStepsLabelView.leadingAnchor)
        totalStepsCounterView.anchor(top: targetStepsLabelView.topAnchor, leading: nil, bottom: nil, trailing: targetStepsCounterView.leadingAnchor)
        
        // Line bar
//        lineBarView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil)
//        lineBarView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        lineBarView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
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
}
