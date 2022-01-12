class AddEvaluationToMusic < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :evaluation, :float
  end
end
