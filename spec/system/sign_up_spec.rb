describe 'User Signs Up' do
  context 'without invite code' do
    context 'and proper info' do
      it 'should not be linked to trainer' do
        visit '/users/sign_up'

        fill_in 'First name', with: Faker::Name.first_name
        fill_in 'Last name', with: Faker::Name.last_name
        fill_in 'Email Address', with: Faker::Internet.email
        password = Faker::Internet.password
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password

        expect { click_on 'Sign up' }.to change { User.count }.by 1
        expect(TrainerClient.count).to eq 0
      end
    end
  end

  context 'with invite code' do
    let(:trainer) { create(:trainer) }
    let(:invite_token) { create(:invite_token, trainer:) }

    context 'and proper info' do
      it 'should be linked to a trainer' do
        visit "/invite/#{invite_token.token}"

        fill_in 'First name', with: Faker::Name.first_name
        fill_in 'Last name', with: Faker::Name.last_name
        fill_in 'Email Address', with: Faker::Internet.email
        password = Faker::Internet.password
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password

        expect { click_on 'Sign up' }.to change { User.count }.by 1
        expect(TrainerClient.count).to eq 1
        expect(trainer.clients.count).to eq 1
      end
    end
  end
end
