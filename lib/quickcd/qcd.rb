module Quickcd
  class Qcd
    def initialize path
      puts "Path: #{path}"
      @config_parser = Quickcd::ConfigParser.new(path)
    end

    def list
      output = "List of saved directories.\n"
      @config_parser.config_pairs.each do |key,value|
        output << "#{key} = #{value}\n"
      end
      output
    end

  end
end
