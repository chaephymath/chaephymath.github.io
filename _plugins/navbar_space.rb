# frozen_string_literal: true

# al_folio_core's progress-bar script adjusts the body padding after the
# window load event. With a multi-row navbar, that late adjustment causes a
# visible layout shift. Run the same measurement synchronously after the
# navbar is parsed but before the page content is parsed, so there is no
# content on screen to shift.
module ChaeunSite
  NAVBAR_SPACE_SCRIPT = <<~HTML.freeze
    <script data-navbar-space>
      (function () {
        var navbar = document.getElementById("navbar");
        if (!navbar || !document.body.classList.contains("fixed-top-nav")) return;

        navbar.querySelectorAll(".navbar-menu-list .nav-link").forEach(function (link) {
          link.style.whiteSpace = "nowrap";
        });

        var styles = window.getComputedStyle(navbar);
        var marginTop = parseFloat(styles.marginTop) || 0;
        var marginBottom = parseFloat(styles.marginBottom) || 0;
        var navbarHeight = Math.round(
          navbar.getBoundingClientRect().height + marginTop + marginBottom
        );

        document.body.style.paddingTop = navbarHeight + "px";

        var progress = document.getElementById("progress");
        if (progress) progress.style.top = navbarHeight + "px";
      })();
    </script>
  HTML
end

Jekyll::Hooks.register :site, :post_render do |site|
  documents = site.pages + site.collections.values.flat_map(&:docs)

  documents.uniq.each do |document|
    next unless document.output_ext == ".html"
    next unless document.output&.include?("</header>")
    next if document.output.include?("data-navbar-space")

    document.output.sub!("</header>", "</header>\n#{ChaeunSite::NAVBAR_SPACE_SCRIPT}")
  end
end
