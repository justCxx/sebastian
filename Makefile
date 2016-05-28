install:
	bundle exec rake db:create
	bundle exec rake db:migrate

test:
	bundle exec rake RAILS_ENV=test

test_coverage:
	bundle exec rake RAILS_ENV=test COVERAGE=true
