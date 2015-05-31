require "spec_helper"
require "#{LIB}/cal_data/bnet/refine"

describe CalData::Bnet::Refine do
  let(:klas) { described_class }
  subject    { klas.new        }

  describe "Klas" do
    specify { expect(klas).to be_a(Class) }
  end

  describe "Instance Methods" do
    it { should respond_to :execute }
  end

  describe "_csv_events" do
    it "returns an array" do
      expect(subject.send(:csv_events)).to be_an(Array)
    end
  end

  describe "_events" do
    it "returns an array" do
      expect(subject.send(:events)).to be_an(Array)
    end
  end
end