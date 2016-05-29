require 'reform/form/validation/unique_validator'

class User
  class Create < Trailblazer::Operation
    include Model

    model User, :create

    contract do
      property :email, type: String
      property :password, type: String
      property :password_confirmation, type: String, virtual: true

      validation :default do
        validates :email, presence: true, unique: true
        validates :password, presence: true
      end

      validation :confirmation, if: :default do
        validate :password_confirmation do
          valid_confirm = password == password_confirmation
          unless valid_confirm
            errors.add(:password, 'Password mismatch') # TODO: i18n me
            errors.add(:password_confirmation, 'Password mismatch') # TODO: i18n me
          end
        end
      end
    end

    def process(params)
      validate(params[:user]) do
        contract.save
      end
    end
  end
end
