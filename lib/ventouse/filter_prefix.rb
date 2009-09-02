class String
  def filter_prefix! prefix
    sliced = slice! /^#{prefix}/
    !sliced.nil?
  end

  def filter_prefix prefix
    s = clone
    s.filter_prefix! prefix
    s
  end
end
