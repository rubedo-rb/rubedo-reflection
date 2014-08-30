require 'spec_helper'

describe Rubedo::Reflection::Relation do
  let(:instance) { described_class.new(name, properties) }

  let(:name) { 'users' }

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
      let(:name) { 'companies' }

      it 'stringify it' do
        expect(subject).to eql('companies')
      end
    end
  end

  describe '#owner' do
    subject { instance.owner }

    context 'when defined' do
      let(:expected) { mock }

      let(:properties) do
        { type: expected }
      end

      it { expect(subject).to equal(expected) }
    end

    context 'when not defined' do
      it { expect(subject).to equal(nil) }
    end
  end

  describe 'schema' do
    subject { instance.schema }

    context 'when defined' do
      context 'when string' do
        let(:properies) do
          { schema: 'schema2' }
        end

        it 'symbolize name' do
          expect(subject).to equal(:mynamespace)
        end
      end

      context 'when symbol' do
        let(:properties) do
          { schema: :foo }
        end

        it 'stores it' do
          expect(subject).to equal(:foo)
        end
      end
    end

    context 'when not defined' do
      it { expect(subject).to equal(nil) }
    end
  end

  describe '#columns' do
    subject { instance.columns }

  end

  describe '#indexes' do
    subject { instance.indexes }
  end
end
