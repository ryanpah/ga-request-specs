# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  state      :string(255)      default("private")
#  created_at :datetime
#  updated_at :datetime
#

class Playlist < ActiveRecord::Base

  STATES = [PRIVATE = 'private', PUBLIC = 'public']
  belongs_to :user, touch: true
  has_and_belongs_to_many :songs

  validates :state, inclusion: { in: STATES }

  def self.states_for_select_tag
    s = ""
    Playlist::STATES.each_with_index { |e, i| s <<  "<option value=#{i}>#{e}</option>"}
    s.html_safe
  end
end
