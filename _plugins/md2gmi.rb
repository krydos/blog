module Jekyll
  module Generators
    class GeminiGenerator < Generator
      safe true

      CAPSULE_DIR = '_capsule'
      OUTPUT_EXT = '.gmi'
      HEADER_FILE_NAME = '_header.gmi'
      FOOTER_FILE_NAME = '_footer.gmi'
      INDEX_GMI = 'index.gmi'

      # This is the entry point required by Jekyll
      def generate(site)
        ensure_capsule_dir
        posts_array = [] # collect all the posts for future index.gmi generation
        site.posts.docs.each do |post|
          posts_array.push(create_gmi_for_post(post))
        end

        generate_index_gmi(posts_array.reverse)
      end

      def header_path()
        path = root_rel_path(File.join(CAPSULE_DIR, HEADER_FILE_NAME))
        ensure_file(path)
        path
      end

      def footer_path()
        path = root_rel_path(File.join(CAPSULE_DIR, FOOTER_FILE_NAME))
        ensure_file(path)
        path
      end

      def generate_index_gmi(posts_array)
        index_gmi_path = root_rel_path(File.join(CAPSULE_DIR, INDEX_GMI))
        content = File.read(header_path()) + "\n"
        posts_array.each do |p_info|
          content = content + gemtext_link(p_info[:title], p_info[:file]) # that's how every post is gonna look like
        end

        File.write(index_gmi_path, content + "\n" + File.read(footer_path()))
      end

      def gemtext_link(title, path)
        "=> #{path}\t#{title}\n"
      end

      def ensure_file(path)
        File.write(path, '') unless File.exist?(path)
      end

      def ensure_capsule_dir()
        capsule_dir = root_rel_path(CAPSULE_DIR)
        Dir.mkdir(capsule_dir) unless Dir.exist?(capsule_dir)
      end

      # return `path` prefixed with
      # path to root dir of the jekyll site
      def root_rel_path(path)
        # use realdirpath instead of realpath because
        # realdirpath doesn't care if directory exists
        # while realpath throws an exception
        File.realdirpath(File.join(__dir__, '..', path))
      end

      def get_gmi_filename(post)
        post.basename_without_ext + OUTPUT_EXT
      end

      def get_tmp_filename(post)
        post.basename_without_ext + '.tmp'
      end

      def gen_title(post)
        "# #{post.data['title']}\n"
      end

      # we want temp file with the post content
      # because the content doesn't contain jekyll specific
      # header that every md file has
      def create_temp_file_from_post(post)
        tmp_file_name = get_tmp_filename(post)
        File.write(root_rel_path(File.join(CAPSULE_DIR, tmp_file_name)), gen_title(post) + post.content)
      end

      def delete_temp_file_from_post(post)
        tmp_file_name = get_tmp_filename(post)
        File.delete(root_rel_path(File.join(CAPSULE_DIR, tmp_file_name)))
      end

      def create_gmi_for_post(post)
        create_temp_file_from_post(post)
        temp_file_to_gmi(post)
        delete_temp_file_from_post(post)

        {:title => post.data["title"], :file => (post.basename_without_ext + OUTPUT_EXT)}
      end

      # when temp file is created we want to
      # convert it to gmi. Maybe there Ruby-way
      # but at the moment I use python tool for this
      def temp_file_to_gmi(post)
        tmp_file_name = get_tmp_filename(post)
        path = root_rel_path(File.join(CAPSULE_DIR, tmp_file_name))
        gmi_content = `md2gemini -s #{path}`

        gmi_file_name = get_gmi_filename(post)
        File.write(root_rel_path(File.join(CAPSULE_DIR, gmi_file_name)), gmi_content)
      end
    end
  end
end
