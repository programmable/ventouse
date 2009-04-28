class ActiveRecord::Base
  alias save     save_without_transactions
  alias save!    save_without_transactions!
  alias destroy  destroy_without_transactions
end