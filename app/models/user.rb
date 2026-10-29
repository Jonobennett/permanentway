class User < ApplicationRecord
  include Progress
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :stations, -> { distinct }, through: :visits

  attr_readonly :admin

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates_uniqueness_of :screen_name

  generates_token_for :email_confirmation, expires_in: 7.days do
    unconfirmed_email
  end

  def confirm_email
    update(email_address: unconfirmed_email, unconfirmed_email: nil)
  end


  private
    def max_levels
      Current.user.visits.group("station_id").maximum("visit_type")
    end

    def station_count
      Station.count
    end
end
