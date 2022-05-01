workspace 'ComponentsApp1'
platform :ios, '14.0'
use_frameworks!

target 'ComponentsApp1' do
   
end

target 'Tutorial' do
  project 'Features/Tutorial/Tutorial'
  use_frameworks!
  
  target 'TutorialTests' do
    inherit! :search_paths
    use_frameworks!
    pod 'SnapshotTesting', '~> 1.8.1'
  end
end
