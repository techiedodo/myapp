# == Schema Information
#
# Table name: boxes
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Box < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :recipients, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
