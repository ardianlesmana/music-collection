module Music
  class Shell
    EXIT_WORDS = [nil, 'exit', 'quit']
    MESSAGES = {
      'print_result' => 'Unknown command, please try again'
    }

    attr_accessor :result, :input, :prompt

    def initialize
      @prompt = '> '
    end

    # Loops shell until user exits
    def loop
      catch(:music_exit) { loop_once while(true) }
    end

    # Runs through one loop iteration: gets input, evals and prints result
    def loop_once
      @input = get_input
      throw(:music_exit) if EXIT_WORDS.include?(@input)
      interpret(@input)
      puts @result
    end

    # Sets @result to result of evaling input and print unexpected errors
    def interpret(input)
      @result = []
    end

    # @return [String, nil] Prints #prompt and returns input given by user
    def get_input
      print prompt
      (input = $stdin.gets) ? input.chomp : input
    end
  end
end
