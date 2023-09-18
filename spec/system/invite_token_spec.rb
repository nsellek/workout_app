describe InviteToken do
  context 'when trainer visits New Client page' do
    let(:trainer) { create(:trainer) }

    context 'without token' do
      it 'create new token' do
        login_account trainer

        expect { click_on 'New Client' }.to change { InviteToken.count }.by 1
      end
    end

    context 'with token' do
      let!(:token) { create(:invite_token, trainer:) }

      it "doesn't create new token" do
        login_account trainer

        expect { click_on 'New Client' }.to change { InviteToken.count }.by 0
      end
    end
  end
end
