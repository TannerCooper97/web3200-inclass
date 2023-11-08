class User < ApplicationRecord
  include Clearance::User

  def admin?
    admin
  end
end
