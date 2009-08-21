class String
  def filter_prefix prefix
    self.starts_with?(prefix) ? self[prefix.to_s.length, self.length] : self
  end

  def filter_prefix! prefix
    self.slice! Regexp.new "^#{prefix}"
  end

end
