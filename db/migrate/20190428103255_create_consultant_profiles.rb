class CreateConsultantProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :consultant_profiles do |t|
      t.text :description
      t.references :user, index: :unique
    end
  end
end
