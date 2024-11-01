class User < ApplicationRecord
  # Relación con Devise
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Relación con las sesiones de entrenamiento
  has_many :training_sessions, dependent: :destroy
end
