class PatternSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :comment
  has_many :materials
end
