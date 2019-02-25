import UIKit
import Foundation
class TargetAlert: UIAlertController {
    

}
extension MainViewController {
    @objc func alertFunction(){
        print(Defaults.targetSteps)
        // 1.
        var targetTextField: UITextField?
        
        // 2.
        let alertController = UIAlertController(
            title: "Target steps",
            message: "Please enter your taret steps",
            preferredStyle: .alert)
        
        // 3.
        let loginAction = UIAlertAction(
        title: "Set", style: .default) {
            (action) -> Void in
            
            if let target = targetTextField?.text {
                if let integer = Int(target) {
                    Defaults.targetSteps = integer
                    for (index, _) in self.cellData.enumerated() {
                        self.cellData[index].stepsTarget = integer
                    }
                    self.myTableView.reloadData()
                }
                
            } else {
                print("No target entered")
                
            }
        }
        
        // 4.
        alertController.addTextField {
            (txtUsername) -> Void in
            targetTextField = txtUsername
            targetTextField!.placeholder = "Write your target steps"
            targetTextField?.keyboardType = UIKeyboardType.numberPad
        }
        
        // 5.
        alertController.addAction(loginAction)
        present(alertController, animated: true, completion: nil)
    }
}
