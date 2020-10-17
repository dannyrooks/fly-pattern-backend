class Material < ApplicationRecord
    has_and_belongs_to_many :patterns
    validates :name, presence: true
end
