class UpdateStudents < ActiveRecord::Migration[6.0]
  def change
    add_column(:students, :provider, :string, limit: 50, null: false, default: '')
    add_column(:students, :uid, :string, limit: 500, null: false, default: '')
  end
end
