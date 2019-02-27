import Foundation

extension MainViewController {
    func getJSONfromURL() {
        let getURL = URL(string: urlStorage)!
        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        getRequest.httpMethod = "GET"
        getRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        getRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        handleJsonData(getRequest)

    }
    
    func handleJsonData(_ Request: URLRequest) {
        URLSession.shared.dataTask(with: Request, completionHandler: { (data, response, error) -> Void in
            if error != nil { print("GET Request: Communication error: \(error!)") }
            if data != nil {
                do {
                    DispatchQueue.main.async(execute: {
                        self.parseJSON(data: data!)
                    })
                } catch {
                    DispatchQueue.main.async(execute: {
                        print("Unable to parse JSON response")
                    })
                }
            } else {
                DispatchQueue.main.async(execute: {
                    print("Received empty response.")
                })
            }
            
        }).resume()
    }
    
    func parseJSON(data: Data){
        let tableCell = TableCell()
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.jsonData = try decoder.decode([JSONData].self, from: data)
            for i in self.jsonData {
                // stepsTarget забирать из UserDefaults
                let result = DayStatistic.init(dayDate: decodeDateTime(date: i.date), stepsCounter: i.walk + i.aerobic + i.run, stepsTarget: Defaults.targetSteps, walkSteps: i.walk, aerobicSteps: i.aerobic, runSteps: i.run)
                tableCell.addProgressLine(walk: i.walk, run: i.run, aerobic: i.aerobic)
                self.cellData.append(result)
            }
            self.tableViewSetup()
        } catch let error {
            print(error)
        }
    }
    func decodeDateTime(date: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yyyy")
        let dateTime = Date(milliseconds: date)
        return dateFormatter.string(from: dateTime)
    }
}
extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
        //RESOLVED CRASH HERE
    }
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}

