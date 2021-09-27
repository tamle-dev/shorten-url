require 'rails_helper'

class ApplicationController < ActionController::Base; end
class FoosController < ApplicationController; end

RSpec.describe ActiveMenuService do
  let(:controller) { FoosController.new }
  let(:options) do
    {}
  end
  let(:service) { described_class.new controller, options }
  subject { service.exec }

  before do
    allow(controller).to receive(:action_name).and_return('call')
    allow(controller).to receive(:params).and_return({id: 1})
  end

  describe '#exec' do
    context 'custom active class' do
      let(:options) do
        {
          controller_name: 'foos',
          active_class: 'active-class'
        }
      end
      it { is_expected.to eq 'active-class' }
    end

    context 'compare by controller_name' do
      context 'valid options' do
        let(:options) do
          {
            controller_name: 'foos'
          }
        end
        it { is_expected.to eq 'active' }
      end

      context 'invalid options' do
        context 'controller_name not match' do
          let(:options) do
            {
              controller_name: 'foos1'
            }
          end
          it { is_expected.to be nil }
        end

        context 'controller_name is nill' do
          it { is_expected.to eq 'active' }
        end
      end
    end

    context 'compare by controller_name and action_name' do
      context 'valid options' do
        let(:options) do
          {
            controller_name: 'foos',
            action_name: 'call'
          }
        end
        it { is_expected.to eq 'active' }
      end

      context 'invalid options' do
        let(:options) do
          {
            controller_name: 'foos',
            action_name: 'show'
          }
        end
        it { is_expected.to be nil }
      end
    end

    context 'compare by controller_name, action_name, params' do
      context 'valid options' do
        let(:options) do
          {
            controller_name: 'foos',
            action_name: 'call',
            params: { id: 1 }
          }
        end
        it { is_expected.to eq 'active' }
      end

      context 'invalid options' do
        let(:options) do
          {
            controller_name: 'foos',
            action_name: 'show',
            params: { id: 2 }
          }
        end
        it { is_expected.to be nil }
      end
    end
  end
end
