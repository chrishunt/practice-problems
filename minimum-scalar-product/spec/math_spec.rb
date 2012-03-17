require 'math'

describe Math do
  describe '#minProduct' do
    subject { Math.minProduct(v1, v2) }

    context 'with positive numbers' do
      let(:v1) { [1, 2, 3, 4, 5] }
      let(:v2) { [1, 0, 1, 0, 1] }

      it 'returns the minimal scalar product' do
        subject.should == 6
      end
    end

    context 'with negative numbers' do
      let(:v1) { [1, 3, -5] }
      let(:v2) { [-2, 4, 1] }

      it 'returns the minimal scalar product' do
        subject.should == -25
      end
    end
  end
end
