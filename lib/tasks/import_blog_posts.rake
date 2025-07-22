namespace :blog_posts do
  desc "Importar archivos .md desde storage/posts_md/ como posts"
  task import_md: :environment do
    require 'pathname'
    require 'yaml'
    require 'fileutils'

    posts_path = Rails.root.join("storage/posts_md")
    # creates the imported path if it does not exist
    unless Dir.exist?(posts_path)
      puts "Oh uh.... The folder #{posts_path} dosent exist. Make sure that exist and if it isint create it."
      next
    end

    Dir.glob("#{posts_path}/*.md").each do |file_path|
      content = File.read(file_path)
      filename = Pathname.new(file_path).basename.to_s

      # Separar front-matter y cuerpo
      if content =~ /\A---\s*\n(.*?\n?)^---\s*$\n?(.*)/m
        metadata_raw = $1
        body_content = $2
        metadata = YAML.safe_load(metadata_raw) || {}
      else
        puts "didint find the info in markdown file: #{filename}"
        next
      end

      title = metadata['title'] || filename.sub(".md", "").humanize
      description = metadata['description'] || body_content.truncate(150)
      post = BlogPost.all.find { |p| p.title.strip.downcase == title.strip.downcase }
      if post
        if post.description != description || post.body != body_content
          post.update(description: description, body: body_content)
          puts "post actualized: #{title}"
        else
          puts "no changes #{title}"
        end
      else
        BlogPost.create!(title: title, description: description, body: body_content)
        puts "post created yay! #{title}"
        end
    end

    puts "finished importing!"
  end
end