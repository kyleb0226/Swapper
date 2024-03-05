class Current < ActiveSupport::CurrentAttributes
    attribute :user#will be a current user logged in, keeps mulitple instances of users

end
