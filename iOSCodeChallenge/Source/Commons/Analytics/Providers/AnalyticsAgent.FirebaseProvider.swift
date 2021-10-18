import Firebase
import FirebaseAnalytics

extension AnalyticsAgent
{
    
    struct FirebaseProvider: AnalyticsAgentProvider
    {
        
        // MARK: - Initialization
        //Inicializar provider
        func initProvider()
        {
//            var args = ProcessInfo.processInfo.arguments
//            args.append("-FIRAnalyticsDebugEnabled")
//            args.append("-FIRDebugEnabled")
//            ProcessInfo.processInfo.setValue(args, forKey: "arguments")
            
            FirebaseApp.configure()
        }
        
        func trackScreen(screenName: String, screenClass: String, dataSource: [String:Any])
        {
            var dataSourceSend = dataSource
            dataSourceSend[AnalyticsParameterScreenClass] = screenClass
            dataSourceSend[AnalyticsParameterScreenName] = screenName

            Analytics.logEvent(AnalyticsEventScreenView, parameters: dataSourceSend)
        }
        
        func trackEvent(eventName: String, dataSource: [String:Any])
        {
            Analytics.logEvent(eventName, parameters: dataSource)
        }
    }
    
}
