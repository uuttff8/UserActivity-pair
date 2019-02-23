import UIKit

class ViewController: UIViewController {
    var myTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    var cellData = [DayStatistic]()
    let urlStorage = "https://intern-f6251.firebaseio.com/intern/metric.json"
    var jsonData = [JSONData]()
    
    let leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "icon_aim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        return barButtonItem
    }()
    let rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "icon_plus")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        return barButtonItem
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Navbar section
        self.title = "Steps"
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        // Get JSON data
        getJSONfromURL()
        // Init cell data section
        view.backgroundColor = UIColor.white
        self.view.addSubview(myTableView)
    }
}

extension ViewController {
    
    func tableViewSetup() {
        myTableView.frame = view.frame
        myTableView.tableFooterView = UIView()
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.rowHeight = 100
//        myTableView.estimatedRowHeight = 500
        myTableView.delegate = self
        myTableView.dataSource = self
        // NOTE: - Registering the cell programmatically
        myTableView.register(TableCell.self, forCellReuseIdentifier: "custom")
    }
    
}

// MARK: - Table View Delegate
extension ViewController: UITableViewDelegate {
    
}

// MARK: - Table View Data Source
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "custom") as! TableCell
        cell.textLabel?.numberOfLines = 0
        cell.walkSteps = cellData[indexPath.row].walkSteps
        cell.dayDate = cellData[indexPath.row].dayDate
        cell.stepsCounter = cellData[indexPath.row].stepsCounter
        cell.aerobicSteps = cellData[indexPath.row].aerobicSteps
        cell.runSteps = cellData[indexPath.row].runSteps
        cell.stepsTarget = cellData[indexPath.row].stepsTarget
        cell.stepsCounter = cellData[indexPath.row].stepsCounter
        return cell
    }
}
