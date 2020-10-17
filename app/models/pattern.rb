class Pattern < ApplicationRecord
    has_and_belongs_to_many :materials
    validates :name, presence: true
end
