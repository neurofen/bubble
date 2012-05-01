module VIEW
  module HELPER
    def string2hex(string)
      string.unpack('U'*string.length).collect { |x| x.to_s 16 }.join
    end
  end
end