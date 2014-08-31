class AddMemberIdToMemberInformations < ActiveRecord::Migration
  def change
    add_reference :member_informations, :member, index: true
  end
end
