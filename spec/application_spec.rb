describe Application do
  before do
    described_class.secrets_filepath = 'spec/support/fixtures/secrets.test.yml'
  end

  after do
    described_class.secrets_filepath = described_class::DEFAULT_SECRETS_FILEPATH
  end

  it 'loads number variables' do
    expect(described_class.secrets.number_test_variable).to eq(123)
  end

  it 'loads string variables' do
    expect(described_class.secrets.string_test_variable).to eq('test')
  end

  it 'loads nested variables' do
    expect(described_class.secrets.nested_variable).to eq(
      'nested_number' => 123,
      'nested_string' => 'test'
    )
  end
end
