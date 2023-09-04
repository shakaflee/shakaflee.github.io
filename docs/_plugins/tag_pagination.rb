require 'jekyll-paginate'

module Jekyll
    class TagIndex < Page
      def initialize(site, base, dir, tag)
        @site = site
        @base = base
        @dir = dir
        @name = 'index.html'
        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'tagpage.html')
        self.data['tag'] = tag
        tag_title_prefix = site.config['tag_title_prefix'] || 'Posts Tagged &ldquo;'
        tag_title_suffix = site.config['tag_title_suffix'] || '&rdquo;'
        self.data['title'] = "#{tag_title_prefix}#{tag}#{tag_title_suffix}"
        self.data['pname'] = "tags/#{tag}"
        # 自定义的一个页面标识, 同时也为了后面修改tag单页增加一个url前缀用的
      end
    end
    class TagGenerator < Generator
      safe true
      def generate(site)
        if site.layouts.key? 'tagpage'
          dir = site.config['tag_dir'] || 'tag'
          site.tags.keys.each do |tag|
            write_tag_index(site, File.join(dir, tag), tag)
            #write_tag_index(site, File.join(dir, tag.split.map(&:capitalize).join("-")), tag.split.map(&:capitalize).join("-"))
          end
        end
      end
      def write_tag_index(site, dir, tag)
        # 下述代码有所修改, 注意!
        tag_posts = site.posts.docs.find_all { |post| post.data['tags'].include?(tag) }.sort_by { |post| -post.date.to_f }
        # 当前tag的所有post
        num_pages = TagPager.calculate_pages(tag_posts, site.config['paginate'].to_i)
        # 所有post分出的页数
        (1..num_pages).each do |page|
          pager = TagPager.new(site, page, tag_posts, tag, num_pages)
          index = TagIndex.new(site, site.source, dir, tag)
          index.pager = pager
          index.dir = dir
          if page != 1
            index.dir = File.join(dir, "page#{page}")
            # 生成page路径
          end
          index.render(site.layouts, site.site_payload)
          index.write(site.dest)
          site.pages << index
        end
      end
    end
  
    class TagPager < Jekyll::Paginate::Pager

      # 继承paginate::pager的类, 直接使用了
      attr_reader :tag
  
      def initialize(site, page, all_posts, tag, num_pages = nil)
        @tag = tag
        super site, page, all_posts, num_pages
      end
  
      alias_method :original_to_liquid, :to_liquid
  
      def to_liquid
        liquid = original_to_liquid
        liquid['tag'] = @tag
        liquid
      end
    end
  end
  