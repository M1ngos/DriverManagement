class Task < ApplicationRecord
  belongs_to :driver
  belongs_to :client, optional: true

  validates :title, :description, presence: true

  # Mark task as completed
  def mark_as_completed
    update(completed: true)
  end

  # Turbo Streams for real-time broadcasting
  after_create_commit do
    Rails.logger.info "Broadcasting task creation for task ##{self.id}"
    broadcast_prepend_to "tasks", partial: "drivers/tasks/task", locals: { task: self }, target: "tasks"
  end
  after_update_commit { broadcast_replace_to "tasks", partial: "drivers/tasks/task", locals: { task: self } }
  after_destroy_commit { broadcast_remove_to "tasks" }
end
