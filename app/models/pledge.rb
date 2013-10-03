class Pledge < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  attr_accessible :amount, :project_id, :user_id

  validates :user_id, presence: true
  validates :project_id, presence: true
  validates :amount, :numericality => { :greater_than => 0 }
end
