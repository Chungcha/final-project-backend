class AddAttendingToUserMeetups < ActiveRecord::Migration[6.0]
  def change
    add_column :user_meetups, :attending, :boolean
  end
end
