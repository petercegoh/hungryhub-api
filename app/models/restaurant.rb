class Restaurant < ApplicationRecord
    validates :name, :cuisine_type, presence: true
end
    