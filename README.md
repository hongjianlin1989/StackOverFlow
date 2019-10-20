Language: Swift 5
Tool: Xcode 11.0
Design Patten: MVVM

Network:
PromiseKit 6.0
Alamofire 4.7

Decoding: 
JSONDecoder

Network Notes:

ApiCallRouters: a place for creating more Router if there are more API get involved into project.
RequestData: allowing developer to specify request endpoint, method, params, add more specification as needs.
ApiRequest: a place for building the Alamofire URLRequest
NetworkDispatcher: Alamofire network request happens here.


UI Design Notes:

Storyboard: Only contains VC and tableview.
Nib: all cells are Nib file, purpose of avoiding storyboard merge conflict.
ViewModel: create Viewmodel for each VC, and each cells. 
Cell height should be full automated