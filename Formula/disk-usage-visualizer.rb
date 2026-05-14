class DiskUsageVisualizer < Formula
    desc "Interactive sunburst chart for visualizing disk usage on macOS"
    homepage "https://github.com/aletepe/disk-usage-visualizer"
    url "https://github.com/aletepe/disk-usage-visualizer/archive/refs/tags/v0.0.1.tar.gz"
    sha256 "a20e05750551967aa83d741094026efe48e6eed6bf372733429d487ecaef845a"
    license "MIT"

    depends_on xcode: "15.0"
    depends_on macos: :sonoma

    def install
      system "bash", "build.sh"
      prefix.install "build/DiskUsageVisualizer.app"
    end

    def caveats
      <<~EOS
        DiskUsageVisualizer.app is installed at:
          #{opt_prefix}/DiskUsageVisualizer.app

        To add it to your Applications folder:
          cp -r "#{opt_prefix}/DiskUsageVisualizer.app" /Applications/

        For "Scan whole disk", grant Full Disk Access in:
          System Settings → Privacy & Security → Full Disk Access
          Then add DiskUsageVisualizer.app from the path above.
      EOS
    end

    test do
      assert_predicate prefix/"DiskUsageVisualizer.app", :directory?
      assert_predicate prefix/"DiskUsageVisualizer.app/Contents/MacOS/DiskUsageVisualizer", :executable?
    end
  end
