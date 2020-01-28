# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectsController, type: :controller do

  let(:valid_session) { {} }

  describe "GET #index" do
    let(:project) { FactoryBot.create(:project, generator: FactoryBot.build(:generator)) }
    it "returns a success response", skip: "TBA: Views don't exist yet" do
      get :index, session: valid_session
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #show" do
    let(:project) { FactoryBot.create(:project, generator: FactoryBot.build(:generator)) }
    it "returns a success response" do
      get :show, params: { id: project.id }, session: valid_session
      expect(response).to have_http_status(302)
    end
  end

end
