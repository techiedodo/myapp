# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  body       :text
#  journal_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject    :string
#

class Entry < ActiveRecord::Base
  belongs_to :journal
end
