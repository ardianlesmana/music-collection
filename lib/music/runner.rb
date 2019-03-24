module Music
  class Runner

    def self.run(argv=[])
      parse_options(argv)
      Music.shell.loop
    end

    module Helpers
      def parse_options(argv)
        if argv[0] =~ /^-/
          case argv.shift
          when '-v', '--version' then puts(Music::VERSION); exit
          when /^(--?[^-]+)/     then invalid_option($1, argv); exit
          end
        elsif !argv.empty?
          warn "Music: unnecessary arguments `#{argv}`" 
          exit
        end
      end

      def invalid_option(option, argv)
        warn "Music: invalid option `#{option.sub(/^-+/, '')}`"
      end
    end
    extend Helpers
  end
end
