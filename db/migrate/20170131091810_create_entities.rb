class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :entity_type
      t.string :entity_id

      t.timestamps
    end

    create_table :entities_tags, id: false do |t|
      t.belongs_to :entity, index: true
      t.belongs_to :tag, index: true
    end
  end
end
