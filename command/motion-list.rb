module Motion; class Command
  class List < Command

    self.summary = 'Show various lists'
    self.arguments = 'SUB-COMMAND'

    HELP_MESSAGE =<<'END'
SUB-COMMAND
  * codesigning  - Show codesignings in Keychain
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
  end
end; end
