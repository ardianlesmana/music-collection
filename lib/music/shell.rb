module Music
  class Shell
    EXIT_WORDS = [nil, 'exit', 'quit']
    MESSAGES = {
      'print_result' => 'Unknown command, please try again'
    }

    attr_accessor :result, :input, :executors, :prompt

    def initialize
      @prompt = '> '

      @executors = []
      @executors << Music::Add
      @executors << Music::Show
      @executors << Music::Play
    end

    # Loops shell until user exits
    def loop
      print_line ['Welcome to your music collection!']
      catch(:music_exit) { loop_once while(true) }
      print_line ['Bye!']
    end

    # Runs through one loop iteration: gets input, evals and prints result
    def loop_once
      @input = get_input
      throw(:music_exit) if EXIT_WORDS.include?(@input)
      interpret(@input)
      print_result(@result) unless @input.empty?
    rescue Interrupt
      handle_interrupt
    end

    # Handles interrupt (Control-C) by printing a newline
    def handle_interrupt() puts end

    # Sets @result to result of evaling input and print unexpected errors
    def interpret(input)
      @result = []
      @executors.each do |executor|
        executors_responses = executor.interpret(input)
        @result = @result.concat(executors_responses)
      end
    end

    # @return [String, nil] Prints #prompt and returns input given by user
    def get_input
      print prompt
      (input = $stdin.gets) ? input.chomp : input
    end

    # Prints result using #format_result
    def print_result(result)
      unless result.empty?
        print_line(result)
      else
        print_line([MESSAGES['print_result']])
      end
    end

    # Prints with surrounding lines
    def print_line(arr)
      puts($/, *arr, $/)
    end
  end
end
