class ChangeRequestTypeInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :request, :text
  end
end
