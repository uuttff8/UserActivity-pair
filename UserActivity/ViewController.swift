import UIKit

class MainViewController: UIViewController {
    var myTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    var cellData = [DayStatistic]()
    let urlStorage = API_MAIN_URL
    var jsonData = [JSONData]()
    
    // Stored Properties
    let leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "icon_aim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(alertFunction))
        return barButtonItem
    }()
    
    let rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "icon_plus")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        return barButtonItem
    }()
    
    let buttonView: UIButton = {
        let callAlert = UIButton(type: .roundedRect)
        callAlert.frame = CGRect(x: 180, y: 600, width: 100, height: 100)
        callAlert.setTitle("Button", for: .normal)
        callAlert.addTarget(self, action: #selector(alertFunction), for: .touchDown)
        return callAlert
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Navbar section
        title = "Steps"
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        // Get JSON data
        getJSONfromURL()
        // Init cell data section
        view.backgroundColor = UIColor.white
        view.addSubview(myTableView)
        view.addSubview(buttonView)
    }
}

extension MainViewController {
    
    func tableViewSetup() {
        let rectFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)        
        myTableView.frame = rectFrame
        myTableView.tableFooterView = UIView()
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.rowHeight = 100
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
        cell.textLabel?.numberOfLines = 0
        cell.walkSteps    = cellData[indexPath.row].walkSteps
        cell.dayDate      = cellData[indexPath.row].dayDate
        cell.stepsCounter = cellData[indexPath.row].stepsCounter
        cell.aerobicSteps = cellData[indexPath.row].aerobicSteps
        cell.runSteps     = cellData[indexPath.row].runSteps
        cell.stepsTarget  = cellData[indexPath.row].stepsTarget
        cell.stepsCounter = cellData[indexPath.row].stepsCounter
        return cell
    }
}

extension MainViewController {
    func updateLayoutNavAndTable() {
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
                                                                                                //CYKA EBLANY,hate
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0  ).isActive = true
        myTableView.bottomAnchor.constraint(equalTo:   view.bottomAnchor,   constant: 0.0  ).isActive = true
        myTableView.topAnchor.constraint(equalTo:      view.topAnchor,      constant: 150.0).isActive = true
        myTableView.leadingAnchor.constraint(equalTo:  view.leadingAnchor,  constant: 0.0  ).isActive = true
        
        //myTableView.widthAnchor.constraint(equalToConstant:  view.bounds.width).isActive = true
        //myTableView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        //myTableView.centerYAnchor.constraint(equalTo:        view.centerYAnchor, constant: 0.0).isActive = true
        
        //myTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        (myTableView.contentSize.height < myTableView.frame.size.height) ?
            (myTableView.isScrollEnabled = false) : (myTableView.isScrollEnabled = true)

        
        
        myTableView.backgroundColor = .red
    }
}
