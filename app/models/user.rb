#email
#passwordd digest (never directly ineract with this)

#password :string virtual 
#password confirmation: string virtual

class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email" }

    belongs_to :company
  end
  