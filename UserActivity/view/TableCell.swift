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
    var lineBarViewWalk: UIProgressView = {
        let view = UIProgressView()
        //view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 2)
        return view
    }()
    
    var lineBarViewAerobic: UIProgressView = {
        let view = UIProgressView()
        //view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 2)
        return view
    }()
   
    var lineBarViewRun: UIProgressView = {
        let view = UIProgressView()
        //view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 2)
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
        
        self.contentView.addSubview(lineBarViewWalk)
        self.contentView.addSubview(lineBarViewAerobic)
        self.contentView.addSubview(lineBarViewRun)
        

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
        // TODO: make working layout for ProgressBar
        lineBarViewWalk.centerYAnchor.constraint(equalTo: innerView.centerYAnchor).isActive = true
        lineBarViewWalk.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20).isActive = true
        lineBarViewWalk.trailingAnchor.constraint(equalTo: lineBarViewAerobic.leadingAnchor, constant: -10).isActive = true
        lineBarViewWalk.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        lineBarViewAerobic.centerYAnchor.constraint(equalTo:  innerView.centerYAnchor).isActive = true
        lineBarViewAerobic.leadingAnchor.constraint(equalTo:  lineBarViewWalk.trailingAnchor, constant: 10).isActive = true
        lineBarViewAerobic.trailingAnchor.constraint(equalTo: lineBarViewRun.leadingAnchor, constant: -10).isActive = true
        lineBarViewAerobic.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        lineBarViewRun.centerYAnchor.constraint(equalTo: innerView.centerYAnchor).isActive = true
        lineBarViewRun.leadingAnchor.constraint(equalTo: lineBarViewAerobic.leadingAnchor, constant: 20).isActive = true
        lineBarViewRun.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20).isActive = true
        lineBarViewRun.heightAnchor.constraint(equalToConstant: 2).isActive = true
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
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderHeight / 2, width: self.frame.size.width, height: borderHeight)
        self.layer.addSublayer(border)
    }
}


extension TableCell {
    /*func addProgressLine() {
        
        let totalSteps = walk + run + aerobic
        
//        let divideWalk: Float = totalSteps / walk
//        let divideAerobic: Float = totalSteps / aerobic
//        let divideRun:  Float = totalSteps / run
//        
        lineBarViewWalk.progress = 1.0
        lineBarViewRun.progress  = 1.0
        lineBarViewAerobic.progress = 1.0
        
        let procentWalk = walk * 100 / totalSteps
        let procentRun  = run  * 100 / totalSteps
        let procentAerobic = aerobic * 100 / totalSteps
        
        let frameWidthWalk = CGRect(x: 0, y: 0, width: Int(procentWalk), height: 2)
        let frameWidthRun = CGRect(x: 0, y: 0, width: Int(procentRun), height: 2)
        let frameWidthAerobic = CGRect(x: 0, y: 0, width: Int(procentAerobic), height: 2)
        
        lineBarViewWalk.frame = frameWidthWalk
        lineBarViewRun.frame  = frameWidthRun
        lineBarViewAerobic.frame = frameWidthAerobic
        
        lineBarViewWalk.progressTintColor = UIColor.red
        lineBarViewRun.progressTintColor  = UIColor.blue
        lineBarViewAerobic.progressTintColor = UIColor.black
        // TODO make calculate and like
        /* walk = 75%
           aero = 20%
           run  = 5%      AND
 
        ========================
        ^ walk         ^ aero ^ run
       */
    }*/
    
    func getSteps(walk: Float, run: Float, aerobic: Float) -> (walk: Float, run: Float, aerobic: Float) {
        return (walk: walk, run: run, aerobic: aerobic)
    }
}
