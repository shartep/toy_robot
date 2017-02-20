require 'spec_helper'
require 'yaml'
require_relative '../app'

RSpec.describe 'First Run' do
  let(:app)     { App.new }
  let(:result)  { 'spec/result.txt' }

  after(:each)  { File.delete result }

  it 'from task 1' do
    app.perform ['spec/from_task_1.txt', result]
    expect(File.read(result)).to eq "0,1,NORTH\n"
  end

  it 'from task 2' do
    app.perform ['spec/from_task_2.txt', result]
    expect(File.read(result)).to eq "0,0,WEST\n"
  end

  it 'from task 3' do
    app.perform ['spec/from_task_3.txt', result]
    expect(File.read(result)).to eq "3,3,NORTH\n"
  end

  it 'without place' do
    app.perform ['spec/without_place.txt', result]
    expect(File.read(result)).to eq ''
  end

  it 'several reports' do
    app.perform ['spec/several_reports.txt', result]
    expect(File.read(result)).to eq "3,2,EAST\n3,3,NORTH\n"
  end

  it 'several place' do
    app.perform ['spec/several_place.txt', result]
    expect(File.read(result)).to eq "2,1,SOUTH\n"
  end

  it 'move outside 1' do
    app.perform ['spec/move_outside_1.txt', result]
    expect(File.read(result)).to eq "0,4,NORTH\n"
  end

  it 'move outside 2' do
    app.perform ['spec/move_outside_2.txt', result]
    expect(File.read(result)).to eq "0,0,SOUTH\n"
  end

  it 'move outside 3' do
    app.perform ['spec/move_outside_3.txt', result]
    expect(File.read(result)).to eq "0,0,WEST\n"
  end

  it 'move outside 4' do
    app.perform ['spec/move_outside_4.txt', result]
    expect(File.read(result)).to eq "4,0,EAST\n"
  end
end
