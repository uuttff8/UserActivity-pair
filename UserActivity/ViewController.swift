import UIKit

class MainViewController: UIViewController {
    var myTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    var cellData = [DayStatistic]()
    let urlStorage = API_SECOND_URL
    var jsonData = [JSONData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navbar section
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_aim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(alertFunction))
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_plus")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        title = "Steps"
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        // Get JSON data
        getJSONfromURL()
        // Init cell data section
        view.backgroundColor = UIColor.white
        view.addSubview(myTableView)
        self.myTableView.backgroundColor = .clear
    }
}

extension MainViewController {
    
    func tableViewSetup() {
        let rectFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)        
        myTableView.frame = rectFrame
        myTableView.tableFooterView = UIView()
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.rowHeight = 110
        myTableView.contentInset = UIEdgeInsets(top: 35, left: 0, bottom: 0, right: 0);
//        myTableView.estimatedRowHeight = 500
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        updateLayoutNavAndTable()
        // NOTE: - Registering the cell programmatically
        myTableView.register(TableCell.self, forCellReuseIdentifier: "custom")
    }
}

// MARK: - Table View Delegate
extension MainViewController: UITableViewDelegate {
    
}

// MARK: - Table View Data Source
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "custom") as! TableCell
        cell.walkSteps    = cellData[indexPath.row].walkSteps
        cell.dayDate      = cellData[indexPath.row].dayDate
        cell.stepsCounter = cellData[indexPath.row].stepsCounter
        cell.aerobicSteps = cellData[indexPath.row].aerobicSteps
        cell.runSteps     = cellData[indexPath.row].runSteps
        cell.stepsTarget  = cellData[indexPath.row].stepsTarget
        cell.stepsCounter = cellData[indexPath.row].stepsCounter
        cell.selectionStyle = .none
        
        return cell
    }
}

extension MainViewController {
    func updateLayoutNavAndTable() {
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        myTableView.translatesAutoresizingMaskIntoConstraints = false
                                                                                                //CYKA EBLANY,hate
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        myTableView.bottomAnchor.constraint(equalTo:   view.bottomAnchor,   constant: 0.0).isActive = true
        myTableView.topAnchor.constraint(equalTo:      view.topAnchor,      constant: 0.0).isActive = true
        myTableView.leadingAnchor.constraint(equalTo:  view.leadingAnchor,  constant: 0.0).isActive = true
        
        //myTableView.widthAnchor.constraint(equalToConstant:  view.bounds.width).isActive = true
        //myTableView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        //myTableView.centerYAnchor.constraint(equalTo:        view.centerYAnchor, constant: 0.0).isActive = true
        
        //myTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        (myTableView.contentSize.height > myTableView.frame.size.height) ?
            (myTableView.isScrollEnabled = false) : (myTableView.isScrollEnabled = true)
        

    }
}
