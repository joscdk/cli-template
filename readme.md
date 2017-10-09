# Vapor CLI Template

A small template for creating a CLI script with Vapor. For now it's very basic, might be updated with more examples later.

## Getting started

Start by creating a new Vapor project

```
vapor new hello-cli --template=joscdk/cli-template
```

Then build the project (If you want, you can change the version in `Sources/Executable/main.swift`)

```
swift build
```

Then it shows the command to run e.g.:

```
./.build/x86_64-apple-macosx10.10/debug/Executable --help
```

<img src="https://user-images.githubusercontent.com/2535140/31347252-bc986340-ace9-11e7-86d1-54f2b8ef0120.png" />

and run a command:

```
./.build/x86_64-apple-macosx10.10/debug/Executable test-command
```

<img src="https://user-images.githubusercontent.com/2535140/31347336-fece9d74-ace9-11e7-9c26-99cbfb06b1b2.png" />

## Building your own commands

To build a command, start by creating a class in e.g. `Sources/App/MyCustomCommand.swift`

```
import Console
import Foundation

public final class MyCustomCommand: Command {
    public let id = "my-custom-command"

    public let help: [String] = [
        "Example of a Custom CLI command"
    ]

    public let console: ConsoleProtocol

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
	do {
            let result = try console.backgroundExecute(
                program: "ls",
                arguments: [
			"-la"
                ]
            )
            console.info(result)
        } catch ConsoleError.backgroundExecute(_, _, output: let error) {
            console.error(error)
        }
    }
}
```

This will create a command listening for the command `my-custom-command`, and will run `ls -la` in the folder, and show the output of the command.

Add `MyCustomCommand(console: terminal),` in `main.swift` inside `try terminal.run(executable: executable, commands: [`

And rebuild your project. Then you should see something like this:

<img src="https://user-images.githubusercontent.com/2535140/31347618-e36870f4-acea-11e7-9a1b-3293cd5dc456.png" />
