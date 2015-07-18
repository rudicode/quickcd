module Quickcd
  class Presenter

    def format_list data, spacer
      # spacer is what to put between key value pairs.'
      # eg. spacer = " = " , would give: key = value
      @result =  ""
      @key_max_length = get_max_key_length data

      data.each do |key, value|
        key_with_spacing = add_spacing key, @key_max_length
        @result << "#{key_with_spacing}#{spacer}#{value}\n"
      end
      @result
    end

    def get_max_key_length data
      max_length = 0
      data.each do |key, value|
        max_length = key.length if key.length > max_length
      end
      max_length
    end

    def add_spacing word, length
      left_column = length * -1
      spaced_word = sprintf("%#{left_column}s", word)
    end

  end
end
