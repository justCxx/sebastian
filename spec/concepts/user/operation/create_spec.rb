require 'rails_helper'

describe User::Create do
  it 'persists valid input' do
    user_params = {
      email: 'user@site.com',
      password: 'secret',
      password_confirmation: 'secret'
    }
    res, op = User::Create.run(user: user_params)
    expect(res).to be true
    expect(op.model.persisted?).to be true
  end

  it 'no persists invalid input' do
    res, op = User::Create.run(user: { email: 'user@site.com', password: nil })
    expect(res).to be false
    expect(op.model.persisted?).to be false
  end

  context 'when password confirmation wrong' do
    let(:user) do
      { email: 'user@site.com',
        password: 'secret',
        password_confirmation: 'terces' }
    end

    it 'no create a new user' do
      res, op = User::Create.run(user: user)
      expect(res).to be false
      expect(op.model.persisted?).to be false
    end
  end

  context 'when email not unique' do
    let(:user_params) do
      { email: 'user@site.com',
        password: 'secret',
        password_confirmation: 'secret' }
    end

    it 'no create a new user' do
      first_res, first_op = User::Create.run(user: user_params)
      expect(first_res).to be true
      expect(first_op.model.persisted?).to be true

      second_res, second_op = User::Create.run(user: user_params)
      expect(second_res).to be false
      expect(second_op.model.persisted?).to be false
    end
  end
end
