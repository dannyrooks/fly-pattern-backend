class PatternSerializer < ActiveModel::Serializer
  attributes :id, :name, :category
  has_many :materials
end
