require "warden"
require Rails.root.join("lib/strategies/password_strategy")
Warden::Strategies.add(:password_strategy, PasswordStrategy)
