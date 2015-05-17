module Motion; class Command
  class List < Command

    self.summary = 'Show various lists'
    self.arguments = 'SUB-COMMAND'

    HELP_MESSAGE =<<'END'
SUB-COMMAND
  * codesigning  - Show codesignings in Keychain
  * env          - Show environment variables which are able to use in project
  * simulator    - Show simulators
END

    def initialize(argv)
      @sub_command = argv.shift_argument
      super
    end

    def validate!
      super
      help! HELP_MESSAGE unless @sub_command
    end

    def run
      case @sub_command
      when "codesigning"
        show_codesigning
      when "simulator"
        show_simulator
      when "env"
        show_env
      else
        help! HELP_MESSAGE
      end
    end

    def show_codesigning
      system "security find-identity -p codesigning -v"
    end

    def show_simulator
      xcode_dir = `xcode-select -p`.strip
      simctl = File.join(xcode_dir, 'Platforms/iPhoneSimulator.platform/Developer/usr/bin/simctl')
      system "#{simctl} list"
    end

    def show_env
      env = {
        ARR_CYCLES_DISABLE: "Disable the cycle detector in memory management.",
        DISABLE_CAPTURE: "Disable capturing UI view with 'command key + mouse over' in REPL",
        mode: "Build mode. ('development' or 'release')",
        jobs: "Number of concurrent jobs for compilation.",
        background_fetch: "Launch an application for background fetch in the iOS Simulator.",
        skip_build: "Run the app without recompiling.",
        device_name: "Specify iOS simulater device. (ex 'iPad Air')",
        target: "Specify iOS simulater version.",
        install_only: "Just install the app. (ex 'rake device install_only=1')",
        debug: "Launch the debugger.",
        no_continue: "The debugger will not continue to the application. This should be used with 'debug'.",
        output: "Specify output format in testing. (ex 'spec_dox', 'fast', 'test_unit', 'tap' and 'knock')",
        args: "To pass command-line arguments when launching the application. (ex 'rake args=\"-com.apple.CoreData.SQLDebug 1\"')",
      }

      env.sort.each do |k, v|
        puts sprintf("%20s : %s", k, v)
      end
    end
  end
end; end
