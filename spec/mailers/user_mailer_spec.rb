require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user_action) }
  let(:mail) { UserMailer.welcome_email(user) }
  it 'renders the subject' do
    expect(mail.subject).to eql('User Is Created.')
  end

  it 'renders the receiver email' do
    expect(mail.to).to eql([user.email])
  end

  it 'renders the sender email' do
    expect(mail.from).to eql(['demo42424242@gmail.com'])
  end
end
