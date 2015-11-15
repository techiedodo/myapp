# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  title      :string
#  entry      :text
#  box_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Journal < ActiveRecord::Base
  belongs_to :box
end
