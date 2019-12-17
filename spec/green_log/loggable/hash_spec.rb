# frozen_string_literal: true

require "green_log/loggable/hash"

RSpec.describe GreenLog::Loggable::Hash do

  context "constructed with no args" do

    subject(:loggable_hash) do
      described_class.new
    end

    it "is empty" do
      expect(subject).to be_empty
    end

    describe "#to_h" do
      it "returns an empty Hash" do
        expect(subject.to_h).to eq({})
      end
    end

  end

  subject(:loggable_hash) do
    described_class.new(input_hash)
  end

  context "constructed with a simple Hash of values" do

    let(:input_hash) { { x: "juan", y: 2 } }

    it "is not empty" do
      expect(subject).to_not be_empty
    end

    describe "#to_h" do
      it "returns the input Hash" do
        expect(subject.to_h).to eq(input_hash)
      end
    end

    it "is not coupled to the input Hash" do
      original_input = input_hash.dup
      expect(subject.to_h).to eq(original_input)
      input_hash[:x] = "fnord"
      expect(subject.to_h).to eq(original_input)
    end

  end

  context "constructed with a simple Hash of values" do

    let(:input_hash) { { "thread" => "main" } }

    it "symbolises the keys" do
      expect(subject.to_h).to eq(thread: "main")
    end

  end

end
