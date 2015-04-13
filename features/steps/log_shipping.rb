require 'rspec/expectations'

# Step definition for the log shipping feature.
class Spinach::Features::LogShipping < Spinach::FeatureSteps
  step 'a configured machine' do
    @machine = TestMachine.new
    @machine.configure
    @conjur = MockConjur.new
    @machine.launch @conjur.id
    sleep 2 # to settle
  end

  step 'a user logs in' do
    @machine.ssh
  end

  step 'an audit record is created' do
    expect(@conjur.audits).to include 'action' => 'login'
  end
end
