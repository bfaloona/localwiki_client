$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'localwiki_client'
require 'rspec/mocks'
require 'helper'

describe Localwiki::Client do

  context 'site' do

    before(:all) do
      @site_fetch_json = load_json 'site_fetch.json'
    end

    before(:each) do
      response = double('response')
      response.stub(:body) { @site_fetch_json }
      RestClient::Request.should_receive(:execute
        ).with(
          {:method => :get,
           :url => 'http://mockwiki.foo/api/site/1?format=json',
           :timeout => 120}
        ).and_return(response)
    end

    subject { Localwiki::Client.new 'mockwiki.foo' }

    context 'attributes' do

      context '#site_name' do
        it { subject.site_name.should eq 'Salt Lake Wiki' }
      end

      context '#time_zone' do
        it { subject.time_zone.should eq 'America/Chicago' }
      end

      context '#language_code' do
        it { subject.language_code.should eq 'en-us'}
      end

    end
  end
end
