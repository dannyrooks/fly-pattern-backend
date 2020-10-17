class MaterialSerializer < ActiveModel::Serializer 
    attributes :id, :name, :description, :pattern_id
end
