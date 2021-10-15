
final class IDResultDetailPresenterImpl {
    
    //MARK: - View
    var view: IDResultDetailView?
    
    //MARK: - Interactor
    var interactor: IDResultDetailInteractor?
    
    //MARK: - Router
    var router: IDResultDetailRouter?
    
    //MARK: - Var
    private var item: IDResultModel

    init(item: IDResultModel) {
        self.item = item
    }
}

// MARK: - Presenter methods
extension IDResultDetailPresenterImpl: IDResultDetailPresenter {
    
    func viewDidLoad() {
        view?.setTitle(title: item.getTitle())
    }
    
    func viewWillAppear() {
        //Nothing to do here
    }
    
    func viewDidAppear() {
        //Nothing to do here
    }
    
    func userClickGoBack() {
        self.router?.goBack()
    }
    
}

// MARK: - IDResultDetailInteractorCallback methods
extension IDResultDetailPresenterImpl: IDResultDetailInteractorCallback {
}
