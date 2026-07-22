# frozen_string_literal: true

# Prevent a newly loaded page from briefly inheriting the scroll position of
# the previous page. Injecting this before styles load avoids a visible jump,
# while preserving normal anchor-link behavior.
module ChaeunSite
  INITIAL_SCROLL_POSITION_SCRIPT = <<~HTML.freeze
    <script data-initial-scroll-position>
      if (!window.location.hash) {
        window.scrollTo(0, 0);
      }
    </script>
  HTML
end

Jekyll::Hooks.register :site, :post_render do |site|
  documents = site.pages + site.collections.values.flat_map(&:docs)

  documents.uniq.each do |document|
    next unless document.output_ext == ".html"
    next unless document.output&.include?("<head>")
    next if document.output.include?("data-initial-scroll-position")

    document.output.sub!("<head>", "<head>\n#{ChaeunSite::INITIAL_SCROLL_POSITION_SCRIPT}")
  end
end
