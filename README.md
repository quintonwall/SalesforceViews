# SalesforceViews
SalesforceViews is a collection of ready-to-go Nibs and Storyboards for Salesforce Standard Objects. The intent is to get you up and running with a UI, which you can theme and customize, in the shortest possible time.

This project is still WIP. It is stable, but still pretty limited in functionality. Consider SalesforceViews as an ALPHA release.


## Installation
Cocoapods is coming once the project reaches beta.

## Getting Started
At a very high level, Salesforce Mobile development tasks can be bucketed into authentication, data binding, and UI. SalesforceViews provides support for UI, but relies on the developer to provide the authentication and data bound objects, in the form of [SObjectKit](https://github.com/quintonwall/SObjectKit) objects. This separation is intentional as this allows the developer to choose whichever approach ([MobileSDK](https://github.com/forcedotcom/SalesforceMobileSDK-iOS), [SwiftlySalesforce](https://github.com/mike4aday/SwiftlySalesforce), etc) to connecting to Salesforce. The sample app, and examples below use SwiftlySalesforce.

### Connect To Your Existing Storyboard
To add a reference to a SalesforceView, do the following:

#### 1. Add Storyboard Reference
Drag and drop a Storyboard Reference component onto your storyboard.

<img src="https://github.com/quintonwall/SalesforceViews/blob/master/graphics/screenshots/storyboard-reference.png?raw=true" width=270/>

#### 2. Configure the component
Configure the Storyboard Reference with the  SalesforceView you want (eg: Account). Give it an identifier in the form of <pre>[objecttype]List</pre> eg: AccountList

<img src="https://github.com/quintonwall/SalesforceViews/blob/master/graphics/screenshots/storyboard-account.png?raw=true" width=270/>


#### 3. Create a seque to Storyboard Reference
Create a seque to your new storyboard reference and give it a name like ShowAccounts. Your final storyboard will look something like this.

<img src="https://github.com/quintonwall/SalesforceViews/blob/master/graphics/SalesforceViews.png?raw=true" width=270/>

### Populate your View
SalesforceViews relies on SObjectKit objects for its data binding. Once you have fetched the data, all you need to do is post it to the iOS Notification Center and the appropriate SalesforceView will handle the rest. The example below demonstrates how to use Swiftly Salesforce and SObjectKit to fetch and map data after a button tap, and then post to the NotificationCenter for Account views, and navigate to the view.

```swift

@IBAction func AccountButtonTapped(_ sender: UIButton) {

       var data : [Account]?

       first {
               salesforce.identity()
           }.then { userInfo in
               salesforce.query(soql: Account.soqlGetAllFields(nil))
            }.then {
               (result: QueryResult) -> () in
                data = Account.populateToCollection(result.records as NSArray) as? [Account]

               //show the storyboard

               let storyboard = UIStoryboard(name: "Accounts", bundle: nil)
               let controller = storyboard.instantiateViewController(withIdentifier: "AccountsList") as! UINavigationController
               self.present(controller, animated: true, completion: nil)


               NotificationCenter.default.post(name: NSNotification.Name(rawValue: ViewNotifications.accountList), object: data)

           }.catch { error in
               _ = error as! SalesforceError
               print(error)
           }
   }
```
That's it! That's all you need to do to have native UI screens for Salesforce.

## Themes
SalesforceViews also supports themes to allow you to quickly customize colors and fonts. Three sample themes, Terminal, BumbleBee, and Chalkboard are included, and can be used by adding the following line to your app, either view the AppDelegate, or bound to a selector/button/etc for in-app configuration.

```swift
ThemeManager.shared.set(newtheme: TerminalTheme())
```

<img src="https://github.com/quintonwall/SalesforceViews/blob/master/graphics/screenshots/account-detail-no-theme.png?raw=true" width=270/>
<img src="https://github.com/quintonwall/SalesforceViews/blob/master/graphics/screenshots/account-detail-themed.png?raw=true" width=270/>

###Creating your own themes
Creating your own themes is easy. Simply create a new class which implements the Theme protocol. The TerminalTheme below is an example.

```swift
class TerminalTheme: Theme {

    var mainColor : UIColor { return .midnightBlueColor() }

    var secondaryColor: UIColor { return .wisteriaColor() }

    var labelFont: UIFont { return UIFont(name: "Courier", size: 16)! }

    var labelFontColor: UIColor { return UIColor.white }

    var headerFont: UIFont { return UIFont(name: "Courier", size: 20)! }

    var headerFontColor: UIColor { return .pumpkinColor()}

    var navigationBarColor: UIColor { return .belizeHoleColor() }

    var navigationBarFontColor : UIColor { return .cloudsColor() }

    var navigationBarFont : UIFont { return UIFont(name: "Courier", size: 22)! }

    var selectedItemColor : UIColor { return .wisteriaColor() }

}
```
