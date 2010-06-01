class String
  def filter_prefix! prefix, ignore_case = false
    sliced = ignore_case ? slice!(/^#{prefix}/i) : slice!(/^#{prefix}/)
    !sliced.nil?
  end

  def filter_prefix prefix, ignore_case = false
    s = clone
    s.filter_prefix! prefix, ignore_case
    s
  end
end
