require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "pins/1/comments/new").to route_to("comments#new", :pin_id => "1")
    end

    it "routes to #show" do
      expect(:get => "pins/1/comments/1").to route_to("comments#show", :pin_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "pins/1/comments/1/edit").to route_to("comments#edit", :pin_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "pins/1/comments").to route_to("comments#create", :pin_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "pins/1/comments/1").to route_to("comments#update", :pin_id => "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "pins/1/comments/1").to route_to("comments#update",:pin_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "pins/1/comments/1").to route_to("comments#destroy", :pin_id => "1", :id => "1")
    end

  end
end
