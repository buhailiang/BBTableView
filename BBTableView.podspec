
Pod::Spec.new do |s|
  s.name         = "BBTableView"
  s.version      = "0.5"
  s.summary      = "Use table view to layout a view auto resized with sub views height changed"
  s.homepage     = "https://github.com/buhailiang/BBTableView"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license = { :type => "MIT", :file => "LICENSE" }
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author = { "bartx" => "https://github.com/buhailiang" }
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform = :ios, "6.0"
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = { :git => "https://github.com/buhailiang/BBTableView.git", :tag => "v0.5" }
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "BBTableView/*.{h,m}"

s.subspec "ScrollView" do |sp|
    sp.source_files = "BBTableView/*Scroll*.{h,m}"
end

s.subspec "TableView" do |sp|
    sp.source_files = "BBTableView/*Table*.{h,m}"
end

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
end
