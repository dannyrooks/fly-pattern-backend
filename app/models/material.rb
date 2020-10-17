class Material < ApplicationRecord
    belongs_to :pattern
    validates :name, presence: true
end
