require 'spec_helper'

describe "StaticPages" do

  #let(:base_title) {"Ruby on Rails"}
  subject { page }

  describe "Pagina Inicio" do
    it "deberia contener 'SSO Manager'" do
      before { visit root_path}
      should have_content('SSO Manager')
    end
  end
end
