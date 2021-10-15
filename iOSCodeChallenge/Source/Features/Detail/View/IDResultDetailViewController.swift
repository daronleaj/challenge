import UIKit

class IDResultDetailViewController: UIViewController
{
    // MARK: Properties
    var presenter: IDResultDetailPresenter?
    
    // MARK: IBOutlets
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
        
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
    
    @objc func userClickBack(sender: UIBarButtonItem) {
        presenter?.userClickGoBack()
    }
}

extension IDResultDetailViewController: IDResultDetailView
{
    func setTitle(title: String) {
        self.title = title
    }
}


// MARK: UICollectionViewDataSource
extension IDResultDetailViewController: UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension IDResultDetailViewController: UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {

        return CGSize(width: 80, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    
}

// MARK: - Private Methods
private extension IDResultDetailViewController
{
    
    func setUpView ()
    {
        //Change back button
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "bt_back"), style: .plain, target: self, action: #selector(userClickBack(sender:)))
        
        //Init images CollectionView


        self.imagesCollectionView.dataSource = self
        self.imagesCollectionView.delegate = self
        
    }
}
