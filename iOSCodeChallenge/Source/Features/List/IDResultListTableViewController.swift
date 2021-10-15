import UIKit

class IDResultListTableViewController: UITableViewController
{
    
    // MARK: - Properties
    private let resultListURL = URL(string: "https://www.mocky.io/v3/364d4f62-c183-4f12-ba16-49bfc5c820ab")!
    private var results: IDResultsModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setUpView()

        fetchResults()
    }
    
    @objc func pullRefreshTable()
    {
        fetchResults()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let results = results else { return 0 }
        
        return results.elementList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDResultListTableViewCell", for: indexPath) as! IDResultListTableViewCell
        let elementCell = results!.elementList[indexPath.row]
        cell.fill(withResult: elementCell)

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let results = results, results.elementList.count > indexPath.row {
            self.navigationController?.pushViewController(AppModules.createDetail(item: results.elementList[indexPath.row]), animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
    }
}

private extension IDResultListTableViewController
{
    
    func setUpView()
    {
        title = R.string.titleList^
        
        //Configure tableview
        let nib = UINib(nibName: String(describing: IDResultListTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "IDResultListTableViewCell")
        tableView.estimatedRowHeight = 240.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        //Set logic to refresh
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.clear
        refreshControl?.tintColor = UIColor.black
        
        refreshControl?.attributedTitle = NSMutableAttributedString(string: R.string.pullToRefreshTable^)
        
        refreshControl?.addTarget(self, action: #selector(IDResultListTableViewController.pullRefreshTable), for: UIControl.Event.valueChanged)
    }
    
    func checkRefreshControl()
    {
        //Set end refreshControl
        if let refreshC = refreshControl, refreshC.isRefreshing {
            refreshControl?.endRefreshing()
        }
    }
    
    func fetchResults()
    {
        var urlRequest = URLRequest(url: resultListURL)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let data = data, error == nil {
                let jsonDecoder = JSONDecoder()
                if let results = try? jsonDecoder.decode(IDResultsDTO.self, from: data) {
                    DispatchQueue.main.async {
                        self.didObtain(results: IDResultsModel.mapperToIDResultsDTO(idResultsDTO: results))
                    }
                }
            } else if let _ = error { }
            
            DispatchQueue.main.async {
                self.checkRefreshControl()
            }
        }.resume()
    }
    
    func didObtain(results: IDResultsModel)
    {
        self.results = results
        tableView.reloadData()
    }
}
