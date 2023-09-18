module LoginHelpers
  def login_user(user)
    sign_in user
  end

  def login_account(account)
    sign_in account.user
    page.set_rack_session(account_id: account.id)

    if account.trainer?
      visit 'trainers/clients'
    else
      visit 'clients/workout'
    end
  end
end
