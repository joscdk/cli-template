import Console

public final class Version: Command {
    public let id = "version"

    public let help: [String] = [
            "Displays App version"
    ]

    public let console: ConsoleProtocol
    public let version: String

    public init(console: ConsoleProtocol, version: String) {
        self.console = console
        self.version = version
    }

    public func run(arguments: [String]) throws {
        console.print("Vapor Cloud deploy: ", newLine: false)
        console.success("\(version)")
    }
}
