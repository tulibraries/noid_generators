# frozen_string_literal: true

require "rails_helper"
include Rack::Test::Methods

RSpec.describe GeneratorsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:generator) { FactoryBot.create(:generator) }
  let(:project) { FactoryBot.create(:project, generator: generator) }
  year = Time.zone.now.strftime("%Y")
  month = Time.zone.now.strftime("%m")
  user = FactoryBot.create(:user)

  let(:valid_session) { {} }
  let(:headers) { ["HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials(user.username, user.password)] }



  describe "GET #index" do
    it "returns a success response" do
      Generator.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: generator.to_param }, session: valid_session
      expect(response).to have_http_status(302)
    end
  end

  describe "Generate Noids" do
    before(:each) do
      # authorize user.username, user.password
      # http_login
      request.headers.merge! headers
    end

    it "-- constructs valid noid for General Generator" do
      put :update, session: valid_session, params: { id: generator.id, name: "General", noid: 3, project: project.name }
      expect(request.body.string).to eq("name=General&noid=3&project=Manuscripts") #{project}Z#{year}#{month}#{noid}
    end

    it "-- constructs valid noid for Oral Histories Generator" do
      put :update, session: valid_session, params: { id: generator.id, name: "Oral Histories", noid: 3, project: project.name }
      expect(request.body.string).to eq("name=Oral+Histories&noid=3&project=Manuscripts") #{project}JZ#{year}#{month}#{noid}
    end

    it "-- constructs valid noid for Templana (Complex) Generator" do
      put :update, session: valid_session, params: { id: generator.id, name: "Templana (Complex)", noid: 3, project: project.name }
      expect(request.body.string).to eq("name=Templana+%28Complex%29&noid=3&project=Manuscripts") #{project}X#{class_code}Z#{year}#{month}#{noid}
    end

    it "-- constructs valid noid for Bulletin Generator" do
      put :update, session: valid_session, params: { id: generator.id, name: "Bulletin", noid: 3, project: project.name }
      expect(request.body.string).to eq("name=Bulletin&noid=3&project=Manuscripts") #{prefix}Z#{year}#{month}#{noid}#{suffix}
    end
  end

end
