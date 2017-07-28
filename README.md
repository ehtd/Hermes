# Hermes
iOS Simple Network Framework

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

The idea behind this framework is to make it easy to fetch content from the network without having to import a huge set of dependencies (aka AlamoFire, AFNetworking, RestKit, etc...)

## How do I use it
The main item to use is the `Fetcher` in the `Fetcher.swift` file. Its only responsability is to fetch data from an end-point.

1. `init` with a `URLSession` and an `API end-point`:
2. `fetch` content from a `segment`

### Example:
Gist "https://gist.github.com/ehtd/4606eba95ef43965251617e1290a159d.js"

```swift
// Import Hermes module
import Hermes
.
.
.

// Keep in class scope
fileprivate let fetcher: Fetcher

init() {
  // Session can be provided externally and shared among
  // multiple fetchers in case your fetchers may need to share cached content 
  // or share the same session cache rules.
  let session = URLSession(configuration: URLSessionConfiguration.default)
  
  // Useful to separate the end-point from segments for example when using 
  // development APIs that share the same segment, but different end-point.
  let endpoint = "https://hacker-news.firebaseio.com/v0/"

  // Init
  fetcher = Fetcher(with: session, apiEndPoint: endpoint)
}

func getContent() {
  // With this segment, the final resolved path will be:
  // "https://hacker-news.firebaseio.com/v0/topstories.json"
  let segment = "topstories.json"
  
  // Call fetch
  fetcher.fetch(segment, success: { (response) in
    // Content retrieved
    print(response)
  }, error: { (error) in
    // Something failed
    print(error)
  })
}
```

Take a look at `FetcherTests.swift` for more examples on how to use it.

### Using with Carthage
1. Create a `cartfile` with the content:
```
github "https://github.com/ehtd/Hermes" ~> 1.0
```

2. Add Copy framework phase to your target

    Shell: `/usr/local/bin/carthage copy-frameworks`

    Input files:`$(SRCROOT)/Carthage/Build/iOS/Hermes.framework`

    Output files:`$(DERIVED_FILE_DIR)/Hermes.framework`


Check [Carthage](https://github.com/Carthage/Carthage) for additional setup information.

