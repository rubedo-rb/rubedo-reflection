require 'spec_helper'

describe Rubedo::Reflection::Column do
  let(:instance) { described_class.new(name, properties) }

  let(:name) { 'email' }

  let(:properties) do
    {}
  end

  describe '#name' do
    subject { instance.name }

    context 'when string' do
      it 'stores it' do
        expect(subject).to equal(name)
      end
    end

    context 'when symbol' do
      let(:name) { 'address' }

      it 'stringify it' do
        expect(subject).to eql('address')
      end
    end
  end

  describe '#type' do
    subject { instance.type }

    context 'when defined' do
      let(:expected) { String }

      let(:properties) do
        { type: expected }
      end

      it { expect(subject).to equal(expected) }
    end

    context 'when not defined' do
      it { expect(subject).to equal(nil) }
    end
  end

  describe '#allow_null?' do
    subject { instance.allow_null? }

    context 'when defined' do
      context 'as true' do
        let(:properties) do
          { allow_null: true }
        end

        it { expect(subject).to be(true) }
      end

      context 'as false' do
        let(:properties) do
          { allow_null: false }
        end

        it { expect(subject).to be(false) }
      end

      context 'as not boolean' do
        pending
      end
    end

    context 'when not defined' do
      it { expect(subject).to equal(nil) }
    end
  end

  describe '#default' do
    subject { instance.default }

    context 'when defined' do
      let(:expected) { 'john@example.com' }

      let(:properties) do
        { default: expected }
      end

      it { expect(subject).to equal(expected) }
    end

    context 'when not defined' do
      it { expect(subject).to equal(nil) }
    end

    context 'when defined but nil' do
      pending
    end
  end

end
