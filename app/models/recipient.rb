# == Schema Information
#
# Table name: recipients
#
#  id         :integer          not null, primary key
#  recipient  :string
#  email      :string
#  DOB        :date
#  user_id    :integer
#  box_id     :integer
#  accepted   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipient < ActiveRecord::Base
  belongs_to :user
  belongs_to :box

  validates :name, presence: true
  validates :DOB, presence: true
  validates :email, presence: true, uniqueness: { scope: :box_id} #allows email to be used only once per trove
end
