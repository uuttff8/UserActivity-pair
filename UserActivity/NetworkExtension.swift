import Foundation
struct JSONData: Decodable {
    let aerobic: Int
    let date: Int
    let run: Int
    let walk: Int
}

extension MainViewController {
    func getJSONfromURL() {
        let getURL = URL(string: urlStorage)!
        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        getRequest.httpMethod = "GET"
        getRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        getRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) -> Void in
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
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.jsonData = try decoder.decode([JSONData].self, from: data)
            for i in self.jsonData {
                let result = DayStatistic.init(dayDate: String(i.date), stepsCounter: 1, stepsTarget: 1, walkSteps: i.walk, aerobicSteps: i.aerobic, runSteps: i.run)
                self.cellData.append(result)
            }
            self.tableViewSetup()
        } catch let error {
            print(error)
        }
    }
}
