require 'rails_helper'

describe 'routes to the users controller', type: :routing do
  it { expect(get: profile_path).to route_to(controller: 'web/users', action: 'show') }
  it { expect(get: sign_up_path).to route_to(controller: 'web/users', action: 'new') }
  it { expect(post: sign_up_path).to route_to(controller: 'web/users', action: 'create') }
end
