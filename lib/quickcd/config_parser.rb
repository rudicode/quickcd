module Quickcd
  class ConfigParser

  attr_reader :config_pairs

    def initialize path
      @config_pairs = {}
      init_dummy_keys
    end

    def init_dummy_keys
      @config_pairs = {
        '1' => "~/test1",
        '2' => "~/test2",
        '3' => "~/test3",
        '4' => "~/test4",
        '5' => "~/test5"
      }
    end
  end
end
