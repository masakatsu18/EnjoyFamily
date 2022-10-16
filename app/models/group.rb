class Group < ApplicationRecord
 has_many :events, dependent: :destroy
 has_many :customers
end
