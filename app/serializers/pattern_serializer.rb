class PatternSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :comment
  has_many :materials

  # attribute :material do |pattern|
  #   mat = pattern.material
  #     {
  #       id: mat.id,
  #       name: mat.name,
  #       description: mat.description
  #     }

  # end
end
