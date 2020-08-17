# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe '#index' do
    context 'when user is NOT logged in' do
      it 'renders login form' do
        get root_path

        expect(response.status).to eq 302
        follow_redirect!

        expect(response.body).to include 'You need to sign in or sign up before continuing.'
        expect(response.body).to include 'Log in'
        expect(response.body).not_to include 'Edit account'
      end
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it 'renders index page' do
        get root_path

        expect(response.status).to eq 200
        expect(response.body).to include 'Edit account'
        expect(response.body).to include 'Log out'
      end

      context 'with refuelings' do
        let!(:ref1) { create(:refueling, user: user, created_at: Date.yesterday) }
        let!(:ref2) { create(:refueling, user: user, liters: 20, created_at: Date.current) }
        let!(:ref3) { create(:refueling, liters: 400, created_at: Date.current) }

        it 'displays only self refuelings' do
          get root_path

          expect(response.body).to include ref1.liters.to_s
          expect(response.body).to include ref2.liters.to_s
          expect(response.body).not_to include ref3.liters.to_s
        end
      end
    end
  end
end
