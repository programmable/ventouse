module ActiveRecord
  class Base
    def partial_updates?
      ActiveRecord::Base.partial_updates?
    end
  end
end