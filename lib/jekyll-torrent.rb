require 'jekyll-torrent/version'

# Creates a torrent file with your generated site. You should serve the files
# with your client.
module Jekyll
  class Site

    def process_with_torrent
      # Original Site.process method
      process_without_torrent
      self.make_torrent
    end

    def make_torrent
      # The torrent file is written at the root of the site
      file = "#{dest}/#{torrent['file']}"

      # Delete existing file since `mktorrent` doesn't overwrite it
      File.delete(file) if File.exists?(file)

      puts "Generating torrent file at #{file}"
      # TODO usar popen3
      puts `#{torrent[:bin]} --tracker "#{torrent[:announce]}" --outfile "#{file}" #{torrent[:flags]} "#{dest}"`
    end

    # Alias method chain
    alias_method :process_without_torrent, :process
    alias_method :process, :process_with_torrent

    private
      # Merges config with default values
      def torrent
        @torrent_config ||= {
          announce: 'udp://9.rarbg.to:2710/announce',
          file: 'site.torrent',
          flags: '',
          bin: 'transmission-create'
        }.merge(config.fetch('torrent', {}))
      end
  end
end
