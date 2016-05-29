class Session
  class SignIn < Trailblazer::Operation
    contract do
      undef :persisted?

      attr_reader :user

      property :email, type: String, virtual: true
      property :password, type: String, virtual: true

      validation :default do
        validates :email, :password, presence: true
      end

      validation :authorize, if: :default do
        validate :password_ok?
      end

      def password_ok?
        @user = User.find_by(email: email)
        unless @user && @user.authenticate(password)
          errors.add(:password, 'Wrong password')
        end
      end
    end

    def process(params)
      return invalid! unless params[:session]
      validate(params[:session]) do
        @model = contract.user
      end
    end
  end
end
