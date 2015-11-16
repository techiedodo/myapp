# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  title      :string
#  box_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Journal < ActiveRecord::Base
  belongs_to :box
  has_many :entries
end
