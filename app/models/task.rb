class Task < ApplicationRecord
  belongs_to :driver
  belongs_to :client, optional: true

  validates :title, :description, presence: true

  # Mark task as completed
  def mark_as_completed
    update(completed: true)
  end

  # Ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    [  "id", "title" ]
  end
end
