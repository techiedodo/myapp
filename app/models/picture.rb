# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  caption    :text
#  box_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photo      :string
#

class Picture < ActiveRecord::Base
  belongs_to :box
  mount_uploader :photo, PhotoUploader

  validates :caption, presence: true
  validates :photo, presence: true
end
