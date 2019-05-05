class AddTimestampsToConsultantProfiles < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :consultant_profiles, default: Time.zone.now
  end
end
