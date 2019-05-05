class AddFieldsToConsultantProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :consultant_profiles, :name, :string
    add_column :consultant_profiles, :middle_name, :string
    add_column :consultant_profiles, :surname, :string
    add_column :consultant_profiles, :birthday, :date
    add_column :consultant_profiles, :gender, :integer, default: 0
  end
end
