class String
  def filter_prefix prefix
    self.start_with?(prefix) ? self[prefix.to_s.length, self.length] : self
  end
end
