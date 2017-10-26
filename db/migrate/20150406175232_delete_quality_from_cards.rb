class DeleteQualityFromCards < ActiveRecord::Migration[5.1]
  def change
    remove_column :cards, :quality, :integer
  end
end
