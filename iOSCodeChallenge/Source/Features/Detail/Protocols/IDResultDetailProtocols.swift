import UIKit

// MARK: - View
protocol IDResultDetailView {
    
    var presenter: IDResultDetailPresenter? { get set }
    
    func setTitle(title: String)
}

// MARK: - Presenter
protocol IDResultDetailPresenter {
    
    var view: IDResultDetailView? { get set }
    var interactor: IDResultDetailInteractor? { get set }
    var router: IDResultDetailRouter? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    
    func userClickGoBack()
}

// MARK: - Interactor
protocol IDResultDetailInteractorCallback {
}

protocol IDResultDetailInteractor {
    
     var presenter: IDResultDetailInteractorCallback? { get set }
}

// MARK: - Router
protocol IDResultDetailRouter {
    
    func goBack()
}
