require 'rails_helper'

describe Session::SignIn do
  before do
    User.create(email: 'user@site.com',
                password: 'secret',
                password_confirmation: 'secret')
  end

  it 'passing valid input' do
    session_data = { email: 'user@site.com', password: 'secret' }
    res, op = Session::SignIn.run(session: session_data)
    expect(res).to be true
    expect(op.model).to be
  end

  it 'no passing invalid input: password is nil' do
    session_data = { email: 'user@site.com', password: nil }
    res, op = Session::SignIn.run(session: session_data)
    expect(res).to be false
    expect(op.model).not_to be
  end

  it 'no passing invalid input: empty password' do
    session_data = { email: 'user@site.com', password: '' }
    res, op = Session::SignIn.run(session: session_data)
    expect(res).to be false
    expect(op.model).not_to be
  end

  it 'no passing invalid input: wrong password' do
    session_data = { email: 'user@site.com', password: 'terces' }
    res, op = Session::SignIn.run(session: session_data)
    expect(res).to be false
    expect(op.model).not_to be
  end

  it 'no passing invalid input: wrong email' do
    session_data = { email: 'site@user.com', password: 'secret' }
    res, op = Session::SignIn.run(session: session_data)
    expect(res).to be false
    expect(op.model).not_to be
  end
end
