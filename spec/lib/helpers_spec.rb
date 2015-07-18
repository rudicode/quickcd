require 'spec_helper'
require 'quickcd/version'
require 'helpers'

describe 'Quickcd' do


  describe 'Presenter' do
    context 'format_list' do
      before :each do
        @presenter = Quickcd::Presenter.new
        @list = {
          '1' => '~/temp/temp1',
          '2' => '~/temp/temp2',
          '3' => '~/temp/temp3',
          }
        @spacer = ' = '
        @correct_format =  "1 = ~/temp/temp1\n"
        @correct_format << "2 = ~/temp/temp2\n"
        @correct_format << "3 = ~/temp/temp3\n"
      end

      it 'Uses the spacer' do
        result  = @presenter.format_list(@list, @spacer)
        expect(result).to eq(@correct_format)
      end

      it "creates first column spacing relative to longest key name" do
        @list['mytemp2'] = '~/temp/mytemp2'
        @correct_format =  "1       = ~/temp/temp1\n"
        @correct_format << "2       = ~/temp/temp2\n"
        @correct_format << "3       = ~/temp/temp3\n"
        @correct_format << "mytemp2 = ~/temp/mytemp2\n"

        result  = @presenter.format_list(@list, @spacer)
        expect(result).to eq(@correct_format)
      end

    end

  end
end
