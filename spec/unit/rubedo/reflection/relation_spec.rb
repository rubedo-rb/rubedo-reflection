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
      let(:expected) { double }

      let(:properties) do
        { owner: expected }
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
        let(:properties) do
          { schema: 'mynamespace' }
        end

        it 'stores it' do
          expect(subject).to eql('mynamespace')
        end
      end

      context 'when symbol' do
        let(:properties) do
          { schema: :schema2 }
        end

        it 'stringify it' do
          expect(subject).to eql('schema2')
        end
      end
    end

    context 'when not defined' do
      it { expect(subject).to equal(nil) }
    end
  end

  describe '#columns' do
    subject { instance.columns }

    context 'when defined' do
      let(:attr_name)  { instance_double('Rubedo::Reflection::Attribute', name: 'name') }
      let(:attr_email) { instance_double('Rubedo::Reflection::Attribute', name: 'email') }

      let(:properties) do
        {
          columns: {
            name:  attr_name,
            email: attr_email
          }
        }
      end

      it 'should store it' do
        expect(subject[:name].name).to  eql('name')
        expect(subject[:email].name).to eql('email')
      end

      it 'should not allow to change it' do
        expect { subject[:foo] = :bar }.to raise_error(RuntimeError, "can't modify frozen Hash")
      end
    end

    context 'when not defined' do
      it { expect(subject).to eql({}) }
    end
  end

  describe '#column_names' do
    subject { instance.column_names }

    context 'when columns defined' do
      let(:properties) do
        {
          columns: {
            name:  instance_double('Rubedo::Reflection::Attribute'),
            email: instance_double('Rubedo::Reflection::Attribute')
          }
        }
      end

      it 'returns columns list' do
        expect(subject).to eql %i(name email)
      end

      it 'should not allow to change it' do
        expect { subject << :bar }.to raise_error(RuntimeError, "can't modify frozen Array")
      end
    end

    context 'when columns not defined' do
      it { expect(subject).to eql([]) }
    end
  end

  describe '#indexes' do
    subject { instance.indexes }

    context 'when defined' do
      pending
    end

    context 'when not defined' do
      pending
    end
  end
end
