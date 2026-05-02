class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :station

  def visit_label
    strings = {
      1 => "Passed through",
      2 => "Called at",
      3 => "Changed trains",
      4 => "Started/ended journey"
    }
    strings[self.visit_type]
  end
end
