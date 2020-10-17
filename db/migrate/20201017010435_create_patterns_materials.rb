class CreatePatternsMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :patterns_materials do |t|
      t.references :pattern, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
