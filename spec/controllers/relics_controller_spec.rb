# -*- encoding : utf-8 -*-
require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RelicsController do

  # This should return the minimal set of attributes required to create a valid
  # Relic. As you add validations to Relic, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RelicsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all relics as @relics" do
      relic = Relic.create! valid_attributes
      get :index, {}, valid_session
      assigns(:relics).should eq([relic])
    end
  end

  describe "GET show" do
    it "assigns the requested relic as @relic" do
      relic = Relic.create! valid_attributes
      get :show, {:id => relic.to_param}, valid_session
      assigns(:relic).should eq(relic)
    end
  end

  describe "GET new" do
    it "assigns a new relic as @relic" do
      get :new, {}, valid_session
      assigns(:relic).should be_a_new(Relic)
    end
  end

  describe "GET edit" do
    it "assigns the requested relic as @relic" do
      relic = Relic.create! valid_attributes
      get :edit, {:id => relic.to_param}, valid_session
      assigns(:relic).should eq(relic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Relic" do
        expect {
          post :create, {:relic => valid_attributes}, valid_session
        }.to change(Relic, :count).by(1)
      end

      it "assigns a newly created relic as @relic" do
        post :create, {:relic => valid_attributes}, valid_session
        assigns(:relic).should be_a(Relic)
        assigns(:relic).should be_persisted
      end

      it "redirects to the created relic" do
        post :create, {:relic => valid_attributes}, valid_session
        response.should redirect_to(Relic.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved relic as @relic" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relic.any_instance.stub(:save).and_return(false)
        post :create, {:relic => {}}, valid_session
        assigns(:relic).should be_a_new(Relic)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relic.any_instance.stub(:save).and_return(false)
        post :create, {:relic => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested relic" do
        relic = Relic.create! valid_attributes
        # Assuming there are no other relics in the database, this
        # specifies that the Relic created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Relic.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => relic.to_param, :relic => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested relic as @relic" do
        relic = Relic.create! valid_attributes
        put :update, {:id => relic.to_param, :relic => valid_attributes}, valid_session
        assigns(:relic).should eq(relic)
      end

      it "redirects to the relic" do
        relic = Relic.create! valid_attributes
        put :update, {:id => relic.to_param, :relic => valid_attributes}, valid_session
        response.should redirect_to(relic)
      end
    end

    describe "with invalid params" do
      it "assigns the relic as @relic" do
        relic = Relic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Relic.any_instance.stub(:save).and_return(false)
        put :update, {:id => relic.to_param, :relic => {}}, valid_session
        assigns(:relic).should eq(relic)
      end

      it "re-renders the 'edit' template" do
        relic = Relic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Relic.any_instance.stub(:save).and_return(false)
        put :update, {:id => relic.to_param, :relic => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested relic" do
      relic = Relic.create! valid_attributes
      expect {
        delete :destroy, {:id => relic.to_param}, valid_session
      }.to change(Relic, :count).by(-1)
    end

    it "redirects to the relics list" do
      relic = Relic.create! valid_attributes
      delete :destroy, {:id => relic.to_param}, valid_session
      response.should redirect_to(relics_url)
    end
  end

end
