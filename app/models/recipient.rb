# == Schema Information
#
# Table name: recipients
#
#  id         :integer          not null, primary key
#  recipient  :string
#  email      :string
#  DOB        :date
#  user_id    :integer
#  trove_id   :integer
#  accepted   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipient < ActiveRecord::Base
  belongs_to :user
  belongs_to :box

  validates :recipient, presence: true
  validates :DOB, presence: true
  validates :email, presence: true
end
